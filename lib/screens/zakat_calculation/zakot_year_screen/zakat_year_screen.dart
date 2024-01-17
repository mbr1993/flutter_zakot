import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/dropdown_menu.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/list_tile_item.dart';
import 'package:flutter_zakot/screens/zakat_calculation/zakot_type_screen/zakot_type_screen.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class SelectingZakatYearScreen extends StatefulWidget {
  const SelectingZakatYearScreen({super.key});

  @override
  State<SelectingZakatYearScreen> createState() => _SelectingZakatYearScreenState();
}

class _SelectingZakatYearScreenState extends State<SelectingZakatYearScreen> {
  List<String> years = ['2023', '2022', '2021', '2020', '2019'];
  List<String> currencies = ['UZS', 'USD', 'EUR', 'RUB', 'KZT'];

  String selectedYear = '2023';
  String selectedCurrency = 'UZS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zakot hisoblash', style: TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  'Zakot hisoblash uchun yilni kiriting:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              customDropdownMenu(
                initialSelection: selectedYear,
                menuList: years,
                onSelected: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedYear = value;
                    });
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 12),
                child: Text(
                  'Hisoblash uchun pul birligini tanlang',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              customDropdownMenu(
                initialSelection: selectedCurrency,
                menuList: currencies,
                onSelected: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedCurrency = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              const Divider(),
              const ListTileItem(title: "1 gramm oltin narxi", description: "420 000 so'm"),
              const ListTileItem(title: "1 gramm kumush narxi", description: "9 084 so`m"),
              const ListTileItem(title: "Dollar kursi", description: "12341.54 so`m"),
              const ListTileItem(title: "Nisob miqdori (so'm)", description: "35 700 000 so`m"),
              const ListTileItem(title: "Nisob miqdori (dollar) ", description: "2 892.670 \$"),
              const SizedBox(height: 40),
              Row(
                children: [
                  CustomTextButton(title: 'Ortga', onPressed: () => Navigator.pop(context), color: Colors.red),
                  const SizedBox(width: 20),
                  CustomTextButton(
                    title: 'Davom etish',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(builder: (BuildContext context) => const SelectingZakatTypeScreen()),
                      );
                    },
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
