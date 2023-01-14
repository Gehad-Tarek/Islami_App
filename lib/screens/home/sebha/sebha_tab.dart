import 'package:flutter/material.dart';
import 'package:islami_app/project_helpers/my_theme_data.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  static String routeName = "Sebha";

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int zekrCount = 0;
  int currentIndex = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله"
  ];

  void rotateSebhaBody() {
    angle--;
    zekrCount++;
    for (int i = 0; i <= azkar.length - 1; i++) {
      if (zekrCount > 33) {
        angle = 0;
        zekrCount = 0;
        currentIndex++;
      } else if (currentIndex == 3 && zekrCount > 1) {
        angle = 0;
        zekrCount = 0;
        currentIndex = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    return Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.46,
                  child: Image.asset(
                    myProvider.currentTheme == ThemeMode.light
                        ? "assets/images/head_sebha_logo.png"
                        : "assets/images/head_sebha_dark.png",
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.143,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.001,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      rotateSebhaBody();
                      setState(() {});
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        myProvider.currentTheme == ThemeMode.light
                            ? "assets/images/body_sebha_logo.png"
                            : "assets/images/body_sebha_dark.png",
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(flex: 1),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor),
          child: Center(
            child: Text("$zekrCount",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        const Spacer(flex: 1),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: myProvider.currentTheme == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.accentDarkColor),
          child: Center(
            child: Text(
              azkar[currentIndex],
              textAlign: TextAlign.center,
              style: myProvider.currentTheme == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
