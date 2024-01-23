import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/business_related_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/debts_received_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/funds_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/gold_silver_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/livestock_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/loans_given_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/real_estate_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/stock_investment_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/card_zakot_type.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class SelectingZakatTypeScreen extends StatefulWidget {
  const SelectingZakatTypeScreen({super.key});

  @override
  State<SelectingZakatTypeScreen> createState() => _SelectingZakatTypeScreenState();
}

class _SelectingZakatTypeScreenState extends State<SelectingZakatTypeScreen> {
  List<ZakotType> zTypeList = [
    ZakotType(title: "Pul mablag'lari - shaxsiy", isChecked: false),
    ZakotType(title: 'Oltin / kumush', isChecked: false),
    ZakotType(title: 'Berilgan qarzlar', isChecked: false),
    ZakotType(title: 'Aksiya va Investitsiyalar', isChecked: false),
    ZakotType(title: "Ko'chmas mulk", isChecked: false),
    ZakotType(title: 'Olingan qarzlar', isChecked: false),
    ZakotType(title: 'Biznesga oid', isChecked: false),
    ZakotType(title: 'Chorva mollari', isChecked: false),
  ];

  final screens = [
    const FundsScreen(),
    const GoldSilverScreen(),
    const LoansGivenScreen(),
    const StockInvestmentScreen(),
    const RealEstateScreen(),
    const DebtReceivedScreen(),
    const BusinessRelatedScreen(),
    const LiveStockScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Zakot hisoblash')),
        body: _body(context),
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              child: Column(
                children: [
                  const Text(
                    ' Zakot hisoblash uchun sizda mavjud bo‘lgan boylik va qarzlar turini tanlang:',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: zTypeList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: zakotTypeCard(
                          text: zTypeList[index].title,
                          isChecked: zTypeList[index].isChecked,
                        ),
                        onTap: () => setState(() => zTypeList[index].isChecked = !zTypeList[index].isChecked),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CustomTextButton(title: 'Ortga', onPressed: () => Navigator.pop(context), color: Colors.red),
              const SizedBox(width: 20),
              CustomTextButton(
                title: 'Davom etish',
                onPressed: () {},
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
