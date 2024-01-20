import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/zakat_calculation/widgets/text_field.dart';
import 'package:flutter_zakot/widgets/text_button.dart';

class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ko‘chmas mulk')),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    String text =
        '''Ko‘chmas mulk tijorat maqsadida sotishni qatʼiy niyat qilmasdan sotib olinsa yoki boshqa o‘ziga xos maqsad bo‘lmasa, u holda undan zakot berilmaydi. Biror yer maydoni sotishni, unga ishlov berishni, ijaraga berishni yoki unda yashashni aniq niyat qilmay sotib olinsa, bunday yer maydonidan zakot berilmaydi.
  \nTijorat maqsadi yoki oldi-sotdi niyati deganda ko‘chmas mulkka egalik asosida uni sotishdan daromad ko‘rish maqsadi tushuniladi
  \nBiroq, sotish niyati mavjudligining o‘zigina uni tijorat mulkiga aylanishini bildirmaydi. Chunki ko‘chmas mulk turli maqsadlarni ko‘zlab yoki sabablar tufayli sotilishi mumkin. Masalan, mulkni sotib kattaroq yoki kichikroq boshqa mulk olishni ko‘zlab yoki ushbu mulkka boshqa ehtiyoj qolmaganligi sababli yoki moliyaviy qiyinchilik, biror yirik xarajat uchun pul zarur bo‘lganda yoki mulkni sotib tadbirkorlik boshlash ko‘zda tutilgan bo‘lsa yoki boshqa sababli sotilishi mumkin. Zakot sanasiga bunday sotish niyati qilingan mulkdan zakot to‘lanmaydi.
    ''';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            Text(
              '''  Ko‘chmas mulk deganda yer va uning ustidagi bino va inshoatlar tushiniladi. Ko‘chmas mulk odatda zakotga tortiladigan aktiv turiga kirmaydi, shu sababli ulardan zakot chiqarilmaydi, ammo ko‘chmas mulk tijorat yoki sotish va sotishdan foyda qilish maqsadida olingan bo‘lsa zakot hisoblash zarur bo‘ladi.\n''',
              style: TextStyle(fontSize: 16),
            ),
            ExpandableText(
              text,
              expandText: 'Ko\'proq ko\'rish',
              maxLines: 2,
              collapseText: 'Yopish',
              collapseOnTextTap: true,
              style: TextStyle(fontSize: 16),
              expandOnTextTap: true,
              linkStyle: const TextStyle(color: Colors.deepOrange, fontSize: 16),
              animation: true,
            ),
            const SizedBox(height: 20),
            customTextField(
                helperText: 'Oldi-sotdi maqsadida harid qilingan mulklar', controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(
                helperText:
                    'Oldi-sotdi niyatida olingan, ammo vaqtinchalik shaxsiy ehtiyoji uchun foydalanib turilgan yoki ijaraga berilgan ko‘chmas mulklarning taxminiy joriy bozor qiymati',
                controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(
                helperText:
                    'Qurilishi tugallanmagan, sotish uchun qurilayotgan ko‘chmas mulklarning joriy bozor qiymati',
                controller: TextEditingController()),
            const SizedBox(height: 30),
            customTextField(
                helperText:
                    'Pulni kasod bo‘lishdan yoki mulk qiymatini saqlab qolishni da’vo qilib, zakotga tortiladigan boylikni kamaytirish maqsadida olingan ko‘chmas mulkning joriy bozor qiymati',
                controller: TextEditingController()),
            const SizedBox(height: 30),
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
