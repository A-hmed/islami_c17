import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<HadethDM> ahadethList = [];

  @override
  void initState() {
    super.initState();
    loadAhadethList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.ahadethTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.islamiLogo),
            Expanded(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  height: double.infinity,
                ),
                itemCount: ahadethList.length,
                itemBuilder: (context, index, _) {
                  // print("index: $index, readIdx: $realIdx");
                  return buildHadethWidget(ahadethList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHadethWidget(HadethDM hadeth) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName, arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.imgLeftCorner,
                  color: AppColors.lightBlack,
                ),
                Image.asset(
                  AppAssets.imgRightCorner,
                  color: AppColors.lightBlack,
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.hadethCardBg),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(AppAssets.mosqueImg),
            ),
            Column(
              children: [
                SizedBox(height: 42),
                Text(
                  hadeth.title,
                  style: AppStyles.lightBlackBold16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      hadeth.content,
                      style: AppStyles.lightBlackBold16,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loadAhadethList() async {
    String fileContent = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );
    List<String> tempAhadeth = fileContent.trim().split("#");
    print(tempAhadeth.length);
    for (int i = 0; i < tempAhadeth.length; i++) {
      String hadeth = tempAhadeth[i].trim();
      List<String> hadethLines = hadeth.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);

      ///Remove title
      String content = hadethLines.join();
      ahadethList.add(HadethDM(title, content, i + 1));
    }
    setState(() {});
  }
}

class HadethDM {
  String title;
  String content;
  int index;

  HadethDM(this.title, this.content, this.index);
}
