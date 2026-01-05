import 'package:files/core/di/service_locator.dart';
import 'package:files/presentation/pages/widgets/audio_widgets/audio_page_body_bloc_consumer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubits/audio/audio_cubit.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(getIt(), getIt()),
      child: AudioPageBodyBlocConsumer(),
    );
  }
}

