import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, {required String message,Color? backgroundColor,int? seconds}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor??SnackBarThemeData().backgroundColor,
      duration:  Duration(seconds: seconds?? 2),
    ),
  );
}