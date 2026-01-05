import 'package:files/core/functions/format_time.dart';
import 'package:flutter/material.dart';

class MediaTimeInfo extends StatelessWidget {
  const MediaTimeInfo({
    super.key,
    required this.position,
    required this.duration,
  });

  final Duration position;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(formatTime(position)), Text(formatTime(duration))],
    );
  }
}
