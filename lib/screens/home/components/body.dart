import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/home_header.dart';

import 'package:shop_app/themes/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader()
          ],
        ),
      ),
    );
  }
}
