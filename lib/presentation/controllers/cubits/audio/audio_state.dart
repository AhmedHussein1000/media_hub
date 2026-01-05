import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_state.freezed.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState.initial() = _AudioInitial;

  const factory AudioState.loading() = AudioLoading;

  const factory AudioState.loaded({
    required AudioPlayer player,
    @Default(0) int currentIndex,
    @Default([]) List<File> playlist,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(false) bool isPlaying,
    @Default(false) bool isShuffle,
    @Default(1.0) double speed,
    @Default(LoopMode.off) LoopMode loopMode,
  }) = AudioLoaded;

  const factory AudioState.error({required String error}) = AudioError;
}
