import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.label,
    this.icon,
    this.isLoading = false,
    this.isFullSized = false,
    this.isCentered = false,
    super.key,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final bool isFullSized;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CupertinoActivityIndicator(
              color: context.primaryColor,
            ),
          )
        : isCentered
            ? Center(
                child: _buildButton(context),
              )
            : _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: isFullSized ? MainAxisSize.max : MainAxisSize.min,
        spacing: 8,
        children: [
          if (icon != null) Icon(icon),
          if (icon != null) const SizedBox(width: 8),
          Text(
            label,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
