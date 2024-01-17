import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/card_zakot_type.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class SelectingZakatTypeScreen extends StatelessWidget {
  const SelectingZakatTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(context),
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Text(
            ' Zakot hisoblash uchun sizda mavjud bo‘lgan boylik va qarzlar turini tanlang:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  zakotTypeCard(text: 'Pul mablag\'lari - shaxsiy'),
                  zakotTypeCard(text: 'Oltin / kumush'),
                  zakotTypeCard(text: 'Berilgan qarzlar'),
                  zakotTypeCard(text: 'Aksiya va Investitsiyalar'),
                  zakotTypeCard(text: 'Ko\'chmas mulk'),
                  zakotTypeCard(text: 'Olingan qarzlar'),
                  zakotTypeCard(text: 'Biznesga oid'),
                  zakotTypeCard(text: 'Chorva mollari'),
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
