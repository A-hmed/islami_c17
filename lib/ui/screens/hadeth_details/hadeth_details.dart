import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/ui/screens/main/tabs/ahadeth/ahadeth.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = "HadethDetails";

  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late HadethDM hadeth;

  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    hadeth = ModalRoute.of(context)!.settings.arguments as HadethDM;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
          title: Text("Hadeth ${hadeth.index}",  style: AppStyles.goldBold20,),
          centerTitle: true,
          backgroundColor: Colors.transparent,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.imgLeftCorner),
                Text(hadeth.title,style: AppStyles.goldBold20,),
                Image.asset(AppAssets.imgRightCorner),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  hadeth.content,
                  style: AppStyles.goldBold20,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Image.asset(AppAssets.mosqueImg)
          ],
        ),
      ),
    );
  }

}

///Dart is a single thread language
///
///
/// Dart handles futures through Event loop
