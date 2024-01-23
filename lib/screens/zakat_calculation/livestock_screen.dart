import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class LiveStockScreen extends StatelessWidget {
  const LiveStockScreen({super.key});

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
            customTextField(
              helperText: 'Qo‘y, mol, tuya, echki, ot kabi hayvonlarning joriy bozor qiymati',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 30),
            customTextField(helperText: 'Parrandalarning joriy bozor qiymati', controller: TextEditingController()),
            const SizedBox(height: 30),
            const Text('Jami miqdor:', style: TextStyle(fontSize: 18)),
            const Text("0 so'm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomTextButton(title: 'Ortga', onPressed: () => Navigator.pop(context), color: Colors.red),
                const SizedBox(width: 20),
                CustomTextButton(title: 'Davom etish', onPressed: () {}, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
