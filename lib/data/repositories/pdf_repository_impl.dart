import 'package:files/core/helpers/result.dart';
import 'package:files/data/services/pdf_service.dart';
import 'package:files/domain/repositories/file_repository.dart';

class PdfRepositoryImpl implements PdfRepository {
  final PdfService _fileService;
  PdfRepositoryImpl(this._fileService);
  @override
  Future<Result<String?>> pickPdfFile() async {
    try {
      final path = await _fileService.pickPdfFile();
      if (path == null) {
        return Result.failure('No file selected');
      }
      return Result.success(path);
    } catch (e) {
      return Result.failure('Failed to pick PDF file');
    }
  }
}
