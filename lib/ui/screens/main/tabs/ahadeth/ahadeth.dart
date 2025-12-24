import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_c17/ui/utils/app_assets.dart';
import 'package:islami_c17/ui/utils/app_colors.dart';
import 'package:islami_c17/ui/utils/app_styles.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.quranTabBg), fit: BoxFit.fill)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.quranTabLogo),
            Expanded(child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false ,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                height: double.infinity
              ),
             itemCount: 10,
              itemBuilder: (context, index, _){
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.imgLeftCornerGold, color: AppColors.lightBlack,),
                          Spacer(),
                          Text("الحديث الاول", style: AppStyles.lightBlackBold24,),
                          Spacer(),
                          Image.asset(AppAssets.imgRightCornerGold, color: AppColors.lightBlack,),
                        ],
                      ),
                      Text("asjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsaasjdnsabjjdbsa")
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
