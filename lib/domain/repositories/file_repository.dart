import 'package:files/core/helpers/result.dart';

abstract class PdfRepository {
  Future<Result<String?>> pickPdfFile();
}
