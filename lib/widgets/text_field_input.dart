import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final bool isPass;
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(8.0)),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
