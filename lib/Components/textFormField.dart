import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool isEmailField;
  final bool isPasswordField;
  final Color textColor;
  final Color labelColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.isEmailField = false,
    this.isPasswordField = false,
    this.textColor = Colors.black,
    this.labelColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.errorBorderColor = Colors.red,
    this.focusedErrorBorderColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: isEmailField ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: labelColor),
        hintStyle: TextStyle(color: textColor),
        errorText: _getErrorText(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedErrorBorderColor),
        ),
      ),
      style: TextStyle(color: textColor),
      validator: (value) {
        if (isEmailField && (value == null || value.isEmpty || !isValidEmail(value))) {
          return 'Please enter a valid email address';
        } else if (isPasswordField && (value == null || value.isEmpty)) {
          return 'Please enter a password';
        }
        return null;
      },
    );
  }

  String? _getErrorText() {
    if (isEmailField && controller.text.isNotEmpty && !isValidEmail(controller.text)) {
      return 'Invalid email format';
    } else if (isPasswordField && controller.text.isNotEmpty && controller.text.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool isValidEmail(String email) {
    // You can use a more robust email validation logic here
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
  }
}
