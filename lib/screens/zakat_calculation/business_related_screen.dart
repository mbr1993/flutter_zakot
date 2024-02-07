import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/core/widgets/snacbar.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';
import 'package:flutter_zakot/screens/zakat_calculation/total_count_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class BusinessRelatedScreen extends StatefulWidget {
  const BusinessRelatedScreen(this.zakotList, {super.key});

  final List<ZakotType> zakotList;

  @override
  State<BusinessRelatedScreen> createState() => _BusinessRelatedScreenState();
}

class _BusinessRelatedScreenState extends State<BusinessRelatedScreen> {
  final _naqdPullarController = TextEditingController();
  final _bankdagiPullarController = TextEditingController();

  final _savdoMollarController = TextEditingController();
  final _yoldagiMahsulotlarController = TextEditingController();
  final _yarimTayyorMahsulotlarController = TextEditingController();
  final _xomAshyolarController = TextEditingController();

  final _xaridorlardanOlinadiganHaqlarController = TextEditingController();
  final _berilganQarzlarController = TextEditingController();

  final _korparativInvestitsiyalarController = TextEditingController();

  final _xomAshyoQarzlarController = TextEditingController();
  final _olinganQarzlarController = TextEditingController();
  final _soliqTolovQarzlarController = TextEditingController();
  final _oylikTolovQarzlarController = TextEditingController();
  double? jami;

  void calculate() {
    final naqdPullar = double.tryParse(_naqdPullarController.text) ?? 0;
    final bankdagiPullar = double.tryParse(_bankdagiPullarController.text) ?? 0;

    final savdoMollar = double.tryParse(_savdoMollarController.text) ?? 0;
    final yoldagiMahsulotlar = double.tryParse(_yoldagiMahsulotlarController.text) ?? 0;
    final yarimTayyorMahsulotlar = double.tryParse(_yarimTayyorMahsulotlarController.text) ?? 0;
    final xomAshyolar = double.tryParse(_xomAshyolarController.text) ?? 0;

    final xaridorlardanOlinadiganHaqlar = double.tryParse(_xaridorlardanOlinadiganHaqlarController.text) ?? 0;
    final berilganQarzlar = double.tryParse(_berilganQarzlarController.text) ?? 0;

    final korparativInvestitsiyalar = double.tryParse(_korparativInvestitsiyalarController.text) ?? 0;

    final tovarlar = double.tryParse(_xomAshyoQarzlarController.text) ?? 0;
    final qarzlar = double.tryParse(_olinganQarzlarController.text) ?? 0;
    final soliqTolovlar = double.tryParse(_soliqTolovQarzlarController.text) ?? 0;
    final oylikTolovlar = double.tryParse(_oylikTolovQarzlarController.text) ?? 0;

    setState(
      () => jami = naqdPullar +
          bankdagiPullar +
          savdoMollar +
          yoldagiMahsulotlar +
          yarimTayyorMahsulotlar +
          xomAshyolar +
          xaridorlardanOlinadiganHaqlar +
          berilganQarzlar +
          korparativInvestitsiyalar +
          tovarlar +
          qarzlar +
          soliqTolovlar +
          oylikTolovlar,
    );
  }

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
            CustomTextField(
              helperText: 'Biznesdagi sizning ulushingiz (%)',
              controller: TextEditingController(),
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 30),
            const Text('Biznesning pul mablag‘lari', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomTextField(
              helperText: 'Naqd pullar',
              controller: _naqdPullarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Bankdagi pullar',
              controller: _bankdagiPullarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            const Text('Tijorat mollari', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomTextField(
              helperText: 'Savdo mollari',
              controller: _savdoMollarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Yo‘ldagi mahsulotlar',
              controller: _yoldagiMahsulotlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Yarim tayyor mahsulotlar',
              controller: _yarimTayyorMahsulotlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Xomashyo',
              controller: _xomAshyolarController,
              onChanged: (String? value) => calculate(),
            ),
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
            CustomTextField(
              helperText: 'Xaridorlardan olinadigan haqlar',
              controller: _xaridorlardanOlinadiganHaqlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              helperText: 'Pul ko‘rinishida berilgan qarzlar',
              controller: _berilganQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Biznesning investitsiyalari',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              helperText: 'Korporativ investitsiyalar',
              controller: _korparativInvestitsiyalarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            const Text(
              'Biznesning qarzlari - kreditorlik qarzlari',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Qarzlar baʼzilari korxona uchun zakot hisoblanadigan boylik miqdorini kamaytiradi. Zakot chiqariladigan boylikni hisoblashda faqat to‘lov muddati kelgan yoki yaqin 12 oy ichida to‘lov muddati keladigan qarzlargina chegiriladi.'),
            const SizedBox(height: 20),
            const ExpandableText(
              '''
  Qarzlarning zakot hisoblash maqsadida ikki turga ajratish mumkin:
    Ayriladigan qarzlar: Korxonaning savdo mollari, xom ashyo yoki xizmat sotib olish uchun mol yetkazib beruvchi yoki moliya muassasalari (masalan bank) oldidagi qarzlari, soliq va ishchilarning maoshlari bo‘yicha qarzlar zakot bazasini kamaytiradi (yaʼni ushbu kalkulyatorga kiritish lozim).
      Agar ushbu qarzlarning to‘lov muddati 1 yildan ortiq bo‘lsa, faqat kelasi 12 oylik to‘lovlar summasi ayriladi.
    ○ Masalan, korxonaga xom ashyo sotib olish uchun 3 yilga 120 million so‘mli krediti olingan. Kredit foizlari jami 50 million so‘mni tashkil qiladi deylik. Kelasi 12 oyda asosiy qarzning faqat 40 million so‘m (= 120 million / 3 yil) qismi zakot to‘lanadigan boylik qismidan ayriladi.
    ○ Eʼtibor bering: Foizli kreditlar uchun faqat asosiy qarz qismi zakotni hisoblashda inobatga olinadi. Zakot sanasiga hisoblangan foiz (ribo) zakot hisoblanadigan miqdorni kamaytirmaydi.
    ○ Eʼtibor bering: Foizli kreditlar uchun faqat asosiy qarz qismi zakotni hisoblashda inobatga olinadi. Zakot sanasiga hisoblangan foiz (ribo) zakot hisoblanadigan miqdorni kamaytirmaydi.''',
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
            CustomTextField(
              helperText: 'Tovar, xom ashyo va xizmatlardan qarzlar',
              controller: _xomAshyoQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Pul ko‘rinishida olingan qarzlar',
              controller: _olinganQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Soliq va majburiy to‘lovlardan qarzlar',
              controller: _soliqTolovQarzlarController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Oylik va xodimlardan qarzlar',
              controller: _oylikTolovQarzlarController,
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
                      widget.zakotList.where((element) {
                        return element.screen == ZakotTypeEnum.businessRelatedScreen;
                      }).first,
                    );
                    if (widget.zakotList.length == (index + 1)) {
                      Navigator.push(context, MaterialPageRoute<dynamic>(builder: (context) => const TotalCountScreen()));
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
