import 'package:flutter/material.dart';

class ProductDetailsProvider with ChangeNotifier {
  int _selectedColor = 3;
  int _quantidade = 1;

  get selectedColor => _selectedColor;
  get quantidade => _quantidade;

  set setSelectedColor(int color) {
    _selectedColor = color;

    notifyListeners();
  }

  void addQuantidade() {
    _quantidade++;

    notifyListeners();
  }

  void removeQuantidade() {
    if (_quantidade > 1) _quantidade--;

    notifyListeners();
  }

  void limpaProductProvider() {
    _selectedColor = 3;
    _quantidade = 1;
  }
}
