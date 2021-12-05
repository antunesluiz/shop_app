import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/HomeScreen.dart';
import 'package:shop_app/screens/splash/SplashScreen.dart';
import 'package:shop_app/storage/UserSecureStorage.dart';
import 'package:shop_app/themes/size_config.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  static String routeName = '/launch_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    navigateToScreen();

    super.initState();
  }

  navigateToScreen() async {
    await UserSecureStorage.getUser().then((user) {
      if (user != null) {
        Navigator.popAndPushNamed(context, HomeScreen.routeName);
      } else {
        Navigator.popAndPushNamed(context, SplashScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Image.asset('assets/images/splash_1.png'),
      ),
    );
  }
}
