import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/shared/helpers/asset_helper.dart';

class FileCard extends StatelessWidget {
  const FileCard({required this.onTap, required this.fileObject, super.key});

  final VoidCallback onTap;
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: AssetHelper.getfileObjectWidget(fileObject),
      title: Text(
        fileObject.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(fileObject.sizeFormatted(context)),
      ),
      trailing: const Icon(
        Icons.more_vert,
        color: AppTheme.primaryColor,
      ),
    );
  }
}
