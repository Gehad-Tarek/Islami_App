import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeModeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                myProvider.changeCurrentTheme(ThemeMode.light);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Light",
                  style: myProvider.currentTheme == ThemeMode.light
                      ? Theme.of(context).textTheme.titleMedium
                      : Theme.of(context).textTheme.labelMedium,
                ),
              )),
          InkWell(
            onTap: () {
              myProvider.changeCurrentTheme(ThemeMode.dark);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Dark",
                style: myProvider.currentTheme == ThemeMode.dark
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
