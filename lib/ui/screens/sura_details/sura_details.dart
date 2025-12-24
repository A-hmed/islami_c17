import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/ui/screens/main/tabs/quran/quran_tab.dart';
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
  late SuraDM suraDm;

  String suraContent = "";

  @override
  void initState() {
    super.initState();

    ///This code will be executed once after build
    WidgetsBinding.instance.addPostFrameCallback((_){
      readFile();
    });

  }

  @override
  Widget build(BuildContext context) {
    suraDm = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if(suraContent.isEmpty){

    }

    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      appBar: AppBar(
        title: Text(suraDm.nameEn, style: AppStyles.goldBold20),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.imgLeftCornerGold),
                Spacer(),
                Text(suraDm.nameAr, style: AppStyles.goldBold20,),
                Spacer(),
                Image.asset(AppAssets.imgRightCornerGold),
              ],
            ),
            SizedBox(height: 12,),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  suraContent,
                  style: AppStyles.goldBold20,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Image.asset(AppAssets.mosqueImg)
          ],
        ),
      ),
    );
  }

  readFile() async {
    // "" -> [] split
    // ["a", "h", "med"] -> "ahmed"
    var fileName = "assets/files/quran/${suraDm.index}.txt";

    suraContent = await rootBundle.loadString(fileName);
    suraContent = suraContent.trim();
    List<String> suraLines = suraContent.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "{${i + 1}}";
    }
    suraContent = suraLines.join();
    print("$suraContent");
    setState(() {});
  }
}

///Dart is single threaded language
///Dart Isolates
/// Dart handles async throw Event Loop
