import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class FundsScreen extends StatefulWidget {
  const FundsScreen({super.key});

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  TextEditingController naqdPullarController = TextEditingController();
  TextEditingController plastikPullarController = TextEditingController();
  TextEditingController joriyOmonatlarController = TextEditingController();
  TextEditingController jamgarmaPullarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pul mablag\'lari - shaxsiy')),
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
              ' Naqd pul, plastik kartadagi, joriy va jamg‘arma omonatlardagi barcha pul mablag‘laringiz miqdorini kiriting. Zakot hisoblash kunida barcha valyutadagi pul mablag‘larini tanlangan valyutada kiriting. \n\n'
              ' Eʼtibor bering: Bank omonatlarini kiritishda faqat omonatning asosiy miqdorini kiriting, hisoblangan foizlar kiritilmaydi.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            customTextField(helperText: 'Naqd pullar', controller: naqdPullarController),
            const SizedBox(height: 20),
            customTextField(helperText: 'Plastik kartadagi pullar', controller: plastikPullarController),
            const SizedBox(height: 20),
            customTextField(helperText: 'Joriy omonatlar', controller: joriyOmonatlarController),
            const SizedBox(height: 20),
            customTextField(helperText: 'Jamg‘arma va boshqa omonatlar', controller: jamgarmaPullarController),
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
