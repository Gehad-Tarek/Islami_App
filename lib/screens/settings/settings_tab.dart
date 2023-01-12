import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/screens/settings/language_bottom_sheet.dart';
import 'package:islami_app/screens/settings/theme_mode_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static String routeName = "settings tab";

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Language",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: InkWell(
                onTap: showLanguageBottomSheet,
                child: Row(
                  children: [
                    Text(
                      myProvider.currentLocale == "en"? "English": "العربية",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_drop_down,
                        color: Theme.of(context).iconTheme.color),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Text("Theme", style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: InkWell(
                onTap: showThemeModeBottomSheet,
                child: Row(
                  children: [
                    Text(myProvider.currentTheme == ThemeMode.light ? "Light": "Dark", style: Theme.of(context).textTheme.titleSmall),
                    const Spacer(),
                    Icon(Icons.arrow_drop_down,
                        color: Theme.of(context).iconTheme.color),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  showThemeModeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeModeBottomSheet();
        });
  }
}
