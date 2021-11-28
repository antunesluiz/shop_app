import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];
  double _total = 00.00;

  List<Cart> carts() => _carts;

  double total() => _total;

  void removeCart(Cart cart) {
    _carts.remove(cart);

    notifyListeners();
  }

  void addCart(Product product, int quantidade) {
    int index =
        _carts.indexWhere((element) => element.product.id == product.id);

    if (index != -1) {
      _carts[index] = new Cart(
          product: product, numItens: quantidade + _carts[index].numItens);
    } else {
      _carts.add(new Cart(product: product, numItens: quantidade));
    }

    notifyListeners();
  }
}
