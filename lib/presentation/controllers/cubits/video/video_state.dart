import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state.freezed.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initial() = _VideoInitial;

  const factory VideoState.loading() = VideoLoading;

  const factory VideoState.loaded({
    required BetterPlayerController controller,
    @Default(0) int currentIndex,
    @Default([]) List<File> playlist,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(false) bool isPlaying,
    @Default(false) bool isShuffling,
    @Default(false) bool isLooping,
    @Default(false) bool isInitialized,
  }) = VideoLoaded;

  const factory VideoState.error({required String error}) = VideoError;
}
