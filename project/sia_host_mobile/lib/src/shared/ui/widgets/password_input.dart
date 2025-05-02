import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

/// Password input widget
///
class PasswordInput extends StatefulWidget {
  /// Constructor for the PasswordInput widget
  const PasswordInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.autovalidateMode,
    this.focusNode,
    this.labelText,
    this.hintText,
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

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  /// The state of the password input field
  bool _isObscured = true;

  /// Toggles the visibility of the password
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: context.textTheme.titleMedium,
          ),
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          focusNode: widget.focusNode,
          obscureText: _isObscured,
          obscuringCharacter: '●',
          decoration: InputDecoration(
            hintText: widget.hintText ?? widget.labelText,
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
