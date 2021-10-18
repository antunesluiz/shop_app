import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/custom_title_and_subtitle.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/terms_and_condition_text.dart';
import 'package:shop_app/screens/complete_profile/CompleteProfileScreen.dart';
import 'package:shop_app/screens/complete_profile/components/complete_profile_form.dart';
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
                title: 'Complete Profile',
                subtitle:
                    'Complete your details or continue \nwith social media',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
              TermAndCondition(),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
