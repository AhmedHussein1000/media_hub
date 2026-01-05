import 'package:files/presentation/controllers/cubits/audio/audio_cubit.dart';
import 'package:files/presentation/controllers/cubits/audio/audio_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:files/core/functions/custom_snackbar.dart';
import 'package:files/core/functions/get_file_name.dart';
import 'package:files/core/functions/get_audio_loop_icon.dart';
import 'package:files/core/widgets/custom_circular_progress_indicator.dart';
import 'package:files/core/widgets/custom_message.dart';
import 'package:files/presentation/pages/widgets/audio_widgets/audio_player_widget.dart';
import 'package:files/presentation/pages/widgets/audio_widgets/audio_playlist.dart';

class AudioPageBodyBlocConsumer extends StatelessWidget {
  const AudioPageBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioCubit, AudioState>(
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
        final cubit = context.read<AudioCubit>();

        return Padding(
          padding: const EdgeInsets.all(12),
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
                      player,
                      currentIndex,
                      playlist,
                      position,
                      duration,
                      isPlaying,
                      isShuffle,
                      speed,
                      loopMode,
                    ) {
                      final String title =
                          playlist.isNotEmpty &&
                              currentIndex >= 0 &&
                              currentIndex < playlist.length
                          ? getFileName(playlist[currentIndex].path)
                          : 'No Audio selected';
                      final d = player.duration ?? duration;
                      final max = (d.inMilliseconds > 0 ? d.inMilliseconds : 1)
                          .toDouble();
                      final value = position.inMilliseconds
                          .clamp(0, max.toInt())
                          .toDouble();
                      final loopIcon = getAudioLoopIcon(loopMode);

                      return AudioPlayerWidget(
                        title: title,
                        position: position,
                        duration: d,
                        isPlaying: isPlaying,
                        currentIndex: currentIndex,
                        playlist: playlist,
                        speed: speed,
                        loopIcon: loopIcon,
                        loopMode: loopMode,
                        isShuffle: isShuffle,
                        cubit: cubit,
                        sliderValue: value,
                        sliderMax: max,
                      );
                    },
                orElse: () => const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),

              // Playlist
              Expanded(
                child: state.maybeWhen(
                  loading: () => const CustomCircularProgressIndicator(
                    indicatorColor: Colors.blue,
                  ),
                  loaded:
                      (
                        player,
                        currentIndex,
                        playlist,
                        position,
                        duration,
                        isPlaying,
                        isShuffle,
                        speed,
                        loopMode,
                      ) {
                        if (playlist.isEmpty) {
                          return const CustomMessage(
                            message: 'No playlist selected',
                          );
                        }
                        if (playlist.length == 1) {
                          return SizedBox.shrink();
                        }
                        return AudioPlaylist(
                          playlist: playlist,
                          currentIndex: currentIndex,
                        );
                      },
                  orElse: () => const CustomMessage(
                    message: 'Pick an audio playlist to listen',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
