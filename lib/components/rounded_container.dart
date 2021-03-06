import 'package:flutter/material.dart';
import 'package:shop_app/themes/size_config.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(20),
        bottom: getProportionateScreenHeight(20),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
