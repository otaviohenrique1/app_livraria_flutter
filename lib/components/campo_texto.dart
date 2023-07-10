import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide:
          BorderSide(color: Colors.black, width: 2, style: BorderStyle.solid),
    );

    const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle,
        errorStyle: textStyle,
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
    );
  }
}
