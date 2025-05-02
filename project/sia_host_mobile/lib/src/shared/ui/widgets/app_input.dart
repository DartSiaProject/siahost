import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

/// custom app input widget
///
/// show a label Text widget if labelText is not null
///
class AppInput extends StatelessWidget {
  /// Constructor for the AppInput widget
  const AppInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.autovalidateMode,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.autofillHints,
  });

  /// The controller for the text field
  final TextEditingController? controller;

  /// Callback function when the text changes
  final ValueChanged<String>? onChanged;

  /// Callback function when the text is submitted
  final ValueChanged<String>? onSubmitted;

  /// Validator function for the text field
  final FormFieldValidator<String>? validator;

  /// Autovalidate mode for the text field
  final AutovalidateMode? autovalidateMode;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Label text for the text field
  final String? labelText;

  /// Hint text for the text field
  final String? hintText;

  /// Keyboard type for the text field
  final TextInputType? keyboardType;

  /// Autofill for the text field
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: context.textTheme.titleMedium,
          ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
          autovalidateMode: autovalidateMode,
          focusNode: focusNode,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            hintText: hintText ?? labelText,
          ),
        ),
      ],
    );
  }
}
/// The AppInput widget is a custom input field that provides a consistent