import 'package:flutter/material.dart';

import '../../../../shared/constants/colors_const.dart';

class NotificationDetailRow extends StatelessWidget {
  const NotificationDetailRow({
    super.key,
    required this.value,
    this.label,
    this.labelColor = ColorsApp.caribbeanGreenColor,
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
        // direction: Axis.horizontal,
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
