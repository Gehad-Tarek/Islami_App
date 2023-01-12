import 'package:flutter/material.dart';
import 'package:islami_app/project_helpers/my_theme_data.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/screens/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/screens/home/home_screen.dart';
import 'package:islami_app/screens/quran/sura_details_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: myProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: Locale(myProvider.currentLocale),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
