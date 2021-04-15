import 'package:flutter/material.dart';
import 'package:myproject/models/cart.dart';
import 'package:myproject/screen/CartPage.dart';
import 'package:provider/provider.dart';
import 'screen/login_screen.dart';
import 'screen/sign_up.dart';
import 'authentication/change_password.dart';
import 'authentication/confirm_code.dart';
import 'screen/overview.dart';
import 'screen/product_details.dart';
import 'constant/setting.dart';
import 'models/purchase.dart';
import 'screen/MyPurchase.dart';





final ProductDetails add =ProductDetails();

void main() =>
    runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create:(ctx)=> Cart(),
       ),
        ChangeNotifierProvider(
          create:(ctx)=> Purchase(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // brightness: Brightness.dark,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.cyan[600],
            textTheme: Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
              ),
              // and so on
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            'sign up': (context) => SignUp(),
            'change password': (context) => ChangePassword(),
            'confirm password': (context) => ConfirmCode(),
            'view Screen': (context) => HomeView(),
            'Details Product': (context) => ProductDetails(),
            'Settings': (context) =>Settings(),
            'Cart Page' : (context) => MyCart(),
            'My Purchase' : (context) => MyPurchase(),
          }
        // home: LoginPage(),
      ),
    );
  }

  static init() {}
}
