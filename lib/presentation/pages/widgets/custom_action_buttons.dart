import 'package:flutter/material.dart';

class CustomActionButtons extends StatelessWidget {
  const CustomActionButtons({
    super.key,
    required this.onPreviousButtonPressed,
    required this.onNextButtonPressed,
    required this.onPlayPauseButtonPressed,
    required this.isPlaying, this.playPauseColor,
  });
  final bool isPlaying;
  final void Function()? onPreviousButtonPressed;
  final void Function()? onNextButtonPressed;
  final void Function()? onPlayPauseButtonPressed;
  final Color? playPauseColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          tooltip: 'Previous',
          onPressed: onPreviousButtonPressed,
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        IconButton(
          onPressed: onPlayPauseButtonPressed,
          icon: Icon(
            isPlaying
                ? Icons.pause_circle_filled_rounded
                : Icons.play_circle_fill_rounded,
            size: 28,
            color: playPauseColor,
          ),
        ),
        IconButton(
          tooltip: 'Next',
          onPressed: onNextButtonPressed,
          icon: const Icon(Icons.skip_next_rounded),
        ),
      ],
    );
  }
}
