import 'dart:developer';
import 'dart:io';

import 'package:files/core/helpers/result.dart';
import 'package:files/data/services/video_service.dart';
import 'package:files/domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoService _videoService;

  VideoRepositoryImpl(this._videoService);

  @override
  Future<Result<List<File>>> pickVideoPlaylist() async {
    try {
      final files = await _videoService.pickVideoPlaylist();
      if (files.isEmpty) {
        return Result.failure('No videos selected');
      }
      return Result.success(files);
    } catch (e) {
      log('error in pickVideoPlaylist: ${e.toString()}');
      return Result.failure('Failed to pick video playlist');
    }
  }
}
