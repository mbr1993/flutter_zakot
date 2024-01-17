import 'package:flutter/material.dart';

AppBar homeScreenAppBar({
  required String title,
  required VoidCallback onPressed,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.green,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.menu),
      color: Colors.white,
    ),
  );
}
