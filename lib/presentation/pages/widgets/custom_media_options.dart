import 'package:files/core/functions/get_audio_loop_icon.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CustomMediaOptions extends StatelessWidget {
  const CustomMediaOptions({
    super.key,
    required this.speeds,
    required this.initialSpeed,
    required this.onSpeedSelected,
    this.audioLoopMode,
    this.onAudioLoopModeSelected,
    required this.isShuffle,
    required this.onShufflePressed,
  });
  final double initialSpeed;
  final List<double> speeds;
  final void Function(double)? onSpeedSelected;
  final LoopMode? audioLoopMode;
  final void Function(LoopMode)? onAudioLoopModeSelected;
  final bool isShuffle;
  final void Function()? onShufflePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PopupMenuButton<double>(
          tooltip: 'Playback Speed',
          initialValue: initialSpeed,
          icon: const Icon(Icons.speed_rounded),
          onSelected: onSpeedSelected,
          itemBuilder: (ctx) => speeds
              .map((s) => PopupMenuItem<double>(value: s, child: Text('${s}x')))
              .toList(),
        ),
        const SizedBox(width: 8),

       PopupMenuButton<LoopMode>(
                tooltip: 'Loop Mode',
                initialValue: audioLoopMode,
                icon: Icon(getAudioLoopIcon(audioLoopMode!)),
                onSelected: onAudioLoopModeSelected,
                itemBuilder: (ctx) => const [
                  PopupMenuItem(value: LoopMode.off, child: Text('Loop Off')),
                  PopupMenuItem(value: LoopMode.one, child: Text('Loop One')),
                  PopupMenuItem(value: LoopMode.all, child: Text('Loop All')),
                ],
              ),
        if (onShufflePressed != null)
          IconButton(
            tooltip: 'Shuffle',
            onPressed: onShufflePressed,
            icon: Icon(
              isShuffle ? Icons.shuffle_on_rounded : Icons.shuffle_rounded,
            ),
          ),
      ],
    );
  }
}
