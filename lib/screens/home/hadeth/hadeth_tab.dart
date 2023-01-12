import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_name_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  static String routeName = "Hadeth";

  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethModels = [];

  @override
  Widget build(BuildContext context) {
    if (hadethModels.isEmpty) {
      readHadethFile();
    }
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Image.asset("assets/images/hadeth_logo.png"),
          ),
        ),
        Divider(
          thickness: 3,
          color: Theme.of(context).dividerTheme.color,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          thickness: 3,
          color: Theme.of(context).dividerTheme.color,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: hadethModels.length,
            itemBuilder: (context, index) =>
                HadethNameItem(hadethModels[index]),
          ),
        ),
      ],
    );
  }

  readHadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/hadeth/hadeth.txt");
    List<String> allHadeth = hadethFile.split('#\r\n');
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> singleHadethLines = allHadeth[i].split("\n");
      String hadethTitle = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      // String hadethContent = singleHadethLines[i].toString();
      String hadethContent = singleHadethLines.join();
      hadethModels.add(HadethModel(hadethTitle, hadethContent));
    }
    setState(() {});
  }
}

class HadethModel {
  String title;
  String content;

  HadethModel(this.title, this.content);
}
