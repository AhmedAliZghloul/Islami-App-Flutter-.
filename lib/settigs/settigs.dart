import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/settigs/themeBottomSheet.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import 'languageBottomSheet.dart';

class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)!.textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showlanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context)!.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.them,
            style: Theme.of(context)!.textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context)!.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showlanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
