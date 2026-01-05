import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key, this.indicatorColor});
  final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: indicatorColor ?? Colors.red),
    );
  }
}
