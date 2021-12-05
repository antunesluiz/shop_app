import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/CartProvider.dart';
import 'package:shop_app/providers/ProductDetailsProvider.dart';
import 'package:shop_app/providers/RegisterProvider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/launch/LaunchScreen.dart';
import 'package:shop_app/themes/theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDetailsProvider>(
          create: (context) => ProductDetailsProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (context) => RegisterProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: theme(),
        initialRoute: LaunchScreen.routeName,
        routes: routes,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('pt', 'BR'), // Portuguese
        ],
      ),
    );
  }
}
