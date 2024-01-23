import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class BusinessRelatedScreen extends StatelessWidget {
  const BusinessRelatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biznesga oid')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    const text = '''
    Kalkulyatorda har bir biznesingizni alohida nomlab, uning aktiv va majburiyatlari bo‘yicha maʼlumotlarni kiriting. Biznesdagi ulushingizni kiritish orqali siz ushbu biznesning sizga tegishli zakot to‘lanadigan qismini bilishingiz mumkin.\n
  Ayni vaqtda sizning bir necha biznesingiz bo‘lsa ularni alohidadan hisoblashingiz mumkin. Buni oson qilish uchun dastlab 1-biznes maʼlumotlarini to‘liq kiritib olganingizdan so‘ng keyingi biznes maʼlumotlarni kiritish imkoni paydo bo‘ladi.
    ''';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            const Text(
              'Siz egalik qiladigan korxona boyliklari sizning mulkingiz hisoblanadi va ulardan zakot to‘lash lozim. Biznesning asosan savdo va oldi-sotdiga aloqador aktivlaridan zakot to‘lanadi. Asosiy vositalar, uzoq muddatli aktivlardan zakot to‘lanmaydi.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const ExpandableText(
              text,
              expandText: "Ko'proq ko'rish",
              maxLines: 3,
              collapseText: 'Yopish',
              collapseOnTextTap: true,
              style: TextStyle(fontSize: 16),
              expandOnTextTap: true,
              linkStyle: TextStyle(color: Colors.deepOrange, fontSize: 16),
              animation: true,
            ),
            const SizedBox(height: 20),
            const Text('1-biznes nomi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Biznes nomi'),
            ),
            const SizedBox(height: 30),
            customTextField(helperText: 'Biznesdagi sizning ulushingiz (%)', controller: TextEditingController()),
            const SizedBox(height: 30),
            const Text('Biznesning pul mablag‘lari', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            customTextField(helperText: 'Naqd pullar', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Bankdagi pullar', controller: TextEditingController()),
            const SizedBox(height: 30),
            const Text('Tijorat mollari', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            customTextField(helperText: 'Savdo mollari', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Yo‘ldagi mahsulotlar', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Yarim tayyor mahsulotlar', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Xomashyo', controller: TextEditingController()),
            const SizedBox(height: 20),
            const Text(
              'Biznes haqlari - debitorlik qarzlari',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Biznesning haqlari (debitorlik qarzlari) zakot to‘lanadigan boylik hisoblanadi. Bunga xaridorlardan olinadigan haqlar va pul ko‘rinishida berilgan qarzlar kiradi.',
            ),
            const SizedBox(height: 20),
            const ExpandableText(
              '''
  • Qarzdor moliyaviy qiyinchilikda bo‘lsa, qarzini to‘lolmayotgan, ammo qarz to‘lanishidan umid bor bo‘lsa 2 usulda zakot to‘lash mumkin:
    ○ (a) qarz qaytganda o‘tgan yillar uchun zakotni ado etish;
    ○ (b) qarzdorlik qoldig‘idan har yili zakot berish.
    Agar siz (a) usulni tanlasangiz, qarz qaytgan vaqtda barcha yillar uchun zakot to‘lashingiz lozim. Agar (b) usulni tanlasangiz, olinishi kutilayotgan qarz qoldig‘ini ushbu kalkulyatorga kiriting.
  • Eʼtibor bering: Qarz qaytishidan umid uzilgan bo‘lsa, undan zakot to‘lanmaydi. Agar bunday qarz qaytib qolsa, ushbu qo‘liga tekkan yili uchungina zakot sanasi kelganda zakot to‘lanadi (yaʼni zakot o‘tgan yillarga chiqarilmaydi, balki olingan pul umumiy boylikka qo‘shib yuboriladi).''',
              expandText: "Ko'proq ko'rish",
              maxLines: 3,
              collapseText: 'Yopish',
              collapseOnTextTap: true,
              style: TextStyle(fontSize: 16),
              expandOnTextTap: true,
              linkStyle: TextStyle(color: Colors.deepOrange, fontSize: 16),
              animation: true,
            ),
            const SizedBox(height: 20),
            customTextField(
              helperText: 'Tovar, xom ashyo va xizmatlardan qarzlar',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 30),
            customTextField(helperText: 'Pul ko‘rinishida olingan qarzlar', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Soliq va majburiy to‘lovlardan qarzlar', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Oylik va xodimlardan qarzlar', controller: TextEditingController()),
            const SizedBox(height: 30),
            const Text('Jami miqdor:', style: TextStyle(fontSize: 18)),
            const Text("0 so'm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomTextButton(title: 'Ortga', onPressed: () => Navigator.pop(context), color: Colors.red),
                const SizedBox(width: 20),
                CustomTextButton(title: 'Davom etish', onPressed: () {}, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
