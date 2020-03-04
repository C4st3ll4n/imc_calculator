import 'package:flutter/material.dart';

import '../Constants.dart';

class CardSlider extends StatefulWidget {
  final double altura;
  final onChange;

  const CardSlider({Key key, this.altura, this.onChange}) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  @override
  Widget build(BuildContext context) {
    double altura = widget.altura;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "ALTURA",
          style: TextStyle(fontSize: 18, color: Color(kTextColor)),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              "$altura",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "cm",
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ),
        SliderTheme(
          child: Slider(
            value: altura,
            semanticFormatterCallback: (v) {
              return v.floorToDouble().toString();
            },
            onChanged: widget.onChange,
            max: 200,
            min: 100,
          ),
          data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: Color(0xFF8D8E98),
              activeTrackColor: Colors.white,
              thumbColor: Color(0xFFEB1555),
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
        ),
      ],
    ));
  }
}
