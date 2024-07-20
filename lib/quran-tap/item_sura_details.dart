import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran-tap/sura_detatils_screen.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;

  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return provider.isDarkMode()
        ? Text(
            '$content (${index + 1})', ////****
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        : Text(
            '$content (${index + 1})', ////****
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium,
          );
  }
}
