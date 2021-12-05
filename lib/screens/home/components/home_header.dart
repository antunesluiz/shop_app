import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/screens/cart/CartScreen.dart';
import 'package:shop_app/screens/home/components/custom_btn_with_counter.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/themes/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Consumer<CartProvider>(builder: (context, cartNotifier, child) {
            return CustomBtnWithCounter(
              icone: 'assets/icons/Cart Icon.svg',
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
              count: cartNotifier.carts().length,
            );
          }),
          CustomBtnWithCounter(
            icone: 'assets/icons/Bell.svg',
            onTap: () {},
            count: 6,
          )
        ],
      ),
    );
  }
}
