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

enum ZakotTypeEnum {
  fundsScreen,
  goldSilverScreen,
  loansGivenScreen,
  stockInvestmentScreen,
  realEstateScreen,
  debtReceivedScreen,
  businessRelatedScreen,
  liveStockScreen
}

extension ZakotTypeEnumExtension on ZakotTypeEnum {
  Widget getScreen(List<ZakotType> list) {
    switch (this) {
      case ZakotTypeEnum.fundsScreen:
        return FundsScreen(list);
      case ZakotTypeEnum.goldSilverScreen:
        return GoldSilverScreen(list);
      case ZakotTypeEnum.loansGivenScreen:
        return LoansGivenScreen(list);
      case ZakotTypeEnum.stockInvestmentScreen:
        return StockInvestmentScreen(list);
      case ZakotTypeEnum.realEstateScreen:
        return RealEstateScreen(list);
      case ZakotTypeEnum.debtReceivedScreen:
        return DebtReceivedScreen(list);
      case ZakotTypeEnum.businessRelatedScreen:
        return BusinessRelatedScreen(list);
      case ZakotTypeEnum.liveStockScreen:
        return LiveStockScreen(list);
    }
  }
}
