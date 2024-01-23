import 'package:flutter/material.dart';
import 'package:flutter_zakot/screens/home/widgets/appbar.dart';
import 'package:flutter_zakot/screens/home/widgets/floating_action_button.dart';
import 'package:flutter_zakot/screens/home/widgets/list_item.dart';
import 'package:flutter_zakot/screens/zakat_calculation/zakot_year_screen/zakat_year_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar(title: 'Zakot', onPressed: () {}),
      body: homeScreenBody(),
      floatingActionButton: homeScreenFAB(context: context, onPressed: () => navigationToCalculationScreen(context)),
    );
  }

  void navigationToCalculationScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SelectingZakatYearScreen(),
      ),
    );
  }

  ListView homeScreenBody() {
    return ListView(
      children: [
        ListItem(
          title: 'Zakot nima',
          description: 'Zakot – islomning besh ustunidan biri bo‘lib, musulmonlar bajarishi lozim bo‘lgan farzdir. '
              'Zakotning bir qator individual va ijtimoiy maqsadlari bo‘lib, asosiy urg‘u musulmonlar orasida nafsni idora qilish va jamiyatda boylikni adolatli taqsimlanishiga qaratilgan.',
          icon: Icons.question_mark_rounded,
          inDetailOnPressed: () {},
        ),
        ListItem(
          title: 'Ким закот тўлайди?',
          description:
              'Ҳар бир балоғатга етган, бир қамарий йил давомида нисобдан ортиқ мулкка тўлиқ эгалик қилган мусулмон шахсга закот тўлаш фарздир.',
          icon: Icons.person_pin,
          inDetailOnPressed: () {},
        ),
        ListItem(
          title: 'Закот миқдори қанча?',
          description:
              'Нисоб миқдоридан ошган мулк умумий суммасининг 2,5%и закот учун фарз бўлади. Ҳозирда нисоб миқдори 595 гр. кумуш ёки 85 гр. олтин сифатида белгиланган.',
          icon: Icons.attach_money_outlined,
          inDetailOnPressed: () {},
        ),
        ListItem(
          title: 'Закот кимга берилади?',
          description:
              'Закот фақир-камбағаллар, мискинлар, закот омили, қалби улфат қилинадиганлар, қарздорлар ва умумий 8 тоифадаги инсонларга берилади.',
          icon: Icons.handshake_outlined,
          inDetailOnPressed: () {},
        ),
      ],
    );
  }
}
