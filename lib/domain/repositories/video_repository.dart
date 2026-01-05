import 'dart:io';
import 'package:files/core/helpers/result.dart';

abstract class VideoRepository {
  Future<Result<List<File>>> pickVideoPlaylist();
}
