import 'dart:io';
import 'package:files/core/di/service_locator.dart';
import 'package:files/core/widgets/custom_circular_progress_indicator.dart';
import 'package:files/core/widgets/custom_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubits/image/image_cubit.dart';
import '../controllers/cubits/image/image_state.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(getIt()),
      child: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          final cubit = context.read<ImageCubit>();
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: cubit.pickFromGallery,
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Choose from gallery'),
                ),
                ElevatedButton.icon(
                  onPressed: cubit.takePhoto,
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('Take a photo'),
                ),
                const SizedBox(height: 16),
                state.maybeWhen(
                  loading: () =>
                      Expanded(child: CustomCircularProgressIndicator()),
                  success: (image) => Expanded(child: _ImageView(image: image)),
                  failure: (errorMessage) =>
                      Expanded(child: CustomMessage(message: errorMessage)),
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  final File? image;
  const _ImageView({required this.image});

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const CustomMessage(message: 'No image selected');
    }
    return InteractiveViewer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          image!,
          height: 300,
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) =>
              const CustomMessage(message: 'Failed to load image'),
        ),
      ),
    );
  }
}
