import 'package:flutter/material.dart';
import 'package:files/core/di/service_locator.dart';
import 'package:files/presentation/pages/widgets/video_widgets/video_page_body_bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubits/video/video_cubit.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(getIt()),
      child: VideoPageBodyBlocConsumer(),
    );
  }
}
