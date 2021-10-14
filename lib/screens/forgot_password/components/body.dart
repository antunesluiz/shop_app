import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/custom_title_and_subtitle.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/screens/forgot_password/components/forgot_password_form.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              CustomTitleAndSubtitle(
                title: 'Forgot Password',
                subtitle:
                    'Please, enter your email and we will send\nyou a link to return to your account',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              ForgotPasswordForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
