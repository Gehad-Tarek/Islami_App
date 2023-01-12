import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget{
  static String routeName= "Radio";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child:
            Text(routeName, style: TextStyle(fontSize: 30),)
        )
      ],
    );
  }
}
