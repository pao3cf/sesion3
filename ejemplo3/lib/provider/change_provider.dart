import 'package:flutter/material.dart';

class ChangeProvider with ChangeNotifier {
  bool datoT = false; // Titulo
  bool dato = false; // Polo Norte
  bool dato2 = false; //Cenas

  bool isEmpty = false; //Gif

  bool get isChange => dato;

  // Titulo
  cambiarT(bool value) {
    datoT = value;
    print(value);
    notifyListeners();
  }

  // Polo Norte
  cambiar(bool value) {
    dato = value;
    print(value);
    notifyListeners();
  }

  //Cenas
  cambiar2(bool value) {
    dato2 = value;
    print(value);
    notifyListeners();
  }

  // Alerta
  btnMostrarAlerta() {
    (dato == false && dato2 == false && datoT == false)
        ? (isEmpty = true)
        : (isEmpty = false);

    notifyListeners();
  }
}
