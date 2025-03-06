import 'package:intl/intl.dart';

import '../constants/string_const.dart';

extension StringExtensions on String {
  String capitalizeLetter() {
    if ((this).isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return "";
    }
  }

  bool hasValidAddress() {
    return RegExp(urlPattern, caseSensitive: false).hasMatch(this);
  }

  // String hasFileOrFolderTypeByExtension() {
  //   var _fileName = this;
  //   var _extFile = ".${_fileName.split('.').last}";

  //   switch (_extFile) {
  //     case ".png":
  //       return Pngs.pngFilePng;
  //     case ".jpg":
  //       return Pngs.jpgFilePng;
  //     case ".jpeg":
  //       return Pngs.jpegFilePng;
  //     case ".pdf":
  //       return Pngs.pdfFilePng;
  //     default:
  //       return Pngs.folderPng;
  //   }
  // }

  // String thumbnailByFileMimeType() {
  //   toLowerCase();

  //   if (startsWith('image')) return Pngs.imageFilePng;
  //   if (startsWith('video')) return Pngs.videoFilePng;
  //   if (startsWith('audio')) return Pngs.audioFilePng;
  //   if (startsWith('font')) return Pngs.fontFilePng;
  //   if (startsWith('model')) return Pngs.vectorFilePng;
  //   if (startsWith('text')) return Pngs.textFilePng;

  //   return Pngs.unknownFilePng;
  // }

  String getExtFile() {
    var _fileName = this;
    var _extFile = ".${_fileName.split('.').last}";
    return _extFile;
  }

  String timeConverter() {
    var _time = DateFormat('dd/MM/yyyy').format(DateTime.parse(this));
    return _time;
  }
}
