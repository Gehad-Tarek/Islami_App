import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                myProvider.changeCurrentLocale("en");
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "English",
                  style: myProvider.currentLocale == "en"
                      ? Theme.of(context).textTheme.titleMedium
                      : Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                myProvider.changeCurrentLocale("ar");
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "العربية",
                  style:  myProvider.currentLocale == "ar"
                      ? Theme.of(context).textTheme.titleMedium
                      : Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ));
  }
}
