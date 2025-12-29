import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/most_recent_sura.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_row.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';
import 'package:islami_c17/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../sura_details/sura_details.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SuraDM> filteredSuras = suras;
  List<SuraDM> mostRecentSura = [];

  void loadSurasFromSharedPref() async {
    // ["1", "2", "3"] -> [1, 1, 1];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? surasIndexList = prefs.getStringList("most_recent_sura");
    print("surasIndex = $surasIndexList");
    if (surasIndexList == null) return;
    mostRecentSura = surasIndexList.map((suraIndex) {
      int index = int.parse(suraIndex);
      return suras[index - 1];
    }).toList();
    print("mostRecentSura = $mostRecentSura");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadSurasFromSharedPref();
  }

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.islamiLogo),
            SizedBox(height: 16),
            buildSuraNameTextField(),
            SizedBox(height: 20),
            if (mostRecentSura.isNotEmpty) Container(
                height: MediaQuery.of(context).size.height * .25,
                child: buildMostRecentList()),
            SizedBox(height: 12,),
            Text(
              "Sura List",
              style: AppStyles.whiteBold16,
              textAlign: TextAlign.start,
            ),
            buildSuraListView(),
          ],
        ),
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
      onChanged: (query) {
        if (query.trim().isEmpty) {
          filteredSuras = suras;
        } else {
          filteredSuras = suras.where((sura) {
            return sura.nameEn.toLowerCase().contains(query.toLowerCase()) ||
                sura.nameAr.contains(query);
          }).toList();
        }

        setState(() {});
      },
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
            itemCount: mostRecentSura.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                MostRecentSura(sura: mostRecentSura[index]),
          ),
        ),
      ],
    );
  }

  buildSuraListView() => ListView.separated(
    itemCount: filteredSuras.length,
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) => InkWell(
      onTap: () async {
        saveSuraInSharedPref(filteredSuras[index]);
        await Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: filteredSuras[index],
        );

        ///This block of code will executed when user returns back to this screen
        loadSurasFromSharedPref();
      },
      child: SuraRow(suraDM: filteredSuras[index]),
    ),
    separatorBuilder: (_, _) => Divider(indent: 50, endIndent: 50),
  );

  void saveSuraInSharedPref(SuraDM sura) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> oldSavedSura = prefs.getStringList("most_recent_sura") ?? [];
    oldSavedSura.insert(0, sura.suraIndex);
    prefs.setStringList("most_recent_sura", oldSavedSura.toSet().toList());
    // Set<String> set = {"1", "2", "3"};
    // set.add("1");
  }
}
