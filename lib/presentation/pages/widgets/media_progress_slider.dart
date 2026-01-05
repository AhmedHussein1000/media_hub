import 'package:flutter/material.dart';

class MediaProgressSlider extends StatelessWidget {
  const MediaProgressSlider({
    super.key,
    required this.value,
    required this.max,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
  });

  final double value;
  final double max;
  final ValueChanged<double> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 0,
      max: max,
      onChanged: onChanged,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
    );
  }
}
