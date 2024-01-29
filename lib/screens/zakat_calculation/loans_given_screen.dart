import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/core/widgets/snacbar.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class LoansGivenScreen extends StatefulWidget {
  const LoansGivenScreen(this.zakotList, {super.key});

  final List<ZakotType> zakotList;

  @override
  State<LoansGivenScreen> createState() => _LoansGivenScreenState();
}

class _LoansGivenScreenState extends State<LoansGivenScreen> {
  final _pulKorinishidagiQarzlarController = TextEditingController();
  final _tijoriyQarzlarController = TextEditingController();
  final _kechikkanQarzlarController = TextEditingController();
  double? jami;

  void calculate() {
    final pulKorinishidagiQarzlar = double.tryParse(_pulKorinishidagiQarzlarController.text) ?? 0;
    final tijoriyQarzlar = double.tryParse(_tijoriyQarzlarController.text) ?? 0;
    final kechikkanQarzlar = double.tryParse(_kechikkanQarzlarController.text) ?? 0;

    setState(() {
      jami = pulKorinishidagiQarzlar + tijoriyQarzlar + kechikkanQarzlar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berilgan shaxsiy qarzlar')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    const text = '''
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
            const Text(
              ' Boshqalarga berilgan qarzlar (haqlar) zakot to‘lanadigan boylik hisoblanadi. Bunga qarz sifatida berilgan pul va tijorat mollarini sotishdan hosil bo‘lgan shaxsiy haqlar (berilgan qarzlar) kiradi.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
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
            CustomTextField(
              helperText: 'Pul ko‘rinishida berilgan qarzlar (haqlar)',
              controller: _pulKorinishidagiQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Tijoriy qarzlar (berilgan)',
              controller: _tijoriyQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Kechikkan qarzlar',
              controller: _kechikkanQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            const Text('Jami miqdor:', style: TextStyle(fontSize: 18)),
            Text("${jami ?? 0} so'm", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomTextButton(title: 'Ortga', onPressed: () => Navigator.pop(context), color: Colors.red),
                const SizedBox(width: 20),
                CustomTextButton(
                  title: 'Davom etish',
                  onPressed: () {
                    final index = widget.zakotList.indexOf(
                      widget.zakotList.where((element) => element.screen == ZakotTypeEnum.loansGivenScreen).first,
                    );
                    if ((index + 1) == widget.zakotList.length) {
                      CustomWidgets.showSnackBar(context, 'Oxirgi page chiqishi kere');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => widget.zakotList[index + 1].screen.getScreen(widget.zakotList),
                        ),
                      );
                    }
                  },
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
