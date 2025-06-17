import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/shared/helpers/asset_helper.dart';

class FilePickerContainer extends StatefulWidget {
  const FilePickerContainer({
    required this.onFilePicked,
    super.key,
  });
  final void Function(PlatformFile? file) onFilePicked;

  @override
  State<FilePickerContainer> createState() => _FilePickerContainerState();
}

class _FilePickerContainerState extends State<FilePickerContainer> {
  // File path && picker
  BucketObjectModel? _fileObject;

  final FilePicker _picker = FilePicker.platform;

  /// Pick a file
  ///
  /// Choose from camera to Gallery source
  ///
  Future<void> _pickFile() async {
    final result = await _picker.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      widget.onFilePicked(file);

      setState(() {
        _fileObject = BucketObjectModel(
          bucket: '',
          key: file.name,
          size: file.size,
          isFolder: false,
          health: 1,
        );
      });
    }
  }

  /// Remove a file
  ///
  void _removeFile() {
    widget.onFilePicked(null);
    setState(() {
      _fileObject = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: Card(
        margin: const EdgeInsets.only(top: 16),
        elevation: 2,
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _fileObject == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      const Icon(
                        Icons.file_upload_outlined,
                        size: 50,
                        color: Colors.grey,
                      ),
                      Text(context.l10n.pickFileTitle),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    // show file extension,file name and size
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.boxBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            AssetHelper.getfileObjectLeadingWidget(
                              _fileObject!,
                            ),
                            Text(
                              _fileObject!.name,
                              style: const TextStyle(color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              _fileObject!.sizeFormatted(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 8,
                      right: 8,
                      child: Card(
                        shape: const StadiumBorder(),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: _removeFile,
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: _pickFile,
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
