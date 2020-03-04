import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cor;
  final Widget cardChild;

  const ReusableCard({Key key, @required this.cor, this.cardChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cor,
      ),
    );
  }
}
