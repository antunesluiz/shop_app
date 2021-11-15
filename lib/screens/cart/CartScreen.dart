import 'package:flutter/material.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/screens/cart/components/body.dart';
import 'package:shop_app/screens/cart/components/checkout_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            'Your cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 2),
          Text(
            '${context.watch<CartProvider>().carts().length} itens',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
