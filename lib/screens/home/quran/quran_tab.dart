import 'package:flutter/material.dart';
import 'package:islami_app/project_helpers/my_theme_data.dart';
import 'package:islami_app/screens/home/quran/sura_name_item.dart';
import 'package:islami_app/screens/home/quran/suras_names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  static String routeName = "Quran";

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 3,
          child: Center(
              child: Image.asset(
            "assets/images/quran_tab_logo.png",
          ))),
      Divider(
        thickness: 3,
        color: Theme.of(context)!.dividerTheme.color,
      ),
      Text(
        AppLocalizations.of(context)!.suraName,
        style: Theme.of(context)!.textTheme.bodyLarge,
      ),
      Divider(
        thickness: 3,
        color: Theme.of(context)!.dividerTheme.color,
      ),
      Expanded(
        flex: 7,
        child: ListView.builder(
          itemCount: SurasNames.allQuranSurasNames.length,
          itemBuilder: (context, itemIndex) => SuraNameItem(itemIndex),
        ),
      ),
    ]);
  }
}
