import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

enum NotificationSeverity {
  info('Info'),
  warning('Warning'),
  error('Error'),
  critical('Critical'),
  unknown('Unknown');

  const NotificationSeverity(this.desc);
  final String desc;
}

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.id,
    required this.severity,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String? ?? '',
      severity: json['severity'] != null
          ? NotificationSeverity.values.firstWhere(
              (e) => e.name == json['severity'].toString().toLowerCase(),
              orElse: () => NotificationSeverity.unknown,
            )
          : NotificationSeverity.unknown,
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? NotificationDataModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : DateTime.now(),
    );
  }
  final String id;
  final NotificationSeverity severity;
  final String message;
  final NotificationDataModel? data;
  final DateTime timestamp;

  @override
  List<Object?> get props => [
        id,
        severity,
        message,
        data,
        timestamp,
      ];
}

class NotificationDataModel extends Equatable {
  const NotificationDataModel({
    this.hint,
    this.name,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationDataModel(
      hint: json['hint'] as String? ?? '---',
      name: json['name'] as String? ?? '---',
    );
  }
  final String? hint;
  final String? name;

  @override
  List<Object?> get props => [
        hint,
        name,
      ];
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
