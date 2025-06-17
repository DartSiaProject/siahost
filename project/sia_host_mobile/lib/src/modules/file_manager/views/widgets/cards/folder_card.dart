import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';

class FolderCard extends StatelessWidget {
  const FolderCard({required this.onTap, required this.name, super.key});

  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        CupertinoIcons.folder_solid,
        color: AppTheme.primaryColor,
        size: 50,
      ),
      title: Text(name),
    );
  }
}
