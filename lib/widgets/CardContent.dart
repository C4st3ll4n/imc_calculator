import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String tittle;
  final IconData icon;
  final textColor;
  const CardContent(
      {Key key, this.tittle, this.icon, this.textColor = 0xFF8D8E98})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "$tittle",
          style: TextStyle(fontSize: 18, color: Color(textColor)),
        )
      ],
    );
  }
}
