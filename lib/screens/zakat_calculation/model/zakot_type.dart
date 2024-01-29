import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';

class ZakotType {
  ZakotType({
    required this.title,
    required this.isChecked,
    required this.screen,
  });

  String title;
  bool isChecked;
  ZakotTypeEnum screen;
}
