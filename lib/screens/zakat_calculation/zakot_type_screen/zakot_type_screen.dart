import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/core/widgets/snacbar.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/card_zakot_type.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class SelectingZakatTypeScreen extends StatefulWidget {
  const SelectingZakatTypeScreen({super.key});

  @override
  State<SelectingZakatTypeScreen> createState() => _SelectingZakatTypeScreenState();
}

class _SelectingZakatTypeScreenState extends State<SelectingZakatTypeScreen> {
  List<ZakotType> zakotTypeList = [
    ZakotType(title: "Pul mablag'lari - shaxsiy", isChecked: false, screen: ZakotTypeEnum.fundsScreen),
    ZakotType(title: 'Oltin / kumush', isChecked: false, screen: ZakotTypeEnum.goldSilverScreen),
    ZakotType(title: 'Berilgan qarzlar', isChecked: false, screen: ZakotTypeEnum.loansGivenScreen),
    ZakotType(title: 'Aksiya va Investitsiyalar', isChecked: false, screen: ZakotTypeEnum.stockInvestmentScreen),
    ZakotType(title: "Ko'chmas mulk", isChecked: false, screen: ZakotTypeEnum.realEstateScreen),
    ZakotType(title: 'Olingan qarzlar', isChecked: false, screen: ZakotTypeEnum.debtReceivedScreen),
    ZakotType(title: 'Biznesga oid', isChecked: false, screen: ZakotTypeEnum.businessRelatedScreen),
    ZakotType(title: 'Chorva mollari', isChecked: false, screen: ZakotTypeEnum.liveStockScreen),
  ];

  List<ZakotType> newCheckedList = [];

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
                    itemCount: zakotTypeList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ZakotTypeCard(
                          text: zakotTypeList[index].title,
                          isChecked: zakotTypeList[index].isChecked,
                        ),
                        onTap: () {
                          setState(() => zakotTypeList[index].isChecked = !zakotTypeList[index].isChecked);
                          if (zakotTypeList[index].isChecked) {
                            newCheckedList.add(zakotTypeList[index]);
                          } else {
                            newCheckedList.remove(zakotTypeList[index]);
                          }
                        },
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
                onPressed: () {
                  if (newCheckedList.isEmpty) {
                    CustomWidgets.showSnackBar(context, 'Hisoblash uchun biror zakot turini tanlang!');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => newCheckedList[0].screen.getScreen(newCheckedList),
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
    );
  }
}
