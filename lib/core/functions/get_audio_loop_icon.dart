import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

IconData getAudioLoopIcon(LoopMode audioLoopMode) {
  switch (audioLoopMode) {
    case LoopMode.one:
      return Icons.repeat_one_rounded;
    case LoopMode.all:
      return Icons.repeat_on_rounded;
    case LoopMode.off:
      return Icons.repeat_rounded;
  }
}
