import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth-tap/hadeth_tap.dart';
import 'package:islami_app/hadeth-tap/item_hadeth_details.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran-tap/item_sura_details.dart';
import 'package:islami_app/quran-tap/item_sura_name.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                'assets/images/bg_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
            appBar: AppBar(
              title: Text(
                args.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            body: //*******************
                Container(
              padding: EdgeInsets.all(30),

              ///**************
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: MediaQuery.of(context).size.height * 0.05),
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkMode
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ItemHadethDetails(content: args.content[index]);
                  // return ItemSuraName(name: verses[index], index: index);
                },
                itemCount: args.content.length,
              ),
            ))
      ],
    );
  }
}
