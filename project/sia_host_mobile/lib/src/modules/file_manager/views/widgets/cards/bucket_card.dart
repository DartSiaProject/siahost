import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';

class BucketCard extends StatelessWidget {
  const BucketCard({required this.onTap, required this.name, super.key});

  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: const Badge(
        alignment: Alignment.topLeft,
        label: Icon(
          Icons.online_prediction_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        child: Icon(
          CupertinoIcons.folder_solid,
          color: AppTheme.primaryColor,
          size: 50,
        ),
      ),
      title: Text(name),
    );
  }
}
