import 'package:flutter/material.dart';
import 'package:islami_app/hadeth-tap/hadeth_detatils_screen.dart';
import 'package:islami_app/home_screen_islami.dart';
import 'package:islami_app/my_them_data.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran-tap/sura_detatils_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // تأكد من أنه يمكن إجراء عمليات غير متزامنة قبل تشغيل التطبيق

  // تهيئة SharedPreferences
  final appConfigProvider = AppConfigProvider();
  await appConfigProvider.loadPreferences(); // انتظر تحميل التفضيلات

  runApp(
    ChangeNotifierProvider<AppConfigProvider>(
      create: (context) => appConfigProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
      // استخدام Consumer لمراقبة التغييرات
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routName,
          routes: {
            HomeScreen.routName: (context) => HomeScreen(),
            SuraDetailsScreen.routName: (context) => SuraDetailsScreen(),
            HadethDetailsScreen.routName: (context) => HadethDetailsScreen(),
          },
          theme: MyThemData.lightMode,
          themeMode: provider.appTheme,
          darkTheme: MyThemData.darkMode,
          locale: Locale(provider.appLanguage),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
