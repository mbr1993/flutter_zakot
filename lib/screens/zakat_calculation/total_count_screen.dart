import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/home/home_screen.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class TotalCountScreen extends StatelessWidget {
  const TotalCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yakuniy hisob')),
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
              'Jami to’lanishi lozim zakot miqdor = (Menda bor) - (Men qarzman) * 2.5%',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Divider(color: Colors.grey[300], thickness: 1),
                const Text(
                  'Zakotga tortiladigan jami boyliklarim miqdori:',
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CupertinoButton(
                    onPressed: () {},
                    color: Colors.green[100],
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: const Text('0,0', style: TextStyle(color: Colors.black)),
                  ),
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                const Text('Zakotdan kamaytiriladigan jami qarzlarim miqdori:'),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CupertinoButton(
                    onPressed: () {},
                    color: Colors.red[100],
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: const Text('0,0', style: TextStyle(color: Colors.black)),
                  ),
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                const Text('Sof zakot boyligim hisobi:'),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CupertinoButton(
                    onPressed: () {},
                    color: Colors.orange[100],
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: const Text('0,0', style: TextStyle(color: Colors.black)),
                  ),
                ),
                Divider(color: Colors.grey[300], thickness: 1),
              ],
            ),
            const SizedBox(height: 30),
            const Text('Zakot miqdori:', style: TextStyle(fontSize: 18)),
            const Text("0.000 so'm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            const Text(
              'Sizning boyligingiz nisob miqdoriga yetmadi, nisob miqdori hozirda:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomTextButton(
                  title: 'Qayta hisoblash',
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute<dynamic>(builder: (context) => const HomeScreen())),
                  color: Colors.red,
                ),
                const SizedBox(width: 20),
                CustomTextButton(
                  title: 'Yuklab olish',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fayl yuklab olindi.')));
                    Navigator.push(context, MaterialPageRoute<dynamic>(builder: (context) => const HomeScreen()));
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
