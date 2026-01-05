import 'dart:io';
import 'package:file_picker/file_picker.dart';

class VideoService {
  Future<List<File>> pickVideoPlaylist() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      return result.files
          .where((f) => f.path != null)
          .map((f) => File(f.path!))
          .toList();
    }
    return [];
  }
}
