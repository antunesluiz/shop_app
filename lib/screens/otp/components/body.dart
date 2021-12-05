import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_title_and_subtitle.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/themes/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            CustomTitleAndSubtitle(
              title: 'OTP Verification',
              subtitle: 'We sent your code to +1 989 989 ***',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This code will expired in '),
                TweenAnimationBuilder(
                  tween: IntTween(begin: 30, end: 0),
                  duration: Duration(seconds: 30),
                  builder: (context, value, child) => Text(
                    "${value.toString()}",
                  ),
                ),
              ],
            ),
            Spacer(),
            Text('lsll'),
            Spacer(),
            DefaultButton(text: 'Continue', onPressed: () {}),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text('Resend OTP code'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
