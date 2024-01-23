import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class DebtReceivedScreen extends StatelessWidget {
  const DebtReceivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olingan qarzlar (shaxsiy)')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    const text = '''
  • Qarzlar odatda biror mahsulot va xizmatlarni sotib olishdan yoki pul qarz olish orqali vujudga keladi.
  • Nasiyaga sotib olingan mahsulot yoki xizmatlar uchun to‘lanmagan qarzlar zakot hisoblanadigan miqdordan chegirib tashlanadi. Soliq va davlatga to‘lanishi lozim bo‘lgan joriy majburiy to‘lovlar ham zakot hisoblanadigan miqdordan ayirib tashlanadi.
  • Moliyaviy majburiyatlar va kreditlar bu pul ko‘rinishida olingan qarzlar yoki biror aktiv sotib olish uchun bank yoki moliya muassasalaridan olingan qarzlar bo‘lishi mumkin. Bunga baʼzi misollar quyidagilar:
      ○ pul ko‘rinishida olingan qarzlar
      ○ shaxsiy (isteʼmol) kreditlari
      ○ ipoteka kreditlari
      ○ avtokredit
      ○ chorva mollari uchun olingan kreditlar
  • Bunday moliyaviy majburiyatlarning faqatgina hozirda to‘lov muddati kelgan va keyingi qamariy 12 oy ichida to‘lov muddati keladigan qismi zakot bazasini hisoblash uchun chegiriladi. Uzoq muddatli qarzlarning to‘lov muddati 1 qamariy yildan keyin to‘lanadigan qismi zakot hisoblanadigan miqdorni kamaytirmaydi.
  • Eʼtibor bering: Foizli kreditlar uchun faqat asosiy qarz qismi zakotni hisoblashda inobatga olinadi. Zakot sanasiga hisoblangan foiz (ribo) zakot hisoblanadigan miqdorni kamaytirmaydi.
  • Uzoq muddatli qarzlarning faqat kelasi 1 yilgi to‘lovlar summasi hisobga olinadi, xolos.
      ○ Masalan, 3 yilga bo‘lib to‘lashga avtomashina xarid qildingiz. Oylik to‘lov summasi 3 million so‘mdan. Zakot chiqarish vaqtida, kelasi 1 yilda to‘lanishi lozim bo‘lgan summa 12*3 mln = 36 million so‘m bo‘ladi va shu miqdor bu yerga tanlangan pul birligi hisobida kiritasiz.
      ○ Masalan, 15 yilga 300 million so‘mli ipoteka krediti olingan. Kredit foizlari jami 600 million so‘mni tashkil qiladi deylik. Kelasi 12 oyda asosiy qarzning 20 million so‘m (= 300 million / 15 yil) qismi zakot to‘lanadigan boylik qismidan ayriladi.
    ''';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            const Text(
              ' Qarzlar zakot hisoblanadigan boylik miqdorini kamaytiradi. Kishining qarzidan ortgan moli nisobga yetsa zakot chiqaradi. Zakot chiqariladigan boylikni hisoblashda faqat to‘lov muddati kelgan yoki yaqin 12 oy ichida to‘lov muddati keladigan qarzlargina chegiriladi.',
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
            const SizedBox(height: 30),
            customTextField(
              helperText: 'Pul ko‘rinishida olingan qarzlar - joriy qismi',
              controller: TextEditingController(text: '0'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bank, moliyaviy va muddatli to‘lovga savdo qiladigan muassasalar oldidagi qarzlar - joriy qismi.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            customTextField(helperText: 'Ipoteka krediti yoki muqobili', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Avtokredit yoki muqobili', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Isteʼmol krediti yoki muqobili', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(helperText: 'Boshqa qarzlar', controller: TextEditingController()),
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
