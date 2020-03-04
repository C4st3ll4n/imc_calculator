import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc_calculator/Gender.dart';
import 'package:imc_calculator/screen/ResultPage.dart';
import 'package:imc_calculator/widgets/CardContent.dart';
import 'package:imc_calculator/widgets/CardReusable.dart';
import 'package:imc_calculator/widgets/CardSlider.dart';

import '../Constants.dart';
import '../IMCBrain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  double peso = 60;
  double altura = 150;
  int idade = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateCardcolor(Gender.MASCULINO);
                    },
                    child: ReusableCard(
                      cor: selectedGender == Gender.MASCULINO
                          ? Color(kCardActiveColor)
                          : Color(kCardInactiveColor),
                      cardChild: CardContent(
                          tittle: "MASCULINO", icon: FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateCardcolor(Gender.FEMININO);
                    },
                    child: ReusableCard(
                        cor: selectedGender == Gender.FEMININO
                            ? Color(kCardActiveColor)
                            : Color(kCardInactiveColor),
                        cardChild: CardContent(
                          tittle: "FEMININO",
                          icon: FontAwesomeIcons.venus,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cor: Color(kCardActiveColor),
              cardChild: CardSlider(
                altura: altura,
                onChange: (double vl) {
                  setState(() {
                    altura = vl.roundToDouble();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cor: Color(kCardActiveColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("PESO",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            )),
                        Text(
                          "$peso",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icone: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icone: Icons.add,
                              onPressed: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cor: Color(kCardActiveColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("IDADE",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            )),
                        Text(
                          "$idade",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icone: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icone: Icons.add,
                              onPressed: () {
                                setState(() {
                                  idade++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              IMCBrain _brain = new IMCBrain(peso, altura);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ResultPage(
                            imcResultado: _brain.calculate(),
                            resultText: _brain.getResult(),
                            interpretation: _brain.getInterpretation(),
                          )));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              color: Color(kBottomContainerColor),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                  child: Text(
                "CALCULAR",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )),
            ),
          )
        ],
      ),
    );
  }

  void updateCardcolor(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icone;
  final Function onPressed;

  const RoundIconButton(
      {Key key, @required this.icone, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      child: Icon(
        icone,
        color: Colors.white,
      ),
      onPressed: this.onPressed,
    );
  }
}
