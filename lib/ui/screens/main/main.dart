import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/ahadeth/ahadeth.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/quran.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';

class Main extends StatefulWidget {
  static const routeName = "main";
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedTabIndex = 1;
  List<Widget> tabs = [
    Quran(),
    Ahadeth(),
    Container(color: Colors.yellow,),
    Container(color: Colors.black,),
    Container(color: Colors.blue,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTabIndex],
        bottomNavigationBar: buildBottomNavigationBar()
    );
  }

  buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.gold),
      child: BottomNavigationBar(
        ///Not working
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.lightBlack,
        showSelectedLabels: true,
        onTap: (index){
          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          buildBottomNavigationBarItem(AppAssets.icQuran, "Quran", selectedTabIndex == 0),
          buildBottomNavigationBarItem(AppAssets.icHadeth, "Hadeth", selectedTabIndex == 1),
          buildBottomNavigationBarItem(AppAssets.icSebha, "Sebha", selectedTabIndex == 2),
          buildBottomNavigationBarItem(AppAssets.icRadio, "Radio", selectedTabIndex == 3),
          buildBottomNavigationBarItem(AppAssets.icTime, "Time", selectedTabIndex == 4),
        ],
      ),
    );
  }

  buildBottomNavigationBarItem(String imgPath, String title, bool isSelected) =>
      BottomNavigationBarItem(
        icon: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightBlack.withAlpha(153): Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: ImageIcon(AssetImage(imgPath)),
        ),
        label: title,
      );
}
