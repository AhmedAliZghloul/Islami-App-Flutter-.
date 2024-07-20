import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran-tap/sura_detatils_screen.dart';
import 'package:provider/provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;

  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: provider.isDarkMode()
          ? Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    );
  }
}
