abstract class SaveTheFileDownloadedAbst {
  Future<Map<String, dynamic>> saveTheFileDownload({
    required String fileNameWithExtension,
    required List<int> fileBytes,
  });
}
