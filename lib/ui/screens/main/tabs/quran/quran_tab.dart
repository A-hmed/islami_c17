import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/sura_details/sura_details.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';
import 'package:islami_c17/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.quranTabLogo,
            width: MediaQuery.of(context).size.width * .8,
          ),
          buildSuraTextField(),
          //Expanded(flex: 3, child: buildMostRecentList()),
          SizedBox(height: 12),
          Text(
            "Suras List",
            style: AppStyles.whiteBold16,
            textAlign: TextAlign.start,
          ),
          Expanded(flex: 7, child: buildSurasList()),
        ],
      ),
    );
  }

  Widget buildSuraTextField() {
    var defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.gold),
    );
    return TextField(
      decoration: InputDecoration(
        border: defaultBorder,
        focusedBorder: defaultBorder,
        errorBorder: defaultBorder,
        enabledBorder: defaultBorder,
        disabledBorder: defaultBorder,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
        ),
      ),
      style: AppStyles.whiteBold16,
      cursorColor: AppColors.gold,
    );
  }

  buildMostRecentList() {
    return Column(
      children: [
        Text("Most recent", style: AppStyles.whiteBold16),
        Expanded(
          child: ListView.builder(
            itemCount: 1000,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width * .65,
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Al-Anbiya",
                            style: AppStyles.lightBlackBold24,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("الأنبياء", style: AppStyles.lightBlackBold24),
                          Text(
                            "112 Verses  ",
                            style: AppStyles.lightBlackBold16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.imgMostRecent),
                ],
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget buildSurasList() {
    return ListView.separated(
      itemCount: suras.length,
      itemBuilder: (context, index) {
        return buildSuraItem(context, suras[index]);
      },
      padding: EdgeInsets.zero,
      separatorBuilder: (_, index) => Divider(),
    );
  }

  Widget buildSuraItem(BuildContext context, SuraDM sura) => InkWell(
    onTap: () {
      Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura);
    },
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgSurNumberFrame),
            ),
          ),
          child: Text("${sura.index}", style: AppStyles.whiteBold14),
        ),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sura.nameEn, style: AppStyles.whiteBold20),
              Text("${sura.verses} Verses  ", style: AppStyles.whiteBold14),
            ],
          ),
        ),

        Text(sura.nameAr, style: AppStyles.whiteBold20),
      ],
    ),
  );
}

class SuraDM {
  String nameEn;
  String nameAr;
  String verses;
  int index;

  SuraDM({
    required this.nameEn,
    required this.nameAr,
    required this.verses,
    required this.index,
  });
}
