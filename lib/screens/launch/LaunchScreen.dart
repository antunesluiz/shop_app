import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/SplashScreen.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  static String routeName = '/launch_screen';

  @override
  Widget build(BuildContext context) {
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
    navigateToMainScreen();

    super.initState();
  }

  navigateToMainScreen() async {
    await Future.delayed(Duration(seconds: 5));

    Navigator.pushNamed(context, SplashScreen.routeName);
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
