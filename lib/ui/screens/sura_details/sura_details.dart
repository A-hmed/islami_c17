import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_dm.dart';

class SuraDetails extends StatelessWidget {
  static const routeName = "SuraDetails";
  SuraDetails({super.key});
  late SuraDM suraDM;

  @override
  Widget build(BuildContext context) {
    suraDM = ModalRoute.of(context)!.settings.arguments as SuraDM;
    print("name: ${suraDM.nameEn}");
    return const Placeholder();
  }
}
