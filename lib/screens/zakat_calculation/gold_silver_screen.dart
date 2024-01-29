import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/core/widgets/snacbar.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/list_tile_item.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class GoldSilverScreen extends StatefulWidget {
  const GoldSilverScreen(this.zakotList, {super.key});

  final List<ZakotType> zakotList;

  @override
  State<GoldSilverScreen> createState() => _GoldSilverScreenState();
}

class _GoldSilverScreenState extends State<GoldSilverScreen> {
  final _oltinController = TextEditingController();
  final _kumushController = TextEditingController();
  double? jami;

  void calculate() {
    final oltin = double.tryParse(_oltinController.text) ?? 0;
    final kumish = double.tryParse(_kumushController.text) ?? 0;

    setState(() => jami = (oltin * 420000) + (kumish * 9084));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tilla va kumush')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            const Text(
              ' Oltin va kumushlaringizning gramm hisobida kiriting. \n\n '
              "Hanafiy mazhabimizga ko'ra kundalik oltin va kumush taqinchoqlaringizdan zakot to'lashingiz kerak.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              helperText: 'Oltin (gramm)',
              controller: _oltinController,
              onChanged: (String? value) => calculate(),
            ),
            const ListTileItem(title: '1 gramm oltin narxi', description: "420 000 so'm"),
            const SizedBox(height: 40),
            CustomTextField(
              helperText: 'Kumush (gramm)',
              controller: _kumushController,
              onChanged: (String? value) => calculate(),
            ),
            const ListTileItem(title: '1 gramm kumush narxi', description: '9 084 so`m'),
            const SizedBox(height: 20),
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
                        return element.screen == ZakotTypeEnum.goldSilverScreen;
                      }).first,
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
