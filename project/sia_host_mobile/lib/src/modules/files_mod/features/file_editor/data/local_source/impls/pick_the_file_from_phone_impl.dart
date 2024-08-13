import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/local_source/absts/pick_the_file_from_phone_abst.dart';
import 'package:sia_host_mobile/src/shared/services/files/requests/pick_single_file_request.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [pickTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 09/08/2024
/// updatedAt: #
///
@LazySingleton(as: PickTheFileFromPhoneAbst)
class PickTheFileFromPhoneImpl implements PickTheFileFromPhoneAbst {
  /// Note : This method help you to pick a file from phone
  @override
  Future<Map<String, dynamic>> pickTheFile() async {
    return await PickSingleFileRequest.pickOneFile();
  }
}
