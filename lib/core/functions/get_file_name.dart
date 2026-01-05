import 'package:path/path.dart' as p;

String getFileName(String? path) {
  if(path==null||path.isEmpty) return '';
  return p.basename(path);
} 
