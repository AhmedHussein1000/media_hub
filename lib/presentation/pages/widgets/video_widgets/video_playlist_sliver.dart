import 'dart:io';
import 'package:files/core/functions/get_file_name.dart';
import 'package:files/presentation/controllers/cubits/video/video_cubit.dart';
import 'package:files/presentation/pages/widgets/video_widgets/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPlaylistSliver extends StatelessWidget {
  const VideoPlaylistSliver({
    super.key,
    required this.playlist,
    required this.currentIndex,
  });

  final List<File> playlist;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VideoCubit>();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          final title = getFileName(playlist[index].path);
          final isCurrent = index == currentIndex;
          return Column(
            children: [
              if (index > 0) const Divider(height: 1),
              VideoItem(
                title: title,
                isCurrent: isCurrent,
                onItemTapped: () => cubit.selectVideo(index),
              ),
            ],
          );
        },
      ),
    );
  }
}
