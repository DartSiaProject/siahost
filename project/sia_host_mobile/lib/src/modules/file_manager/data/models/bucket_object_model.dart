import 'package:flutter/widgets.dart';
import 'package:mime/mime.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

class BucketObjectModel {
  BucketObjectModel({
    required this.bucket,
    required this.key,
    required this.size,
    required this.isFolder,
    required this.health,
    this.etag,
    this.modTime,
    this.mimeType,
    this.childrenCount,
  });

  factory BucketObjectModel.fromJson(Map<String, dynamic> json) {
    var key = json['name'] as String;
    if (key.startsWith('/')) {
      // remove the leading slash
      key = key.substring(1);
    }
    final isFolder = key.endsWith('/');
    return BucketObjectModel(
      bucket: json['bucket'] as String,
      key: key,
      size: json['size'] as int,
      etag: json['etag'] as String? ?? '',
      health: (json['health'] as num).toDouble(),
      modTime: json['modTime'] == null
          ? null
          : DateTime.parse(json['modTime'] as String),
      isFolder: isFolder,
      mimeType: json['mimeType'] as String? ?? '',
      childrenCount:
          json['childrenCount'] as int?, // optional, backend may provide
    );
  }
  final String bucket;
  final String key;
  final int size;
  final double health;
  final bool isFolder;
  final String? etag;
  final DateTime? modTime;
  final String? mimeType;
  final int? childrenCount;

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'bucket': bucket,
      'key': key,
      'size': size,
      'etag': etag,
      'health': health,
      'modTime': modTime?.toIso8601String(),
      'isFolder': isFolder,
      'mimeType': mimeType,
      'childrenCount': childrenCount,
    };
  }

  // copyWith
  BucketObjectModel copyWith({
    String? bucket,
    String? key,
    int? size,
    double? health,
    bool? isFolder,
    String? etag,
    DateTime? modTime,
    String? mimeType,
    int? childrenCount,
  }) {
    return BucketObjectModel(
      bucket: bucket ?? this.bucket,
      key: key == null
          ? this.key
          : key.startsWith('/')
              ? key.substring(1)
              : key,
      size: size ?? this.size,
      health: health ?? this.health,
      isFolder: isFolder ?? this.isFolder,
      etag: etag ?? this.etag,
      modTime: modTime ?? this.modTime,
      mimeType: mimeType ?? this.mimeType,
      childrenCount: childrenCount ?? this.childrenCount,
    );
  }

  String get name {
    final parts = key.split('/');
    return isFolder ? parts[parts.length - 2] : parts.last;
  }

  String get nameWithoutExtension {
    if (isFolder) return name;
    final parts = key.split('.');
    return parts.length > 1
        ? parts.sublist(0, parts.length - 1).join('.')
        : name;
  }

  String get displayName {
    if (isFolder) return name;

    if (type == SupportedFileType.other) {
      return name;
    }
    return nameWithoutExtension;
  }

  String get extension {
    if (isFolder) return '';
    final ext = key.split('.').lastOrNull;
    return ext != null ? '.$ext' : '';
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
