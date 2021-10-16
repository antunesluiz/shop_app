import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_title_and_subtitle.dart';
import 'package:shop_app/components/social_row.dart';
import 'package:shop_app/screens/sign_up/components/sign_up_form.dart';
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
                title: 'Register Account',
                subtitle:
                    'Complete your details or continue\n with social media',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              SignUpForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
              SocialRow(),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'By continuing  your confirm that you agree \n with our Term and Condition',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
