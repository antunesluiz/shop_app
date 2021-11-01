import 'package:flutter/material.dart';

import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/product_images.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
        ],
      ),
    );
  }
}
