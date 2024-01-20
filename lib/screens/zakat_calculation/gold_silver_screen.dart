import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/list_tile_item.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class GoldSilverScreen extends StatefulWidget {
  const GoldSilverScreen({super.key});

  @override
  State<GoldSilverScreen> createState() => _GoldSilverScreenState();
}

class _GoldSilverScreenState extends State<GoldSilverScreen> {
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
            Text(
              ' Oltin va kumushlaringizning gramm hisobida kiriting. \n\n '
              'Hanafiy mazhabimizga ko\'ra kundalik oltin va kumush taqinchoqlaringizdan zakot to\'lashingiz kerak.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            customTextField(helperText: 'Oltin (gramm)', controller: TextEditingController(text: '0')),
            const ListTileItem(title: "1 gramm oltin narxi", description: "420 000 so'm"),
            const SizedBox(height: 40),
            customTextField(helperText: 'Kumush (gramm)', controller: TextEditingController(text: '0')),
            const ListTileItem(title: "1 gramm kumush narxi", description: "9 084 so`m"),
            const SizedBox(height: 20),
            Text('Jami miqdor:', style: TextStyle(fontSize: 18)),
            Text('0 so\'m', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
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
      ),
    );
  }
}
