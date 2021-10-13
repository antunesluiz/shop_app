import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/sign_in/SignInScreen.dart';
import 'package:shop_app/screens/splash/SplashScreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen()
};
