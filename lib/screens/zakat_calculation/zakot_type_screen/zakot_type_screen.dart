import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/business_related_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/debts_received_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/gold_silver_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/livestock_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/loans_given_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/real_estate_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/stock_investment_screen.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/card_zakot_type.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

import '../funds_screen.dart';

class SelectingZakatTypeScreen extends StatelessWidget {
  const SelectingZakatTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Zakot hisoblash')),
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
                  Text(
                    ' Zakot hisoblash uchun sizda mavjud bo‘lgan boylik va qarzlar turini tanlang:',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  zakotTypeCard(
                      text: 'Pul mablag\'lari - shaxsiy',
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute<dynamic>(builder: (context) => const FundsScreen()))),
                  zakotTypeCard(
                      text: 'Oltin / kumush',
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute<dynamic>(builder: (context) => const GoldSilverScreen()));
                      }),
                  zakotTypeCard(
                      text: 'Berilgan qarzlar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(builder: (context) => const LoansGivenScreen()),
                        );
                      }),
                  zakotTypeCard(
                      text: 'Aksiya va Investitsiyalar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(builder: (context) => const StockInvestmentScreen()),
                        );
                      }),
                  zakotTypeCard(
                      text: 'Ko\'chmas mulk',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(builder: (context) => const RealEstateScreen()),
                        );
                      }),
                  zakotTypeCard(
                      text: 'Olingan qarzlar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(builder: (context) => const DebtReceivedScreen()),
                        );
                      }),
                  zakotTypeCard(
                      text: 'Biznesga oid',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(builder: (context) => const BusinessRelatedScreen()),
                        );
                      }),
                  zakotTypeCard(
                      text: 'Chorva mollari',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(builder: (context) => const LiveStockScreen()),
                        );
                      }),
                ],
              ),
            ),
          ),
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
    );
  }
}
