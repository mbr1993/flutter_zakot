import 'package:flutter/material.dart';
import 'package:flutter_zakot/widgets/alert_dialog.dart';

FloatingActionButton homeScreenFAB({
  required BuildContext context,
  required VoidCallback? onPressed,
}) {
  return FloatingActionButton.extended(
    backgroundColor: Colors.green,
    onPressed: () {
      customAlertDialog(
        context,
        content:
            ' Islomning uchinchi rukni bo‘lgan zakotni ado etish har bir boy musulmonning zimmasidagi masʼuliyat sanaladi.'
            '\n\n Zakotni to‘g‘ri hisoblash ushbu amalning mukammal bo‘lishini taʼminlaydi.'
            '\n\n Sizga taqdim qilingan ushbu hisoblagich shaxsiy va tadbirkorlik faoliyatingizdan zakotingizni tez va oson hisoblashga yordam beradi.'
            '\n\n Har bir bo‘lim va har bir katakchaga (i) ko‘rinishida izoh ko‘rsatilgan. Zakotingizni to‘g‘ri hisoblash uchun har bir izohni o‘qing.',
        negativeButtonText: 'Ortga',
        negativeButtonPressed: () => Navigator.pop(context),
        positiveButtonText: 'Davom etish',
        positiveButtonPressed: onPressed,
      );
    },
    label: const Text('Zakotni Hisoblash', style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.calculate_outlined, color: Colors.white),
    elevation: 12,
  );
}
