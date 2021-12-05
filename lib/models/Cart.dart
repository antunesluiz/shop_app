import 'package:shop_app/models/Product.dart';

class Cart {
  final Product product;
  final int numItens;

  Cart({
    required this.product,
    required this.numItens,
  });
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numItens: 2),
  Cart(product: demoProducts[1], numItens: 4),
  Cart(product: demoProducts[2], numItens: 1),
];
