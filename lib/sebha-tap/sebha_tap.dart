import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/my_them_data.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SebhaTap extends StatefulWidget {
  @override
  _SebhaTapState createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  // زاوية التدوير الحالية للصورة
  double rotationAngle = 0;
  int count = 0; // عدد النقرات
  String currentTasbeehText = 'سبحان الله';

  void rotateImage() {
    setState(() {
      rotationAngle += math.pi / 1;
      count++;
      if (count % 33 == 0) {
        if (currentTasbeehText == 'سبحان الله') {
          currentTasbeehText = 'الحمد لله';
        } else if (currentTasbeehText == 'الحمد لله') {
          currentTasbeehText = 'لا إله إلا الله';
        } else if (currentTasbeehText == 'لا إله إلا الله') {
          currentTasbeehText = 'الله أكبر';
        } else {
          currentTasbeehText = 'سبحان الله';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(
                    left: 55,
                  ),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.3,
                      right: MediaQuery.of(context).size.width * 0.2,
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: provider.isDarkMode()
                      ? Image.asset('assets/images/headsebha_dark.png')
                      : Image.asset('assets/images/head_sebha.png')),
              GestureDetector(
                onTap: rotateImage,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                      margin: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 20,
                      ), /////////////////
                      child: provider.isDarkMode()
                          ? Image.asset('assets/images/bodysebha_dark.png')
                          : Image.asset('assets/images/body_sebha.png')),
                ),
              ),
            ],
          ),

          Container(
              margin: EdgeInsets.only(top: 0.05),
              padding: EdgeInsets.only(bottom: 20),
              child: provider.isDarkMode()
                  ? Text(
                      AppLocalizations.of(context)!.added_el_tasbehat,
                      style: MyThemData.darkMode.textTheme.bodyMedium,
                    )
                  : Text(
                      AppLocalizations.of(context)!.added_el_tasbehat,
                      style: MyThemData.lightMode.textTheme.bodyLarge,
                    )),
          // SizedBox(height: 20,),
          provider.isDarkMode()
              ? ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '$count', // عرض عدد النقرات على الزر
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xff141A2E),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        bottom: 35, right: 15, top: 35, left: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '$count', // عرض عدد النقرات على الزر
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xffB7935F),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        bottom: 35, right: 15, top: 35, left: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
          SizedBox(
            height: 15,
          ),
          provider.isDarkMode()
              ? ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    currentTasbeehText, // عرض النص المناسب بناءً على عدد النقرات
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.yellowColor,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.only(bottom: 5, right: 25, top: 5, left: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    currentTasbeehText, // عرض النص المناسب بناءً على عدد النقرات
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primaryLightColor,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.only(bottom: 5, right: 25, top: 5, left: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
