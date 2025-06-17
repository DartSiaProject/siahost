import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';

class NotificationDetailRow extends StatelessWidget {
  const NotificationDetailRow({
    required this.value,
    super.key,
    this.label,
    this.labelColor = AppTheme.primaryColor,
    this.valueColor = Colors.white,
  });

  final String? label;
  final String value;
  final Color labelColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (label != null)
            Text(
              label!,
              style: TextStyle(
                color: labelColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          Expanded(
            child: Text(
              value,
              textAlign: label != null ? TextAlign.end : TextAlign.justify,
              style: TextStyle(
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
