import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_title_and_subtitle.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/social_row.dart';
import 'package:shop_app/screens/sign_in/components/sign_form.dart';
import 'package:shop_app/themes/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                CustomTitleAndSubtitle(
                  title: 'Welcome Back',
                  subtitle:
                      'Sign in with your email and password \nor continue with social media',
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SocialRow(),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
