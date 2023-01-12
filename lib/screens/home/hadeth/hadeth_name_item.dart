import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/hadeth/hadeth_tab.dart';
import '../../hadeth/hadeth_details_screen.dart';

class HadethNameItem extends StatelessWidget {
  HadethModel hadeth;

  HadethNameItem(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                  arguments: hadeth);
            },
            child: Column(
              children: [
                Text(hadeth.title,
                    style: Theme.of(context)!.textTheme.bodyMedium),
                Divider(
                  thickness: 3,
                  color: Theme.of(context)!.dividerTheme.color,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
