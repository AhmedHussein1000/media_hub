import 'package:flutter/material.dart';

class VideoControls extends StatelessWidget {
  const VideoControls({
    super.key,
    required this.isShuffling,
    required this.isLooping,
    required this.currentIndex,
    required this.playlistLength,
    required this.onShufflePressed,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.onLoopPressed,
  });

  final bool isShuffling;
  final bool isLooping;
  final int currentIndex;
  final int playlistLength;
  final VoidCallback? onShufflePressed;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onLoopPressed;

  @override
  Widget build(BuildContext context) {
    final hasSingleVideo = playlistLength <= 1;
    final isFirst = currentIndex <= 0;
    final isLast = currentIndex >= playlistLength - 1;

    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          tooltip: 'Shuffle',
          onPressed: hasSingleVideo ? null : onShufflePressed,
          icon: Icon(
            isShuffling ? Icons.shuffle_on_rounded : Icons.shuffle_rounded,
            color: isShuffling ? Colors.red : null,
          ),
          iconSize: 28,
        ),
        IconButton(
          tooltip: 'Previous',
          onPressed: ((isFirst && !hasSingleVideo) || hasSingleVideo)
              ? null
              : onPreviousPressed,
          icon: const Icon(Icons.skip_previous_rounded),
          iconSize: 40,
        ),
        IconButton(
          tooltip: 'Next',
          onPressed: ((isLast && !hasSingleVideo)||hasSingleVideo) ? null : onNextPressed,
          icon: const Icon(Icons.skip_next_rounded),
          iconSize: 40,
        ),
        IconButton(
          tooltip: 'Loop',
          onPressed: hasSingleVideo ? null : onLoopPressed,
          icon: Icon(Icons.loop_rounded, color: isLooping ? Colors.red : null),
          iconSize: 28,
        ),
      ],
    );
  }
}
