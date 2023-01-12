import 'package:flutter/material.dart';
import 'package:islami_app/project_helpers/my_theme_data.dart';
import 'package:islami_app/screens/quran/sura_details_screen.dart';
import 'package:islami_app/screens/home/quran/suras_names.dart';

class SuraNameItem extends StatelessWidget {
  int suraIndex;

  SuraNameItem(this.suraIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                  arguments: argumentsDetails(
                      SurasNames.allQuranSurasNames[suraIndex],
                      "${suraIndex + 1}.txt"));
            },
            child: Text(
              SurasNames.allQuranSurasNames[suraIndex],
              style: Theme.of(context)!.textTheme.bodyMedium,
            ),
          ),
        ),
        Divider(thickness: 3, color: Theme.of(context)!.dividerTheme.color),
      ],
    );
  }
}

class argumentsDetails {
  String fileName;
  String suraName;

  argumentsDetails(this.suraName, this.fileName);
}
