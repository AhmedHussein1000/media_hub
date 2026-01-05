import 'dart:io';

import 'package:files/core/helpers/result.dart';

abstract class ImageRepository {
  Future<Result<File?>> pickFromGallery();
  Future<Result<File?>> takePhoto();
}
