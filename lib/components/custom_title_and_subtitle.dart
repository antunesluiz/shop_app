import 'package:flutter/material.dart';
import 'package:shop_app/themes/size_config.dart';

class CustomTitleAndSubtitle extends StatelessWidget {
  const CustomTitleAndSubtitle({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Text(
          subtitle!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
