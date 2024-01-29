import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/core/widgets/snacbar.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class StockInvestmentScreen extends StatefulWidget {
  const StockInvestmentScreen(this.zakotList, {super.key});

  final List<ZakotType> zakotList;

  @override
  State<StockInvestmentScreen> createState() => _StockInvestmentScreenState();
}

class _StockInvestmentScreenState extends State<StockInvestmentScreen> {
  final TextEditingController _oldiSotdiTextController = TextEditingController();
  final TextEditingController _uzoqMuddatliTextController = TextEditingController();
  final TextEditingController _sherikchilikTextController = TextEditingController();
  double? jami;

  void calculate() {
    final oldiSotdi = double.tryParse(_oldiSotdiTextController.text) ?? 0;
    final uzoqMuddatli = double.tryParse(_uzoqMuddatliTextController.text) ?? 0;
    final sherikchilik = double.tryParse(_sherikchilikTextController.text) ?? 0;

    setState(() {
      jami = oldiSotdi + uzoqMuddatli + sherikchilik;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Investitsiya va aksiyalar')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    const text = '''
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
            const Text(
              ' Investitsiya va aksiyalar zakotga tortiladigan boylik hisoblanadi. Ushbu investitsiya va aksiyalarning joriy bozor qiymatini kiriting.',
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
            CustomTextField(
              helperText: 'Oldi-sotdi maqsadida olingan aksiyalar',
              controller: _oldiSotdiTextController,
              onChanged: (value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Uzoq muddat egalik qilish maqsadida olingan aksiyalar',
              controller: _uzoqMuddatliTextController,
              onChanged: (value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Sherikchilik va boshqa uzoq muddatli passiv investitsiyalar',
              controller: _sherikchilikTextController,
              onChanged: (value) => calculate(),
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
                      widget.zakotList.where((element) => element.screen == ZakotTypeEnum.stockInvestmentScreen).first,
                    );
                    if (widget.zakotList.length == (index + 1)) {
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
