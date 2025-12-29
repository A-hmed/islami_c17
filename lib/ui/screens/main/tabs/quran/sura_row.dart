import 'package:flutter/material.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';

class SuraRow extends StatelessWidget {
  final SuraDM suraDM;

  const SuraRow({super.key, required this.suraDM});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgSurNumberFrame),
            ),
          ),
          child: Center(
            child: Text(suraDM.suraIndex, style: AppStyles.whiteBold14),
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(suraDM.nameEn, style: AppStyles.whiteBold20, maxLines: 1),
              Text("${suraDM.verses} Verses", style: AppStyles.whiteBold14),
            ],
          ),
        ),
        Text(suraDM.nameAr, style: AppStyles.whiteBold20),
      ],
    );
  }
}
