import 'package:files/data/repositories/audio_repository_impl.dart';
import 'package:files/data/repositories/pdf_repository_impl.dart';
import 'package:files/data/repositories/image_repository_impl.dart';
import 'package:files/data/repositories/video_repository_impl.dart';
import 'package:files/data/services/audio_service.dart';
import 'package:files/data/services/pdf_service.dart';
import 'package:files/data/services/image_service.dart';
import 'package:files/data/services/video_service.dart';
import 'package:files/domain/repositories/audio_repository.dart';
import 'package:files/domain/repositories/file_repository.dart';
import 'package:files/domain/repositories/image_repository.dart';
import 'package:files/domain/repositories/video_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';

GetIt getIt = GetIt.instance;
void serviceLocator() {
  getIt.registerLazySingleton(() => ImagePicker());
  getIt.registerLazySingleton(() => AudioPlayer());
  //services
  getIt.registerLazySingleton(() => ImageService(getIt()));
  getIt.registerLazySingleton(() => VideoService());
  getIt.registerLazySingleton(() => AudioService());
  getIt.registerLazySingleton(() => PdfService());
  //repositories
  getIt.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<AudioRepository>(
    () => AudioRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<PdfRepository>(() => PdfRepositoryImpl(getIt()));
}
