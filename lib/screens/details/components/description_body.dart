import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_container.dart';
import 'package:shop_app/components/top_rounded_container.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/providers/ProductDetailsProvider.dart';
import 'package:shop_app/screens/cart/CartScreen.dart';
import 'package:shop_app/screens/details/components/color_dots.dart';
import 'package:shop_app/screens/details/components/product_description.dart';
import 'package:shop_app/themes/size_config.dart';

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: Colors.white,
      child: Column(
        children: [
          ProductDescription(product: product, onTapSeeMore: () {}),
          Column(
            children: [
              RoundedContainer(
                color: Color(0xFFF6F7F9),
                child: ColorDots(product: product),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.15,
                ),
                child: Consumer<ProductDetailsProvider>(
                  builder: (context, productNotifier, child) {
                    return DefaultButton(
                      onPressed: () {
                        context.read<CartProvider>().addCart(
                              product,
                              productNotifier.quantidade,
                            );

                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      text: 'Add to cart',
                    );
                  },
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20))
            ],
          )
        ],
      ),
    );
  }
}
