import 'package:flutter/widgets.dart';
import 'package:mime/mime.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

class BucketObjectModel {
  BucketObjectModel({
    required this.bucket,
    required this.key,
    required this.size,
    required this.etag,
    required this.health,
    required this.modTime,
    required this.isFolder,
    this.mimeType,
    this.childrenCount,
  });

  factory BucketObjectModel.fromJson(Map<String, dynamic> json) {
    final key = json['key'] as String;
    final isFolder = key.endsWith('/');
    return BucketObjectModel(
      bucket: json['bucket'] as String,
      key: key,
      size: json['size'] as int,
      etag: json['etag'] as String,
      health: (json['health'] as num).toDouble(),
      modTime: DateTime.parse(json['modTime'] as String),
      isFolder: isFolder,
      mimeType: json['mimeType'] as String? ?? '',
      childrenCount:
          json['childrenCount'] as int?, // optional, backend may provide
    );
  }
  final String bucket;
  final String key;
  final int size;
  final String etag;
  final double health;
  final DateTime modTime;
  final bool isFolder;
  final String? mimeType;
  final int? childrenCount;

  String get name {
    final parts = key.split('/');
    return isFolder ? parts[parts.length - 2] : parts.last;
  }

  String sizeFormatted(BuildContext context) {
    final l10n = context.l10n;
    if (size < 1024) {
      return '$size ${l10n.byte}';
    }

    // kilobyte
    var customSize = size / 1024;
    if (customSize < 1024) {
      return '${customSize.toStringAsFixed(2)} ${l10n.kiloByte}';
    }

    // mega byte
    customSize /= 1024;
    if (customSize < 1024) {
      return '${customSize.toStringAsFixed(2)} ${l10n.megaByte}';
    }

    // giga byte
    customSize /= 1024;
    if (customSize < 1024) {
      return '${customSize.toStringAsFixed(2)} ${l10n.gigaByte}';
    }

    // tera byte
    customSize /= 1024;
    if (customSize < 1024) {
      return '${customSize.toStringAsFixed(2)} ${l10n.teraByte}';
    }

    customSize /= 1024;
    return '${customSize.toStringAsFixed(2)} ${l10n.petaByte}';
  }

  SupportedFileType get type {
    if (isFolder) return SupportedFileType.other;

    String? objMimeType = mimeType ?? '';
    if (objMimeType.isEmpty) objMimeType = lookupMimeType(name);

    if (objMimeType == null) return SupportedFileType.other;

    if (objMimeType.contains('image')) return SupportedFileType.image;
    if (objMimeType.contains('video')) return SupportedFileType.video;
    if (objMimeType.contains('audio')) return SupportedFileType.audio;

    if (_isArchive(objMimeType)) return SupportedFileType.archive;
    if (_isPDF(objMimeType)) return SupportedFileType.pdf;
    if (_isTxt(objMimeType)) return SupportedFileType.txt;
    if (_isWordDoc(objMimeType)) return SupportedFileType.document;

    return SupportedFileType.other;
  }

  bool _isPDF(String mime) {
    return mime.contains('pdf');
  }

  bool _isWordDoc(String mime) {
    return mime.contains('msword') ||
        mime.contains('vnd.openxmlformats-officedocument.wordprocessingml');
  }

  bool _isTxt(String mime) {
    return mime.contains('text');
  }

  bool _isArchive(String mime) {
    return mime.contains('application/zip') ||
        mime.contains('application/x-rar-compressed') ||
        mime.contains('application/x-7z-compressed');
  }
}
