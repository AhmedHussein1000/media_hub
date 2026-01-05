import 'package:files/core/helpers/result.dart';
import 'package:files/domain/repositories/image_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImageRepository _imageRepository;

  ImageCubit(this._imageRepository) : super(const ImageState.initial());

  Future<void> pickFromGallery() async {
    emit(const ImageState.loading());
    final result = await _imageRepository.pickFromGallery();
    result.when(
      success: (image) => emit(ImageState.success(image!)),
      failure: (errorMessage) => emit(ImageState.failure(errorMessage)),
    );
  }

  Future<void> takePhoto() async {
    emit(const ImageState.loading());
    final result = await _imageRepository.takePhoto();
    result.when(
      success: (image) => emit(ImageState.success(image!)),
      failure: (errorMessage) => emit(ImageState.failure(errorMessage)),
    );
  }

  void clear() {
    emit(const ImageState.initial());
  }
}
