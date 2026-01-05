import 'dart:io';
import 'package:files/core/utils/constants.dart';
import 'package:files/presentation/controllers/cubits/audio/audio_cubit.dart';
import 'package:files/presentation/pages/widgets/custom_action_buttons.dart';
import 'package:files/presentation/pages/widgets/custom_media_options.dart';
import 'package:files/presentation/pages/widgets/media_progress_slider.dart';
import 'package:files/presentation/pages/widgets/media_time_info.dart';
import 'package:files/presentation/pages/widgets/media_title.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({
    super.key,
    required this.title,
    required this.position,
    required this.duration,
    required this.isPlaying,
    required this.playlist,
    required this.speed,
    required this.loopIcon,
    required this.loopMode,
    required this.isShuffle,
    required this.cubit,
    required this.sliderValue,
    required this.sliderMax, required this.currentIndex,
  });

  final String title;
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final int currentIndex;
  final List<File> playlist;
  final double speed;
  final IconData loopIcon;
  final LoopMode loopMode;
  final bool isShuffle;
  final AudioCubit cubit;
  final double sliderValue;
  final double sliderMax;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomActionButtons(
          isPlaying: isPlaying,
          onPreviousButtonPressed:
              (playlist.length <= 1 ||
                  (loopMode == LoopMode.off && currentIndex <= 0))
              ?null
              : cubit.previous,
          onPlayPauseButtonPressed: playlist.isNotEmpty
              ? cubit.playPause
              : null,
          onNextButtonPressed: (playlist.length <= 1 ||
                  (loopMode == LoopMode.off && currentIndex >= playlist.length - 1))
              ?null
              : cubit.next,
          playPauseColor: Colors.blueAccent,
        ),
        const SizedBox(height: 12),
        MediaTitle(title: title),
        MediaProgressSlider(
          value: sliderValue,
          max: sliderMax,
          onChanged: (v) => cubit.seekTo(Duration(milliseconds: v.round())),
          activeColor: Colors.blueAccent,
        ),
        MediaTimeInfo(position: position, duration: duration),
        const SizedBox(height: 8),
        CustomMediaOptions(
          speeds: Constants.speeds,
          onAudioLoopModeSelected: playlist.length > 1
              ? cubit.setRepeatMode
              : null,
          initialSpeed: speed,
          onSpeedSelected: cubit.setSpeed,
          audioLoopMode: loopMode,
          isShuffle: isShuffle,
          onShufflePressed: playlist.length > 1
              ? () => cubit.setShuffle()
              : null,
        ),
      ],
    );
  }
}
