import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/preview/audio_preview_widget.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/preview/image_preview_widget.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/preview/pdf_preview_widget.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/preview/text_preview_widget.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/preview/unsupported_file_preview_widget.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/preview/video_preview_widget.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';
import 'package:sia_host_mobile/src/shared/helpers/file_manager_helper.dart';

@RoutePage()
class FilePreviewScreen extends StatelessWidget {
  final FileEntity file;

  const FilePreviewScreen({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: _filePreviewer(file.typeEnum),
    );
    // return _filePreviewer(file.typeEnum);
  }

  Widget _filePreviewer(FileTypeEnum type) {
    switch (type) {
      case FileTypeEnum.image:
        return ImagePreviewWidget(file: file);
      case FileTypeEnum.video:
        return VideoPreviewWidget(file: file);
      case FileTypeEnum.audio:
        return AudioPreviewWidget(file: file);
      case FileTypeEnum.text:
        return TextPreviewWidget(file: file);
      case FileTypeEnum.pdf:
        return PdfPreviewWidget(file: file);
      default:
        return UnsupportedFilePreview();
    }
  }
}
