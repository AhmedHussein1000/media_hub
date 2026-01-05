import 'dart:async';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:files/core/helpers/result.dart';
import 'package:files/domain/repositories/video_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepository _videoRepository;
  BetterPlayerController? _controller;
  StreamSubscription? _positionSubscription;
  bool _isTransitioning = false;
  bool _isDisposing = false;

  VideoCubit(this._videoRepository) : super(const VideoState.initial());

  void _startPositionListener() {
    _positionSubscription?.cancel();
    _positionSubscription = Stream.periodic(
      const Duration(milliseconds: 500),
    ).listen((_) => _onPositionChanged());
  }

  void _onPositionChanged() {
    if (_isDisposing || _isTransitioning) return;
    if (_controller == null) return;
    if (state is! VideoLoaded) return;

    final controller = _controller;
    if (controller == null) return;

    final videoController = controller.videoPlayerController;
    if (videoController == null) return;
    try {
      if (!videoController.value.initialized) return;

      final s = state as VideoLoaded;
      final position = videoController.value.position;
      final duration = videoController.value.duration;
      final isPlaying = videoController.value.isPlaying;

      emit(s.copyWith(position: position, isPlaying: isPlaying));

      _handleVideoCompletion(position, duration ?? Duration.zero, s);
    } catch (e) {
      return;
    }
  }

  void _handleVideoCompletion(
    Duration position,
    Duration duration,
    VideoLoaded s,
  ) async {
    if (_isTransitioning) return;

    if (position >= duration - const Duration(milliseconds: 500) &&
        duration > Duration.zero) {
      if (s.isLooping) {
        await _restartCurrentVideo();
      } else {
        await next();
      }
    }
  }

  Future<void> loadPlaylist() async {
    emit(const VideoState.loading());
    final result = await _videoRepository.pickVideoPlaylist();
    result.when(
      success: (playlist) async {
        if (playlist.isEmpty) {
          emit(const VideoState.error(error: 'No videos selected'));
          return;
        }
        try {
          await _disposeController();

          final controller = BetterPlayerController(
            const BetterPlayerConfiguration(
              controlsConfiguration: BetterPlayerControlsConfiguration(
                enableFullscreen: false,
                controlsHideTime:Duration(milliseconds: 100),
                controlBarColor: Colors.black12
              ),
            ),
            betterPlayerDataSource: BetterPlayerDataSource(
              BetterPlayerDataSourceType.file,
              playlist[0].path,
            ),
          );
          _controller = controller;

          await Future.delayed(const Duration(milliseconds: 500));
          _startPositionListener();

          final videoDuration =
              controller.videoPlayerController?.value.duration ?? Duration.zero;

          emit(
            VideoState.loaded(
              controller: controller,
              playlist: playlist,
              duration: videoDuration,
              isInitialized: true,
            ),
          );
        } catch (e) {
          emit(
            VideoState.error(error: 'Failed to load video: ${e.toString()}'),
          );
        }
      },
      failure: (error) => emit(VideoState.error(error: error)),
    );
  }

  Future<void> _restartCurrentVideo() async {
    await _controller?.seekTo(Duration.zero);
    await _controller?.play();
  }

  Future<void> _switchToVideo(int index, VideoLoaded s) async {
    if (index < 0 || index >= s.playlist.length || index == s.currentIndex) return;
    if (_isTransitioning) return;

    _isTransitioning = true;

    try {
      await _disposeController();

      final newController = BetterPlayerController(
        BetterPlayerConfiguration(
             looping: s.isLooping,
              controlsConfiguration: BetterPlayerControlsConfiguration(
                enableFullscreen: false,
                controlsHideTime:Duration(milliseconds: 100),
                controlBarColor: Colors.black12
              ),
            ),
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.file,
          s.playlist[index].path,
        ),
      );
      _controller = newController;

      await Future.delayed(const Duration(milliseconds: 500));
      _startPositionListener();

      emit(
        s.copyWith(
          controller: newController,
          currentIndex: index,
          duration:
              newController.videoPlayerController?.value.duration ??
              Duration.zero,
          isInitialized: true,
        ),
      );
    } catch (e) {
      emit(VideoState.error(error: 'Failed to play video: ${e.toString()}'));
    } finally {
      _isTransitioning = false;
    }
  }

  Future<void> playPause() async {
    if (_isControllerValid()) {
      final s = state as VideoLoaded;
      if (s.isPlaying) {
        await _controller!.pause();
      } else {
        await _controller!.play();
      }
    }
  }

  Future<void> seekTo(Duration position) async {
    if (_isControllerValid()) {
      await _controller!.seekTo(position);
    }
  }

  Future<void> toggleShuffle() async {
    if (state is VideoLoaded) {
      final s = state as VideoLoaded;
      emit(s.copyWith(isShuffling: !s.isShuffling));
    }
  }

  Future<void> toggleLooping() async {
    if (_isControllerValid()) {
      final s = state as VideoLoaded;
      final newLooping = !s.isLooping;
      await _controller!.setLooping(newLooping);
      emit(s.copyWith(isLooping: newLooping));
    }
  }

  Future<void> next() async {
    if (_isTransitioning) return;

    if (state is VideoLoaded) {
      final s = state as VideoLoaded;
      if (s.playlist.length == 1) {
        await _restartCurrentVideo();
        return;
      }
      int nextIndex;
      if (s.isShuffling) {
        nextIndex = _getRandomIndex(s);
      } else {
        if (s.currentIndex >= s.playlist.length - 1) {
          await _controller?.pause();
          return;
        }
        nextIndex = s.currentIndex + 1;
      }

      await _switchToVideo(nextIndex, s);
    }
  }

  Future<void> previous() async {
    if (_isTransitioning) return;

    if (state is VideoLoaded) {
      final s = state as VideoLoaded;
      if (s.playlist.length == 1) {
        await _restartCurrentVideo();
        return;
      }
      if (s.currentIndex <= 0) {
        await _controller?.pause();
        return;
      }
      int prevIndex;
      if (s.isShuffling) {
        prevIndex = _getRandomIndex(s);
      } else {
        prevIndex = (s.currentIndex - 1) % s.playlist.length;
      }
      await _switchToVideo(prevIndex, s);
    }
  }

  Future<void> selectVideo(int index) async {
    if (state is VideoLoaded) {
      final s = state as VideoLoaded;
        await _switchToVideo(index, s);
    }
  }

  int _getRandomIndex(VideoLoaded state) {
    final availableIndices = List.generate(
      state.playlist.length,
      (i) => i,
    ).where((i) => i != state.currentIndex).toList();

    if (availableIndices.isNotEmpty) {
      availableIndices.shuffle();
      return availableIndices.first;
    }
    return state.currentIndex;
  }

  bool _isControllerValid() =>
      state is VideoLoaded &&
      _controller != null &&
      (_controller!.videoPlayerController?.value.initialized ?? false);

  Future<void> _disposeController() async {
    _isDisposing = true;
    _positionSubscription?.cancel();
    _positionSubscription = null;
    final controllerToDispose = _controller;
    _controller = null;
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      await controllerToDispose?.pause();
      controllerToDispose?.dispose();
    } catch (e) {}
    _isDisposing = false;
  }

  @override
  Future<void> close() async {
    await _disposeController();
    return super.close();
  }
}
