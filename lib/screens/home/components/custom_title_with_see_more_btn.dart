import 'package:flutter/material.dart';
import 'package:shop_app/themes/size_config.dart';

class CustomTitleWithSeeMoreBtn extends StatelessWidget {
  const CustomTitleWithSeeMoreBtn({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(18),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: onTap,
            child: Text(
              'See more',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
