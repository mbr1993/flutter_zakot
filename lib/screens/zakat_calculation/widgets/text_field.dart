import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.helperText,
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final String helperText;
  final TextEditingController controller;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: '0',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        helperText: helperText,
        helperMaxLines: 6,
        helperStyle: const TextStyle(color: Colors.green, fontSize: 15),
      ),
    );
  }
}
