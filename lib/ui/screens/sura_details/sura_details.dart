import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/sura_dm.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM suraDM;

  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    suraDM = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if (suraContent.isEmpty) readFileContent();
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
          title: Text(suraDM.nameEn,  style: AppStyles.goldBold20,),
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
                Text(suraDM.nameAr,style: AppStyles.goldBold20,),
                Image.asset(AppAssets.imgRightCorner),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  suraContent,
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

  void readFileContent() async {
    var fileName = "assets/files/quran/${suraDM.suraIndex}.txt";
    Future<String> future = rootBundle.loadString(fileName);
    // future.then((string){
    //   suraContent = string;
    //   setState(() {});
    // });
    suraContent = await rootBundle.loadString(fileName);
    suraContent = suraContent.trim();
    List<String> suraLines = suraContent.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "{${i + 1}}";
    }
    suraContent = suraLines.join();
    setState(() {});
    print("suraContent = $suraContent");
  }
}

///Dart is a single thread language
///
///
/// Dart handles futures through Event loop
