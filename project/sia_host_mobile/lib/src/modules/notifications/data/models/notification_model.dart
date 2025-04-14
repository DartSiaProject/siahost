import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

enum NotificationSeverity {
  info('Info'),
  warning('Warning'),
  error('Error'),
  critical('Critical'),
  unknown('Unknown');

  final String desc;
  const NotificationSeverity(this.desc);
}

class NotificationModel extends Equatable {
  final String id;
  final NotificationSeverity severity;
  final String message;
  final NotificationDataModel? data;
  final DateTime timestamp;

  const NotificationModel({
    required this.id,
    required this.severity,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
        id,
        severity,
        message,
        data,
        timestamp,
      ];

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      severity: json['severity'] != null
          ? NotificationSeverity.values.firstWhere(
              (e) => e.name == json['severity'].toString().toLowerCase(),
              orElse: () => NotificationSeverity.unknown,
            )
          : NotificationSeverity.unknown,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? NotificationDataModel.fromJson(json['data'])
          : null,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }
}

class NotificationDataModel extends Equatable {
  final String? hint;
  final String? name;

  const NotificationDataModel({
    this.hint,
    this.name,
  });

  @override
  List<Object?> get props => [
        hint,
        name,
      ];

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationDataModel(
      hint: json['hint'] as String? ?? '---',
      name: json['name'] as String? ?? '---',
    );
  }
}

extension NotificationX on NotificationModel {
  /// Formatted date string
  /// the format is day.month.year hour:minute
  /// e.g. 01.01.2022 12:00
  /// Using intl package for formatting
  String get formattedDate {
    return DateFormat('dd.MM.yyyy HH:mm').format(timestamp);
  }
}
