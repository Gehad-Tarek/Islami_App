import 'package:flutter/material.dart';
import 'package:islami_app/project_helpers/my_theme_data.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/screens/home/quran/quran_tab.dart';
import 'package:islami_app/screens/home/radio/radio_tab.dart';
import 'package:islami_app/screens/home/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/screens/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  List<Widget> homeTabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(myProvider.currentTheme == ThemeMode.light
                  ? "assets/images/default_background.png"
                  : "assets/images/dark_background.png"),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: myProvider.currentTheme == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.primaryDarkColor),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon_quran.png"),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon_hadeth.png"),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon_sebha.png"),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon_radio.png"),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
              ],
              currentIndex: selectedIndex,
              onTap: (clickedIndex) {
                selectedIndex = clickedIndex;
                setState(() {});
              },
            ),
          ),
          body: homeTabs[selectedIndex],
        ));
  }
}
