import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class StockInvestmentScreen extends StatelessWidget {
  const StockInvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Investitsiya va aksiyalar')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    String text = '''
  Aksiyalarni sotish yoki ushlab turish niyatiga qarab zakot ikki usulda hisoblanadi:
    1.Qisqa vaqt mobaynida oldi-sotdi qilish ko‘zlangan aksiyalar: ularning joriy bozor narxidan zakot hisoblanadi;
    2.Uzoq muddat egalik qilish va dividend to‘lovlarini olish ko‘zlangan aksiyalar: xalqaro standartlarga ko‘ra bunday turdagi aksiyalarning 50% qiymatidan zakot to‘lanadi (sababi kompaniyaning asosiy vositalaridan zakot to‘lanmaydi).
Biznesga investitsiyalar
    • Agar siz biror biznesga sarmoya kirgazgan passiv investor bo‘lsangiz, korxonaning moliyaviy hisobotlari sizda to‘liq bo‘lmasa, ushbu bo‘limdan foydalaning. Xalqaro standartlarga ko‘ra bunday turdagi investitsiyalarning 50% qiymatidan zakot to‘lanadi.
    • Agar siz biror biznesga sarmoya kirgazgan bo‘lsangiz, biznesning moliyaviy hisobotlari sizda bo‘lsa (korxona balansi: undagi pul, xom ashyo va tovarlar, debitorlik va kreditorlik qarzlari kabi), “Biznesga oid” bo‘limidan foydalanishingizni maslahat beramiz. Unda korxona boyliklarining sizga tegishli qismidan zakot hisoblanadi.
    (i) tugmasini bosib qo‘shimcha misollar bilan tanishing.
    ''';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            Text(
              ' Investitsiya va aksiyalar zakotga tortiladigan boylik hisoblanadi. Ushbu investitsiya va aksiyalarning joriy bozor qiymatini kiriting.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ExpandableText(
              text,
              expandText: 'Ko\'proq ko\'rish',
              maxLines: 3,
              collapseText: 'Yopish',
              collapseOnTextTap: true,
              style: TextStyle(fontSize: 16),
              expandOnTextTap: true,
              linkStyle: const TextStyle(color: Colors.deepOrange, fontSize: 16),
              animation: true,
            ),
            const SizedBox(height: 30),
            customTextField(
                helperText: 'Oldi-sotdi maqsadida olingan aksiyalar', controller: TextEditingController(text: '0')),
            const SizedBox(height: 30),
            customTextField(
                helperText: 'Uzoq muddat egalik qilish maqsadida olingan aksiyalar',
                controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(
                helperText: 'Sherikchilik va boshqa uzoq muddatli passiv investitsiyalar',
                controller: TextEditingController()),
            const SizedBox(height: 30),
            Text('Jami miqdor:', style: TextStyle(fontSize: 18)),
            Text('0 so\'m', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomTextButton(title: 'Ortga', onPressed: () => Navigator.pop(context), color: Colors.red),
                const SizedBox(width: 20),
                CustomTextButton(title: 'Davom etish', onPressed: () {}, color: Colors.green)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
