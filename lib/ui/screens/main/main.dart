import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/ahadeth/ahadeth.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/quran_tab.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';

class Main extends StatefulWidget {
  static const routeName = "Main";

  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    Container(color: Colors.blue),
    Container(color: Colors.black),
    Container(color: Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  // Widget getBody(){
  //   if(selectedIndex == 0) return QuranTab();
  //   if(selectedIndex == 1) return  Container(color: Colors.blue);
  //   if(selectedIndex == 2) return  Container(color: Colors.blue);
  //   if(selectedIndex == 3) return  Container(color: Colors.blue);
  //   return Container(color: Colors.blue);
  //
  // }

  var selectedIndex = 0;

  Widget buildBottomNavBar() => Theme(
    data: ThemeData(canvasColor: AppColors.gold),
    child: BottomNavigationBar(
      unselectedItemColor: AppColors.lightBlack,
      currentIndex: selectedIndex,
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
      items: [
        buildBottomNavBarItem(AppAssets.icQuran, "quran", selectedIndex == 0),
        buildBottomNavBarItem(
          AppAssets.icHadeth,
          "ahadeth",
          selectedIndex == 1,
        ),
        buildBottomNavBarItem(AppAssets.icSebha, "sebha", selectedIndex == 2),
        buildBottomNavBarItem(AppAssets.icRadio, "radio", selectedIndex == 3),
        buildBottomNavBarItem(AppAssets.icTime, "time", selectedIndex == 4),
      ],
    ),
  );

  BottomNavigationBarItem buildBottomNavBarItem(
    String image,
    String title,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightBlack.withAlpha(150)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: ImageIcon(AssetImage(image)),
      ),
      label: title,
    );
  }
}
