import 'package:flutter/material.dart';

Padding zakotTypeCard({
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}