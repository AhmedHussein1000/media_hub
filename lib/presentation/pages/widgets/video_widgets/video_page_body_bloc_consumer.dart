import 'package:files/core/functions/custom_snackbar.dart';
import 'package:files/core/widgets/custom_circular_progress_indicator.dart';
import 'package:files/presentation/controllers/cubits/video/video_cubit.dart';
import 'package:files/presentation/controllers/cubits/video/video_state.dart';
import 'package:flutter/material.dart';
import 'package:files/presentation/pages/widgets/media_title.dart';
import 'package:files/presentation/pages/widgets/video_widgets/video_player_widget.dart';
import 'package:files/presentation/pages/widgets/video_widgets/video_playlist_sliver.dart';
import 'package:files/presentation/pages/widgets/video_widgets/video_controls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:files/core/functions/get_file_name.dart';
import 'package:files/core/widgets/custom_message.dart';

class VideoPageBodyBlocConsumer extends StatelessWidget {
  const VideoPageBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCubit, VideoState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            customSnackBar(
              context,
              message: error,
              backgroundColor: Colors.redAccent,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<VideoCubit>();

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: cubit.loadPlaylist,
                      icon: const Icon(Icons.playlist_add),
                      label: const Text('Choose Playlist'),
                    ),
                    const SizedBox(height: 16),
                    state.maybeWhen(
                      loaded:
                          (
                            controller,
                            currentIndex,
                            playlist,
                            position,
                            duration,
                            isPlaying,
                            isShuffling,
                            isLooping,
                            isInitialized,
                          ) {
                            if (!isInitialized) {
                              return const CustomCircularProgressIndicator();
                            }

                            return Column(
                              spacing: 10.0,
                              children: [
                                VideoPlayerWidget(controller: controller),
                                MediaTitle(
                                  title: getFileName(playlist[currentIndex].path),
                                ),
                                VideoControls(
                                  isShuffling: isShuffling,
                                  isLooping: isLooping,
                                  currentIndex: currentIndex,
                                  playlistLength: playlist.length,
                                  onShufflePressed: cubit.toggleShuffle,
                                  onPreviousPressed: cubit.previous,
                                  onNextPressed: cubit.next,
                                  onLoopPressed: cubit.toggleLooping,
                                ),
                              ],
                            );
                          },
                      orElse: () => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            //playlist
            state.maybeWhen(
              loading: () => const SliverFillRemaining(
                child: CustomCircularProgressIndicator(),
              ),
              loaded:
                  (
                    controller,
                    currentIndex,
                    playlist,
                    position,
                    duration,
                    isPlaying,
                    isShuffling,
                    isLooping,
                    isInitialized,
                  ) {
                    if (playlist.isEmpty) {
                      return const SliverFillRemaining(
                        child: CustomMessage(message: 'No video selected'),
                      );
                    }
                    if (playlist.length == 1) {
                      return const SliverFillRemaining(
                        child: SizedBox.shrink(),
                      );
                    }
                    return VideoPlaylistSliver(
                      playlist: playlist,
                      currentIndex: currentIndex,
                    );
                  },
              orElse: () => const SliverFillRemaining(
                child: CustomMessage(
                  message: 'Select a video or playlist to Watch',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
