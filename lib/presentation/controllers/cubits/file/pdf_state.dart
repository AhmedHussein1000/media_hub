import 'package:freezed_annotation/freezed_annotation.dart';
part 'pdf_state.freezed.dart';

@freezed
class PdfState with _$PdfState {
  const factory PdfState.initial() = _Initial;
  const factory PdfState.loading() = Loading;
  const factory PdfState.success(String path) = Success;
  const factory PdfState.error(String errMessage) = Failure;
}
