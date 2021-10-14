import 'package:flutter/material.dart';
import 'package:shop_app/screens/forgot_password/ForgotPasswordScreen.dart';
import 'package:shop_app/themes/constants.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ForgotPasswordScreen.routeName,
      ),
      child: Text(
        'Forgot Password',
        style: TextStyle(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
