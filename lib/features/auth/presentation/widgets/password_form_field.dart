import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required TextEditingController passwordController,
    required this.title,
    required this.hintText,
    required this.validator,
    this.showError = true,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final String title;
  final String hintText;
  final Function(String?) validator;
  final bool showError;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget._passwordController,
      hintText: widget.hintText,
      validator: widget.validator,
      isObscureText: _isObscured,
      title: widget.title,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        icon: Icon(
          _isObscured ? Icons.visibility : Icons.visibility_off_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
