import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/constant/login_bottom.dart';

toastMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      // timeInSecForIos: 1,
      fontSize: 16.0
  );
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              height: 150,
              top: 90,
              left: 85,
              child: ImageIcon(
                AssetImage('assets/shopping-cart.png'),
                color: Colors.white,
                size: 210,
              ),
            ),
            Positioned(
              height: 50,
              top: 250,
              left: 140,
              child: Text(
                'SHOP',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LoginSiginScreen(),

          ],
        ),
      ),
    );
  }
}


