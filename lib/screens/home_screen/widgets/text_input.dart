import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.inputTextController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController inputTextController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputTextController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
