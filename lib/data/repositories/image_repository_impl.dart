import 'dart:developer';
import 'dart:io';

import 'package:files/core/errors/exceptions.dart';
import 'package:files/core/helpers/result.dart';
import 'package:files/data/services/image_service.dart';
import 'package:files/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageService _imageService;

  ImageRepositoryImpl(this._imageService);

  @override
  Future<Result<File?>> pickFromGallery() async {
    try {
      final file = await _imageService.pickFromGallery();
      if (file == null) {
        return Result.failure('No image selected');
      }
      return Result.success(file);
    } on PermissionException catch (e) {
      return Result.failure(e.errorMessage);
    } catch (e) {
      log('error in pickFromGallery: $e');
      return Result.failure('Failed to pick image from gallery');
    }
  }

  @override
  Future<Result<File?>> takePhoto() async {
    try {
      final file = await _imageService.takePhoto();
      if (file == null) {
        return Result.failure('No image selected');
      }
      return Result.success(file);
    } catch (e) {
      log('error in takePhoto: $e');
      return Result.failure('Failed to take photo');
    }
  }
}
