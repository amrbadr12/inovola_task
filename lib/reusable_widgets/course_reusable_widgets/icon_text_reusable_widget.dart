import 'package:flutter/material.dart';

class IconTextContainer extends StatelessWidget {
  final icon;
  final Text text;

  IconTextContainer({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: MediaQuery.of(context).size.width * 0.04,
          color: Colors.grey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        text
      ],
    );
  }
}
