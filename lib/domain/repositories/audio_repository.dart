import 'dart:io';

import 'package:files/core/helpers/result.dart';

abstract class AudioRepository {
  Future<Result<List<File>>> pickAudioPlaylist();
}
