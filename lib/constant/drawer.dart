import 'package:flutter/material.dart';
import 'texts.dart';
class DrawerWidget extends StatelessWidget {
  void _settingsPage(BuildContext context){
    Navigator.of(context).pushNamed('Settings');
  }
  void _myCartPage(BuildContext context){
    Navigator.of(context).pushNamed('Cart Page');
  }
  void _mypuchase(BuildContext context){
    Navigator.of(context).pushNamed('My Purchase');
  }

  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/shopping-cart.png'),
                    color: Colors.white,
                    size: 80,
                  ),
                  Text(
                    'SHOP',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/login.jpg'),
                    fit: BoxFit.cover)
            ),),
          ListTile(
            leading: IconButton(
              icon:Icon(Icons.settings, color: Colors.purple[600],),onPressed: ()=>_settingsPage(context),
            ),
            title: Texts(weights: FontWeight.w600, title: 'Settings', colors: Colors.black, size: 16, family: null),
          ),
          ListTile(
            leading: IconButton(icon:Icon(Icons.shopping_cart_outlined, color: Colors.purple[600],),onPressed:()=>_myCartPage(context),
            ),
            title: Texts(weights: FontWeight.w600, title: 'My Cart', colors: Colors.black, size: 16, family: null),
          ),
          ListTile(
            leading: IconButton(icon:Icon(Icons.shop, color: Colors.purple[600],),onPressed: ()=>_mypuchase(context),
            ),
            title: Texts(weights: FontWeight.w600, title: 'My Purchase', colors: Colors.black, size: 16, family: null),
          ),
          ListTile(
            leading: IconButton(icon:Icon(Icons.list, color: Colors.purple[600],),onPressed: null,
            ),
            title:Texts(weights: FontWeight.w600, title: 'My Activity', colors: Colors.black, size: 16, family: null),
          ),
          ListTile(
            leading: IconButton(icon:Icon(Icons.info, color: Colors.purple[600],),onPressed: null,
            ),
            title: Texts(weights: FontWeight.w600, title: 'About', colors: Colors.black, size: 16, family: null),
          ),
          SizedBox(height: 270,),
          ListTile(
            leading: IconButton(icon:Icon(Icons.login_sharp, color: Colors.purple[600],),onPressed: null,
            ),
            title: Texts(weights: FontWeight.w600, title: ' Log out', colors: Colors.black, size: 18, family: null),
          ),
        ],
      ),
    );
  }
}