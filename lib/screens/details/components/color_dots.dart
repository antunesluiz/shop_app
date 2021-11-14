import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/ProductProvider.dart';
import 'package:shop_app/screens/details/components/custom_app_bar_rounded_btn.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
            (index) => ColorDot(
              color: product.colors[index],
              index: index,
            ),
          ),
          Spacer(),
          CustomAppBarButton(
            icon: Icons.remove,
            onPressed: () {
              context.read<ProductProvider>().removeQuantidade();
            },
          ),
          SizedBox(width: getProportionateScreenWidth(8)),
          Consumer<ProductProvider>(builder: (context, productNotifier, child) {
            return Text(
              '${productNotifier.quantidade}',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
              ),
            );
          }),
          SizedBox(width: getProportionateScreenWidth(8)),
          CustomAppBarButton(
            icon: Icons.add,
            onPressed: () {
              context.read<ProductProvider>().addQuantidade();
            },
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.index,
  }) : super(key: key);

  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductProvider>().setSelectedColor = index;
      },
      child: Consumer<ProductProvider>(
        builder: (context, productNotifier, child) {
          return Container(
            margin: EdgeInsets.only(right: 2),
            padding: EdgeInsets.all(8),
            height: getProportionateScreenHeight(40),
            width: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: productNotifier.selectedColor == index
                  ? Border.all(color: kPrimaryColor)
                  : null,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
