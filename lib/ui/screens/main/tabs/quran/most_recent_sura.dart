import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';

class MostRecentSura extends StatelessWidget {
  final SuraDM sura;
  const MostRecentSura({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gold,
      ),
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .8,
      child: Row(
        children: [
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.nameEn, style: AppStyles.lightBlackBold24),
                Text(sura.nameAr, style: AppStyles.lightBlackBold24),
                Text("${sura.verses} Verses", style: AppStyles.lightBlackBold14),
              ],
            ),
          ),
          Image.asset(AppAssets.imgMostRecent),
        ],
      ),
    );
  }
}
