import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class LoansGivenScreen extends StatelessWidget {
  const LoansGivenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berilgan shaxsiy qarzlar')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    String text = '''
    Eʼtibor bering: Korxonangizning debitorlik qarzlari va biznesga oid qarzlar “Biznesga oid” bo‘limida kiritiladi. Ushbu bo‘limda faqat shaxsiy qarzlarni kiriting.

• Qarzdor moliyaviy jihatdan erkin va qarzini to‘lash niyatida hamda uni to‘lashga qodir bo‘lsa, bunday berilgan qarzlaridan har yili zakot to‘lanadi.
• Qarzdor moliyaviy qiyinchilikda bo‘lsa, qarzini to‘lolmayotgan, ammo qarz to‘lanishidan umid bor bo‘lsa 2 usulda zakot to‘lash mumkin:
    ○ (a) qarz qaytganda o‘tgan yillar uchun zakotni ado etish;
    ○ (b) qarzdorlik qoldig‘idan har yili zakot berish.
• Qarz qaytishidan umid uzilgan bo‘lsa, undan zakot to‘lanmaydi. Agar bunday qarz qaytib qolsa, ushbu qo‘liga tekkan yili uchungina zakot sanasi kelganda zakot to‘lanadi (yaʼni zakot o‘tgan yillarga chiqarilmaydi, balki olingan pul umumiy boylikka qo‘shib yuboriladi).
• Qarz olgan kishi qarzini inkor qilsa, qarz berganning dalili va guvohlari bo‘lmasa, bunday qarzdan zakot to‘lanmaydi. Agar bir necha yil o‘tib ushbu qarz qaytib qolsa, ushbu qo‘liga tekkan yili uchungina zakot sanasi kelganda to‘lanadi (yaʼni zakot o‘tgan yillarga chiqarilmaydi).
• Savdo mollarini sotishdan va tijoriy xizmat ko‘rsatishdan hosil bo‘lgan qarzlardan zakot to‘lanadi. Ushbu bo‘limda faqat shaxsiy oldi-sotdi bitimlari natijasida yuzaga kelgan qarzlarni kiriting, korxona egasi bo‘lsangiz “Biznesga oid” bo‘limida korxona qarzlari kiritiladi.
• Tijorat maqsadi bo‘lmagan, shaxsiy buyum va narsalarni sotishdan hosil bo‘lgan, ijara bo‘yicha olinishi kutilayotgan haqlardan zakot hisoblanmaydi.
  ''';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            Text(
              ' Boshqalarga berilgan qarzlar (haqlar) zakot to‘lanadigan boylik hisoblanadi. Bunga qarz sifatida berilgan pul va tijorat mollarini sotishdan hosil bo‘lgan shaxsiy haqlar (berilgan qarzlar) kiradi.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
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
                helperText: 'Pul ko‘rinishida berilgan qarzlar (haqlar)', controller: TextEditingController(text: '0')),
            const SizedBox(height: 30),
            customTextField(helperText: 'Tijoriy qarzlar (berilgan)', controller: TextEditingController(text: '0')),
            const SizedBox(height: 30),
            customTextField(helperText: 'Kechikkan qarzlar', controller: TextEditingController(text: '0')),
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
