import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_action/can_open_file_widget.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_action/copy_file_widget.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_action/delete_file_widget.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_action/download_file_widget.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_action/rename_file_widget.dart';
import 'package:sia_host_mobile/src/shared/helpers/asset_helper.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_bottom_sheet.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class FileCard extends StatelessWidget {
  const FileCard({
    required this.fileObject,
    required this.onRenamed,
    required this.onDeleted,
    super.key,
  });
  final BucketObjectModel fileObject;
  final void Function(String newName) onRenamed;
  final void Function() onDeleted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListTile(
      onTap: () {
        _onOpenFile(context);
      },
      contentPadding: EdgeInsets.zero,
      leading: AssetHelper.getfileObjectLeadingWidget(fileObject),
      title: Text(
        fileObject.displayName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(fileObject.sizeFormatted(context)),
      ),
      trailing: PopupMenuButton<FileActionEnum>(
        color: AppTheme.boxBgColor,
        onSelected: (value) {
          if (value == FileActionEnum.open) {
            _onOpenFile(context);
          } else if (value == FileActionEnum.rename) {
            _onRenameFile(context);
          } else if (value == FileActionEnum.copy) {
            _onCopyFile(context);
          } else if (value == FileActionEnum.delete) {
            _onDeleteFile(context);
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: FileActionEnum.open,
            child: Text(l10n.openFile),
          ),
          PopupMenuItem(
            value: FileActionEnum.rename,
            child: Text(l10n.renameFile),
          ),
          PopupMenuItem(
            value: FileActionEnum.copy,
            child: Text(l10n.copyFile),
          ),
          PopupMenuItem(
            value: FileActionEnum.delete,
            child: Text(
              l10n.deleteFile,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onOpenFile(BuildContext context) async {
    final result = await AppBottomSheet.show<OpeningFileStatus>(
      context,
      child: CanOpenFileWidget(fileObject: fileObject),
    );

    if (result == null) return;

    switch (result) {
      case OpeningFileStatus.canOpen:
        // open a full dialog screen to show the file
        await context.pushRoute(
          FileViewerRoute(fileObject: fileObject),
        );
      case OpeningFileStatus.canNotOpen:
        await AppBottomSheet.show<bool>(
          context,
          child: DownloadFileWidget(fileObject: fileObject),
        );
    }
  }

  void _onCopyFile(BuildContext context) {
    AppBottomSheet.show<bool>(
      context,
      child: CopyFileWidget(fileObject: fileObject),
    );
  }

  Future<void> _onRenameFile(BuildContext context) async {
    final newName = await AppBottomSheet.show<String>(
      context,
      child: RenameFileWidget(fileObject: fileObject),
    );

    if (newName != null && newName.isNotEmpty) {
      onRenamed(newName);
    }
  }

  Future<void> _onDeleteFile(BuildContext context) async {
    final result = await AppBottomSheet.show<bool>(
      context,
      child: DeleteFileWidget(fileObject: fileObject),
    );

    if (result ?? false) {
      onDeleted.call();
    }
  }
}
