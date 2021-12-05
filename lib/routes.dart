import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart/CartScreen.dart';
import 'package:shop_app/screens/complete_profile/CompleteProfileScreen.dart';
import 'package:shop_app/screens/details/DetailsScreen.dart';
import 'package:shop_app/screens/forgot_password/ForgotPasswordScreen.dart';
import 'package:shop_app/screens/home/HomeScreen.dart';
import 'package:shop_app/screens/launch/LaunchScreen.dart';
import 'package:shop_app/screens/login_success/LoginSuccessScreen.dart';
import 'package:shop_app/screens/otp/OtpScreen.dart';
import 'package:shop_app/screens/sign_in/SignInScreen.dart';
import 'package:shop_app/screens/sign_up/SignUpScreen.dart';
import 'package:shop_app/screens/splash/SplashScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LaunchScreen.routeName: (context) => LaunchScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen()
};
