import 'dart:io';

import 'package:file_picker/file_picker.dart';

class AudioService {
  Future<List<File>> pickAudioPlaylist() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      return result.files
          .where((file) => file.path != null)
          .map((file) => File(file.path!))
          .toList();
    }
    return [];
  }
}
