import 'dart:math';

class IMCBrain {
  final peso;
  final altura;

  double _imc;

  IMCBrain(this.peso, this.altura);

  String calculate() {
    _imc = peso / pow(altura / 100, 2);
    return _imc.toStringAsFixed(2);
  }

  String getResult() {
    if (_imc >= 25) {
      return "Sobrepeso";
    } else if (_imc > 18.5) {
      return "Normal";
    } else
      return "Magreza";
  }

  String getInterpretation() {
    if (_imc >= 25) {
      return "Faça mais exercicios";
    } else if (_imc > 18.5) {
      return "Mantenha seu peso";
    } else
      return "Coma mais";
  }
}
