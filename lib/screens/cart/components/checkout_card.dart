import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';
import 'package:provider/provider.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(11),
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF5F6F9),
                  ),
                  child: SvgPicture.asset('assets/icons/receipt.svg'),
                ),
                Spacer(),
                Text('Add voucher code'),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: TextStyle(
                      fontSize: 16,
                      color: kTextColor,
                    ),
                    children: [
                      TextSpan(
                        text: "\$ ${context.watch<CartProvider>().total()}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultButton(
                    onPressed: () {},
                    text: 'Check Out',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
