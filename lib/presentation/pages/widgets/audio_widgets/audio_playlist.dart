import 'dart:io';

import 'package:files/core/functions/get_file_name.dart';
import 'package:files/presentation/controllers/cubits/audio/audio_cubit.dart';
import 'package:files/presentation/pages/widgets/audio_widgets/audio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudioPlaylist extends StatelessWidget {
  const AudioPlaylist({
    super.key,
    required this.playlist,
    required this.currentIndex,
  });
  final List<File> playlist;
  final int currentIndex;
  
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AudioCubit>();
    return ListView.separated(
      itemCount: playlist.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final title = getFileName(playlist[index].path);
        final isCurrent = index == currentIndex;
        return AudioItem(
          title: title,
          isCurrent: isCurrent,
          onItemTapped: () => cubit.selectTrack(index),
        );
      },
    );
  }
}
