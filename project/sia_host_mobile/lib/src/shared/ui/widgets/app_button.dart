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
    return FilledButton.tonalIcon(
      onPressed: isLoading ? null : onPressed,
      icon: icon != null
          ? Icon(
              icon,
              color: Colors.white,
            )
          : null,
      label: Text(label),
    );
  }
}
