import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/constants/pngs_const.dart';
import 'package:sia_host_mobile/src/shared/extensions/string_ext.dart';

enum FileTypeEnum {
  image,
  video,
  audio,
  text,
  document,
  pdf,
  font,
  archive,
  unknown,
  vector,
}

class FileManagerHelper {
  static FileTypeEnum getType(FileEntity file) {
    // final lowerMime = file.mimeType.toLowerCase();

    // print("MimeType: ${file.name}");

    // if (lowerMime.startsWith('image')) return FileTypeEnum.image;
    // if (lowerMime.startsWith('video')) return FileTypeEnum.video;
    // if (lowerMime.startsWith('audio')) return FileTypeEnum.audio;
    // if (lowerMime.startsWith('text')) return FileTypeEnum.text;
    // if (lowerMime.startsWith('font')) return FileTypeEnum.font;
    // if (lowerMime.startsWith('model')) return FileTypeEnum.vector;

    // if (lowerMime.startsWith('application/pdf')) return FileTypeEnum.pdf;

    final fileExt = file.name.getExtFile();

    switch (fileExt) {
      case '.apng':
      case '.avif':
      case '.gif':
      case '.jpeg':
      case '.jpg':
      case '.png':
      case '.tif':
      case '.tiff':
      case '.webp':
      case '.ico':
      case '.bmp':
        return FileTypeEnum.image;
      case '.3gp':
      case '.mp4':
      case '.mpeg':
      case '.avi':
      case '.mkv':
      case '.ogv':
      case '.ogg':
      case '.webm':
      case '.flv':
      case '.m4v':
      case '.3g2':
        return FileTypeEnum.video;
      case '.aac':
      case '.m4a':
      case '.mp3':
      case '.oga':
      case '.opus':
      case '.wav':
        return FileTypeEnum.audio;
      case '.txt':
      case '.log':
      case '.csv':
      case '.xml':
      case '.css':
      case '.html':
      case '.htm':
      case '.js':
      case '.json':
        return FileTypeEnum.text;
      case '.woff2':
      case '.woff':
      case '.ttf':
      case '.otf':
        return FileTypeEnum.font;
      case '.ai':
      case '.ps':
      case '.eps':
      case '.svg':
        return FileTypeEnum.vector;
      case '.7z':
      case '.zip':
      case '.tar':
      case '.rar':
      case '.gz':
      case '.bz':
      case '.bz2':
      case '.arc':
      case '.jar':
        return FileTypeEnum.archive;
      case '.docx':
      case '.odt':
      case '.pptx':
      case '.xlsx':
        return FileTypeEnum.document;
      default:
        return FileTypeEnum.unknown;
    }
  }

  static String thumbnail(FileTypeEnum typeEnum) {
    switch (typeEnum) {
      case FileTypeEnum.archive:
        return Pngs.archiveFilePng;
      case FileTypeEnum.audio:
        return Pngs.audioFilePng;
      case FileTypeEnum.document:
        return Pngs.documentFilePng;
      case FileTypeEnum.font:
        return Pngs.fontFilePng;
      case FileTypeEnum.image:
        return Pngs.imageFilePng;
      case FileTypeEnum.pdf:
        return Pngs.pdfFilePng;
      case FileTypeEnum.text:
        return Pngs.textFilePng;
      case FileTypeEnum.vector:
        return Pngs.vectorFilePng;
      case FileTypeEnum.video:
        return Pngs.videoFilePng;
      case FileTypeEnum.unknown:
        return Pngs.unknownFilePng;
    }
  }

  static Future<void> open(FileEntity file,
      {FileTypeEnum? fileTypeEnum}) async {
    return;
  }
}
