import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.initial() = _Initial;

  const factory ImageState.loading() = Loading;
  const factory ImageState.success(File image) = Success;
  const factory ImageState.failure(String errorMessage) = Failure;
}
