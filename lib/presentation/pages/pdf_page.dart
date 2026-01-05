import 'dart:io';

import 'package:files/core/di/service_locator.dart';
import 'package:files/core/widgets/custom_message.dart';
import 'package:flutter/material.dart';
import 'package:files/core/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubits/file/pdf_cubit.dart';
import '../controllers/cubits/file/pdf_state.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PdfCubit(getIt()),
      child: BlocBuilder<PdfCubit, PdfState>(
        builder: (context, state) {
          final cubit = context.read<PdfCubit>();
          return Column(
            children: [
              ElevatedButton.icon(
                onPressed: cubit.pickPdfFile,
                icon: const Icon(Icons.upload_file_outlined),
                label: const Text('Upload PDF'),
              ),
              const SizedBox(height: 16),
              state.maybeWhen(
                loading: () =>
                    Expanded(child: CustomCircularProgressIndicator()),
                success: (path) => Expanded(
                  child: SfPdfViewer.file(
                    File(path),
                    scrollDirection: PdfScrollDirection.vertical,
                    
                  ),
                ),
                error: (errMessage) =>
                    Expanded(child: CustomMessage(message: errMessage)),
                orElse: SizedBox.shrink,
              ),
            ],
          );
        },
      ),
    );
  }
}
