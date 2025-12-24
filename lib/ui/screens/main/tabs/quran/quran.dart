import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/most_recent_sura.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_row.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';
import 'package:islami_c17/ui/utils/constants.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranTabBg),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),
          SizedBox(height: 16),
          buildSuraNameTextField(),
          SizedBox(height: 20),
          Text(
            "Sura List",
            style: AppStyles.whiteBold16,
            textAlign: TextAlign.start,
          ),
          Expanded(child: buildSuraListView()),
        ],
      ),
    );
  }

  Widget buildSuraNameTextField() {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.gold, width: 1),
    );
    return TextField(
      decoration: InputDecoration(
        labelText: "Sura Name",
        labelStyle: AppStyles.whiteBold16,
        errorBorder: border,
        focusedBorder: border,
        enabledBorder: border,
        border: border,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
        ),
      ),
      cursorColor: AppColors.gold,
      style: AppStyles.whiteBold16,
    );
  }

  Widget buildMostRecentList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recent", style: AppStyles.whiteBold16),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MostRecentSura(),
          ),
        ),
      ],
    );
  }

  buildSuraListView() => ListView.separated(
    itemCount: suras.length,
    padding: EdgeInsets.zero,
    itemBuilder: (context, index) => SuraRow(suraDM: suras[index]),
    separatorBuilder: (_, _) => Divider(indent: 50, endIndent: 50),
  );
}
