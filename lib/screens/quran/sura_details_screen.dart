import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/project_helpers/my_theme_data.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/screens/home/quran/sura_name_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static String routeName = "suraDetails";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String fileContent = "";
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as argumentsDetails;
    if (fileContent.isEmpty) {
      readFile(args.fileName);
    }
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
            Center(
              child: Text(args.suraName,
                  style: Theme.of(context)!.textTheme.bodyLarge),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Expanded(
                  child: ListView.builder(
                      itemCount: suraLines.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Center(
                              child: Text(
                                "${suraLines[index]}{${index + 1}}",
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)!.textTheme.bodySmall,
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              color: Theme.of(context)!.dividerTheme.color,
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  readFile(String fileName) async {
    String allFileContent =
        await rootBundle.loadString("assets/quran_files/$fileName");
    suraLines = allFileContent.split("\n");
    suraLines = suraLines.where((line) => line.isNotEmpty).toList();
    setState(() {});
  }
}
