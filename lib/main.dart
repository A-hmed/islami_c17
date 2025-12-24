import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/main.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/quran_tab.dart';
import 'package:islami_c17/ui/screens/splash/splash.dart';
import 'package:islami_c17/ui/screens/sura_details/sura_details.dart';
import 'package:islami_c17/ui/utils/constants.dart';

void main() {
  // for(int i =0; i < arabicAuranSuras.length; i++){
  //
  //   suras.add(SuraDM(nameEn: englishQuranSurahs[i],
  //       nameAr: arabicAuranSuras[i],
  //       verses: AyaNumber[i],
  //       index: i + 1 ));
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.routeName: (_) => Splash(),
        Main.routeName: (_) => Main(),
        SuraDetails.routeName: (_) => SuraDetails()
      },
      initialRoute: Main.routeName,
    );
  }
}