import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/widgets/custom_formfield.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String headingText;
  final String hintText;
  final ValueChanged<String>? onSubmitted;
  const PasswordFormField(
      {super.key,
      required this.controller,
      required this.headingText,
      required this.hintText,
      this.onSubmitted});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
        headingText: widget.headingText,
        maxLines: 1,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,
        hintText: widget.hintText,
        obsecureText: obscureText,
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.white),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        controller: widget.controller,
        onSubmitted: widget.onSubmitted);
  }
}
