import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c17/ui/screens/main/main.dart';
import 'package:islami_c17/ui/screens/splash/splash.dart';
import 'package:islami_c17/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(canvasColor: AppColors.gold),
      routes: {
        Splash.routeName: (_) => Splash(),
        Main.routeName: (_) => Main(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails()
      },
      initialRoute: Splash.routeName,
    );
  }
}

///Extensions in dart???
