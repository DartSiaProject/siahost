import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

enum SnackBarType { error, success, warning, info, normal }

class AppSnackBar {
  AppSnackBar._();

  static Future<void> success({
    required String message,
    String? title,
    BuildContext? context,
  }) async {
    return _show(
      message: message,
      title: title,
      context: context,
      backgroundColor: Colors.green,
    );
  }

  static Future<void> error({
    required String message,
    String? title,
    BuildContext? context,
  }) async {
    return _show(
      message: message,
      title: title,
      context: context,
      backgroundColor: Colors.red,
    );
  }

  static Future<void> warning({
    required String message,
    String? title,
    BuildContext? context,
  }) async {
    return _show(
      message: message,
      title: title,
      context: context,
      backgroundColor: Colors.yellow,
      textColor: Colors.black,
    );
  }

  static Future<void> info({
    required String message,
    String? title,
    BuildContext? context,
  }) async {
    return _show(
      message: message,
      title: title,
      context: context,
      backgroundColor: Colors.blue,
    );
  }

  static Future<void> normal({
    required String message,
    String? title,
    BuildContext? context,
  }) async {
    return _show(
      message: message,
      title: title,
      context: context,
    );
  }

  static Future<void> _show({
    required String message,
    String? title,
    BuildContext? context,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    String? action,
    VoidCallback? onAction,
    Color closeIconColor = Colors.white,
    bool showCloseIcon = false,
  }) async {
    final content = (title == null || title.isEmpty)
        ? Text(
            message,
            style: TextStyle(color: textColor, fontSize: 16),
          )
        : Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                message,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ],
          );

    final snackBar = SnackBar(
      content: content,
      duration: duration,
      action: action != null
          ? SnackBarAction(
              label: action,
              textColor: Colors.white,
              onPressed: onAction ?? () {},
            )
          : null,
      backgroundColor: backgroundColor.withValues(alpha: 0.9),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: 16.h,
        left: 16.w,
        right: 16.w,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: const EdgeInsets.all(16),
      dismissDirection: DismissDirection.down,
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
      elevation: 10,
    );

    // ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    if (context != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return;
    } else {
      scaffoldMessengerKey.currentState
        ?..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return;
    }
  }
}
