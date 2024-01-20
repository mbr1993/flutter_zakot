import 'package:flutter/material.dart';

TextField customTextField({
  required String helperText,
  required TextEditingController controller,
}) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: '0',
      floatingLabelBehavior: FloatingLabelBehavior.always,
      helperText: helperText,
      helperMaxLines: 6,
      helperStyle: TextStyle(color: Colors.green,  fontSize: 15),
    ),
  );
}
