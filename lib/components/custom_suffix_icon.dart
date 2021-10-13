import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/themes/size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    this.icon,
  }) : super(key: key);

  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(19),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        icon!,
        height: getProportionateScreenWidth(20),
      ),
    );
  }
}
