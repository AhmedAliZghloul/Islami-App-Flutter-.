import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../providers/app_config_provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        children: [
          Center(
            child: Image.asset('assets/images/radio_image.png',
                height: 200), // Adjusted image height
            heightFactor: 2, // Adjusted height factor
          ),
          const SizedBox(height: 20), // Added spacing between image and text
          Text(AppLocalizations.of(context)!.holy_quran_radio,
              style: provider.isDarkMode()
                  ? TextStyle(
                      fontSize: 24, // Adjusted text font size
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    )
                  : TextStyle(
                      fontSize: 24, // Adjusted text font size
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    )),
          SizedBox(height: 20), // Added spacing between text and image
          provider.isDarkMode()
              ? Image.asset(
                  'assets/images/tap_radio_dark.png',
                  height: 150,
                )
              : Image.asset(
                  'assets/images/tap_radio.png',
                  height: 150,
                ), // Adjusted image height
        ],
      ),
    );
  }
}
