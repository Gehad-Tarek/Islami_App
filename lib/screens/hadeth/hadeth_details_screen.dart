import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_tab.dart';
import '../../project_helpers/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static String routeName = "hadethDetails";


  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;
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
          body: Column(
            children: [
              Text(args.title,
                  style: Theme.of(context)!.textTheme.bodyLarge),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: SingleChildScrollView(
                    child: Text(args.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: Theme.of(context)!.textTheme.bodySmall)),
              ),
            ],
          ),
        ));
  }
}
