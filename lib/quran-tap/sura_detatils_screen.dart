import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran-tap/item_sura_details.dart';
import 'package:islami_app/quran-tap/item_sura_name.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
                args.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ))
                : //*******************
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: MediaQuery.of(context).size.height * 0.05),
                    decoration: BoxDecoration(
                      color: provider.isDarkMode()
                          ? AppColors.primaryDarkMode
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.primaryLightColor,
                          thickness: 2,
                        );
                      },
                      itemBuilder: (context, index) {
                        return ItemSuraDetails(
                            content: verses[index], index: index);
                        // return ItemSuraName(name: verses[index], index: index);
                      },
                      itemCount: verses.length,
                    ),
                  ))
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
