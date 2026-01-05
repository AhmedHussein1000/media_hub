import 'dart:developer';
import 'dart:io';

import 'package:files/core/helpers/result.dart';
import 'package:files/data/services/audio_service.dart';
import 'package:files/domain/repositories/audio_repository.dart';

class AudioRepositoryImpl implements AudioRepository {
  final AudioService _audioService;

  AudioRepositoryImpl(this._audioService);

  @override
  Future<Result<List<File>>> pickAudioPlaylist() async {
    try {
      final files = await _audioService.pickAudioPlaylist();
      return Result.success(files);
    } catch (e) {
      log(e.toString());
      return Result.failure('Failed to pick audio playlist');
    }
  }
}
