import 'dart:async';

import 'package:files/core/helpers/result.dart';
import 'package:files/domain/repositories/audio_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioRepository _audioRepository;
  final AudioPlayer _player;

  bool _manualLoopOne = false;
  int? _loopTargetIndex;
  bool _isSeekingBack = false;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<int?>? _indexSubscription;
  StreamSubscription<bool>? _playingSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  AudioCubit(this._audioRepository, this._player)
    : super(const AudioState.initial()) {
    _positionSubscription = _player.positionStream.listen((position) {
      if (state is AudioLoaded) {
        emit((state as AudioLoaded).copyWith(position: position));
      }
    });

    _indexSubscription = _player.currentIndexStream.listen((
      currentIndex,
    ) async {
      if (state is AudioLoaded) {
        if (_manualLoopOne &&
            _loopTargetIndex != null &&
            currentIndex != _loopTargetIndex &&
            !_isSeekingBack) {
          _isSeekingBack = true;
          await _player.seek(Duration.zero, index: _loopTargetIndex!);
          await _player.play();
          _isSeekingBack = false;
        } else {
          emit(
            (state as AudioLoaded).copyWith(currentIndex: currentIndex ?? 0),
          );
        }
      }
    });

    _playingSubscription = _player.playingStream.listen((playing) {
      if (state is AudioLoaded) {
        emit((state as AudioLoaded).copyWith(isPlaying: playing));
      }
    });

    _playerStateSubscription = _player.playerStateStream.listen((
      playerState,
    ) async {
      if (_manualLoopOne &&
          _loopTargetIndex != null &&
          playerState.processingState == ProcessingState.completed &&
          !_isSeekingBack) {
        _isSeekingBack = true;
        await _player.seek(Duration.zero, index: _loopTargetIndex!);
        await _player.play();
        _isSeekingBack = false;
      }
    });
  }

  Future<void> _restartCurrentAudio() async {
    await _player.seek(Duration.zero);
    await _player.play();
  }

  Future<void> loadPlaylist() async {
    emit(const AudioState.loading());
    final result = await _audioRepository.pickAudioPlaylist();
    result.when(
      success: (playlist) async {
        if (playlist.isEmpty) {
          emit(const AudioState.error(error: 'No audio files selected'));
          return;
        }
        try {
          final audioSources = playlist
              .map((file) => AudioSource.uri(Uri.parse(file.path)))
              .toList();
          await _player.setAudioSources(audioSources);
          emit(AudioState.loaded(player: _player, playlist: playlist));
        } catch (e) {
          emit(
            AudioState.error(error: 'Failed to load audio: ${e.toString()}'),
          );
        }
      },
      failure: (error) => emit(AudioState.error(error: error)),
    );
  }

  Future<void> playPause() async {
    if (state is AudioLoaded) {
      if ((state as AudioLoaded).isPlaying) {
        await _player.pause();
      } else {
        await _player.play();
      }
    }
  }

  Future<void> seekTo(Duration position) async {
    if (state is AudioLoaded) {
      await _player.seek(position);
    }
  }

  Future<void> setSpeed(double speed) async {
    if (state is AudioLoaded) {
      await _player.setSpeed(speed);
      emit((state as AudioLoaded).copyWith(speed: speed));
    }
  }

  Future<void> setShuffle() async {
    if (state is AudioLoaded) {
      bool newShuffle = !_player.shuffleModeEnabled;
      await _player.setShuffleModeEnabled(newShuffle);
      emit((state as AudioLoaded).copyWith(isShuffle: newShuffle));
    }
  }

  Future<void> setRepeatMode(LoopMode loopMode) async {
    if (state is AudioLoaded) {
      if (loopMode == LoopMode.one) {
        _manualLoopOne = true;
        _loopTargetIndex = _player.currentIndex ?? 0;
        await _player.setLoopMode(LoopMode.off);
      } else {
        _manualLoopOne = false;
        _loopTargetIndex = null;
        await _player.setLoopMode(loopMode);
      }
      emit((state as AudioLoaded).copyWith(loopMode: loopMode));
    }
  }

  Future<void> next() async {
    if (state is AudioLoaded) {
      final s = state as AudioLoaded;
      if (s.playlist.length == 1) {
        await _restartCurrentAudio();
        return;
      } else if (s.loopMode == LoopMode.off && !_player.hasNext) {
        return;
      }

      if (_manualLoopOne) {
        int nextIndex = (_player.currentIndex ?? 0) + 1;
        if (nextIndex >= s.playlist.length) {
          nextIndex = 0;
        }
        _loopTargetIndex = nextIndex;
      }
      await _player.seekToNext();
    }
  }

  Future<void> previous() async {
    if (state is AudioLoaded) {
      final s = state as AudioLoaded;
      if (s.playlist.length == 1) {
        await _restartCurrentAudio();
        return;
      } else if (s.loopMode == LoopMode.off && !_player.hasPrevious) {
        return;
      }

      if (_manualLoopOne) {
        int prevIndex = (_player.currentIndex ?? 0) - 1;
        if (prevIndex < 0) {
          prevIndex = s.playlist.length - 1;
        }
        _loopTargetIndex = prevIndex;
      }
      await _player.seekToPrevious();
    }
  }

  Future<void> selectTrack(int index) async {
    if (state is AudioLoaded) {
      final s = (state as AudioLoaded);
      if (index >= 0 && index < s.playlist.length) {
        if (_manualLoopOne) {
          _loopTargetIndex = index;
        }
        await _player.seek(Duration.zero, index: index);
        await _player.play();
      }
    }
  }

  @override
  Future<void> close() async {
    await _indexSubscription?.cancel();
    await _playerStateSubscription?.cancel();
    await _positionSubscription?.cancel();
    await _playingSubscription?.cancel();
    await _player.dispose();
    return super.close();
  }
}
