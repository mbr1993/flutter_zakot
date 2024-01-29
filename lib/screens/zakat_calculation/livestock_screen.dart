import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/core/widgets/snacbar.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type.dart';
import 'package:flutter_zakot/screens/zakat_calculation/model/zakot_type_enum.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class LiveStockScreen extends StatefulWidget {
  const LiveStockScreen(this.zakotList, {super.key});

  final List<ZakotType> zakotList;

  @override
  State<LiveStockScreen> createState() => _LiveStockScreenState();
}

class _LiveStockScreenState extends State<LiveStockScreen> {
  final _chorvaQoyController = TextEditingController();
  final _parrandaController = TextEditingController();
  double? jami;

  void calculate() {
    final chorvaQoy = double.tryParse(_chorvaQoyController.text) ?? 0;
    final parranda = double.tryParse(_parrandaController.text) ?? 0;

    setState(() {
      jami = chorvaQoy + parranda;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chorva mollari')),
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
              '  Oldi sotdi maqsadida xarid qilingan chorva hayvonlar.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '  Sotish maqsadida olingan qo‘y, mol, echki, tuya, tovuq kabi hayvonlardan 2.5% zakot chiqariladi.',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              helperText: 'Qo‘y, mol, tuya, echki, ot kabi hayvonlarning joriy bozor qiymati',
              controller: _chorvaQoyController,
              onChanged: (String? value) => calculate(),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              helperText: 'Parrandalarning joriy bozor qiymati',
              controller: _parrandaController,
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
                        return element.screen == ZakotTypeEnum.liveStockScreen;
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
