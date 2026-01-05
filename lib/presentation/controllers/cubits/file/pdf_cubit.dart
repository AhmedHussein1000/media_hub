import 'package:files/core/helpers/result.dart';
import 'package:files/domain/repositories/file_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  final PdfRepository _fileRepository;

  PdfCubit(this._fileRepository) : super(const PdfState.initial());
  Future<void> pickPdfFile() async {
    emit(const PdfState.loading());
    final result = await _fileRepository.pickPdfFile();
    result.when(
      success: (path) => emit(PdfState.success(path!)),
      failure: (errMessage) => emit(PdfState.error(errMessage)),
    );
  }
}
