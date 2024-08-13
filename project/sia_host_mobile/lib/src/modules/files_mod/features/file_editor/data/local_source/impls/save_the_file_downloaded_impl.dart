import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/local_source/absts/save_the_file_downloaded_abst.dart';
import 'package:sia_host_mobile/src/shared/services/files/requests/save_file_request.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [saveTheFileDownloaded]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 13/08/2024
/// updatedAt: #
@LazySingleton(as: SaveTheFileDownloadedAbst)
class SaveTheFileDownloadedImpl implements SaveTheFileDownloadedAbst {
  /// Note : This funtion allow to save in device

  @override
  Future<Map<String, dynamic>> saveTheFileDownload({
    required String fileNameWithExtension,
    required Uint8List fileBytes,
  }) async {
    return await SaveFileRequest.saveTheFileDownloaded(
      fileNameWithExtension: fileNameWithExtension,
      fileBytes: fileBytes,
    );
  }
}
