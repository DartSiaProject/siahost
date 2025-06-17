import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';

class Breadcrumbs extends StatelessWidget implements PreferredSizeWidget {
  const Breadcrumbs({required this.prefix, required this.onTap, super.key});
  final String? prefix;
  final ValueChanged<String?> onTap;

  @override
  Widget build(BuildContext context) {
    final parts = (prefix ?? '').split('/').where((e) => e.isNotEmpty).toList();
    final crumbs = <Widget>[];
    String? currentPrefix;

    crumbs.add(
      GestureDetector(
        onTap: () => onTap(null),
        child: Text(
          '...',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    for (var i = 0; i < parts.length; i++) {
      currentPrefix = (currentPrefix == null)
          ? '${parts[i]}/'
          : '$currentPrefix${parts[i]}/';
      crumbs
        ..add(const Icon(Icons.chevron_right, size: 18))
        ..add(
          GestureDetector(
            onTap: () => onTap(currentPrefix),
            child: Text(
              parts[i],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight:
                    i == parts.length - 1 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
    }

    return crumbs.length == 1
        ? const SizedBox.shrink()
        : Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: AppTheme.boxBgColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: crumbs,
              ),
            ),
          );
  }

  @override
  Size get preferredSize =>
      prefix == null ? Size.zero : const Size.fromHeight(kToolbarHeight);
}
