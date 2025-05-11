import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_view_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/viewers/audio_viewer.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/viewers/image_viewer.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/viewers/pdf_viewer.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/viewers/video_viewer.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/orientation_wrapper.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class FileViewerPage extends StatelessWidget {
  const FileViewerPage({required this.fileObject, super.key});
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileViewCubit(di.get())..openFileObject(fileObject),
      child: FileViewerView(
        fileObject: fileObject,
      ),
    );
  }
}

class FileViewerView extends StatelessWidget {
  const FileViewerView({required this.fileObject, super.key});
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return OrientationWrapper(
      child: BlocBuilder<FileViewCubit, FileViewState>(
        builder: (context, state) {
          if (state is FileViewLoading) {
            return const AppLoader();
          }

          if (state is FileViewFailure) {
            return AppErrorWidget(
              onRefresh: () {},
              message: translateErrorMessage(context, state.error),
            );
          }

          if (state is FileViewSuccess) {
            final fileType = fileObject.type;
            final filePath = state.filePath;

            if (fileType == SupportedFileType.video) {
              return VideoViewer(filePath: filePath);
            }

            if (fileType == SupportedFileType.pdf) {
              return PdfViewer(filePath: filePath);
            }

            if (fileType == SupportedFileType.image) {
              return ImageViewer(filePath: filePath);
            }

            if (fileType == SupportedFileType.audio) {
              return AudioViewer(filePath: filePath);
            }

            return Scaffold(
              appBar: AppBar(title: Text(p.basename(filePath))),
              body: Center(child: Text(context.l10n.unsupportedFileNotice)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
