import 'package:flutter/material.dart';
import 'package:myproject/api/product_model.dart';
import 'package:provider/provider.dart';
import '../constant/texts.dart';
import '../models/cart.dart';
import 'package:awesome_dialog/awesome_dialog.dart';



class ProductDetails extends StatefulWidget {
  final Product product;
  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: ()=> showAlertDialog(context),
                  child: Image.network(widget.product.image,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 50,),),
              ),
              SizedBox(height: 15,),
              Expanded(
                flex: 4,
                  child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Texts(weights: FontWeight.w500, title: 'Title', colors: Colors.black, size: 15, family: null),
                            SizedBox(height: 90,),
                            Texts(weights: FontWeight.w500, title: 'Description', colors: Colors.black, size: 15, family: null),
                            SizedBox(height: 142,),
                            Texts(weights: FontWeight.w500, title: 'Category', colors: Colors.black, size: 15, family: null),
                            SizedBox(height: 40,),
                            Texts(weights: FontWeight.w500, title: 'Price', colors: Colors.black, size: 15, family: null),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Texts(weights: null, title: widget.product.title, colors: null, size: null, family: null),
                            SizedBox(height: 60,),
                            Texts(weights: null, title:  widget.product.description, colors: null, size: null, family: null),
                            SizedBox(height: 40,),
                            Align(
                              alignment: Alignment.topLeft,
                                child: Texts(weights: null, title: widget.product.category.toString(), colors: null, size: null, family: null)),
                            SizedBox(height: 60,),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Texts(weights: null, title: widget.product.price.toString(), colors: null, size: null, family: null)),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         cart.addItem(widget.product.image,widget.product.price,widget.product.title,widget.product.id.toString());
         AwesomeDialog(
           context: context,
           dialogType: DialogType.NO_HEADER,
           animType: AnimType.BOTTOMSLIDE,
           title: 'Succes',
           desc: 'PRODUCT IS ADD TO YOUR CART',
           dialogBackgroundColor: Colors.grey,
           btnOkIcon: Icons.check_circle,
           btnOkColor: Colors.deepPurple,
           // btnOkOnPress: () {
           //   Navigator.of(context).pushNamed(LCheckboxListTile.id);
           // },
           // btnCancelOnPress: () {
           //   Navigator.of(context).pushNamed(TabBarDemo.id);
           // }
         ).show();
        },
        child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 29,),
        backgroundColor: Colors.purple,
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// replace this function with the examples above
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

