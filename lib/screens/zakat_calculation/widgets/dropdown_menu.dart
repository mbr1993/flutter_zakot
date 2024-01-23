import 'package:flutter/material.dart';

DropdownMenu<String> customDropdownMenu({
  required String initialSelection,
  required List<String> menuList,
  required void Function(String?)? onSelected,
}) {
  return DropdownMenu(
    initialSelection: initialSelection,
    dropdownMenuEntries: menuList.map<DropdownMenuEntry<String>>(
      (String item) {
        return DropdownMenuEntry<String>(
          value: item,
          label: item,
        );
      },
    ).toList(),
    requestFocusOnTap: true,
    onSelected: onSelected,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      fillColor: Colors.grey[200],
      filled: true,
    ),
  );
}
