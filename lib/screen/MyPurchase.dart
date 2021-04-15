import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/purchase.dart';
import 'mypurchase_item.dart';
import '../models/cart.dart';

class MyPurchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final purchaseDate = Provider.of<Purchase>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('My Purchase'),
      ),
      body: ListView.builder(
        itemCount: purchaseDate.purchas.length,
        itemBuilder: (ctx, i) => MyPurchaseItem(purchaseDate.purchas[i]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.delete),
        onPressed: (){
          cart.clear();
        },
      ),
    );
  }
}
