import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/screens/cart/components/cart_item_card.dart';
import 'package:shop_app/themes/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Consumer<CartProvider>(
        builder: (context, cartNotifier, child) {
          return ListView.builder(
            itemCount: cartNotifier.carts().length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
              ),
              child: Dismissible(
                key: Key(cartNotifier.carts()[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  cartNotifier.removeCart(cartNotifier.carts()[index]);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0XFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset('assets/icons/Trash.svg')
                    ],
                  ),
                ),
                child: CartItemCard(
                  cart: cartNotifier.carts()[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
