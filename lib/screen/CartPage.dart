import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'mycartwidget.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/purchase.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final purchase = Provider.of<Purchase>(context);
    return  Scaffold(
        backgroundColor: Color(0xf1f1f9f9),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('My Cart'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<Cart>(
            builder: (context, cart, child) => ListView.builder(
                itemCount: cart.items.length, //عددهن
                itemBuilder: (ctx, index) {
                  return MyCartWidget(
                    id: cart.items.values.toList()[index].id.toString(),
                    title: cart.items.values.toList()[index].title,
                    price: cart.items.values.toList()[index].price,
                    photo: cart.items.values.toList() [index].photo,
                    productId: cart.items.keys.toList()[index],
                 quantity: cart.items.values.toList()[index].quantity,

                 //   isChecking: cart.items.values.toList()[index].isChecking,
                    // longPressCallback: () {
                    //   cart.removeItem(cart.items.values.toString());
                    // },

                  );
                }),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag:
                    "btn1", //todo ضروري اذا بدنا نحط اكتر من زر مشان الهيرو انميشن
                //منحطه برا مشان يجي عاليمين
                tooltip: 'Increment',
                child: Icon(
                  Icons.delete_forever,
                ),
                onPressed: () {
                  //    cart.removeItem(cart.items.keys.toList().);
                },
                backgroundColor: Colors.deepPurple,
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                heroTag: "btn2",
                //منحطه برا مشان يجي عاليمين
                tooltip: 'Increment',
                child: Icon(
                  Icons.attribution_rounded,
                ),
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  purchase.addOrder(cart.items.values.toList(), cart.totalAmount);
                  cart.clear();

                  AwesomeDialog(
                    context: context,
                    animType: AnimType.LEFTSLIDE,
                    headerAnimationLoop: false,
                    dialogType: DialogType.QUESTION,
                    title: 'ARE YOU SOURE',
                    desc:
                        'The operation was successfully completed..................................',
                    btnOkIcon: Icons.check_circle,
                    btnOkOnPress: () {
                      int num = cart.items.length;
                    },
                    btnCancelOnPress: () {
                      Navigator.of(context).pushNamed(MyCartWidget().id);
                      debugPrint('Dialog Dissmiss from callback');
                    },
                  ).show();
                },
              ),
            ],
          ),
        ),

    );
  }
}
