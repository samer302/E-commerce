import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constant/texts.dart';
import '../models/purchase.dart';

class MyPurchaseItem extends StatelessWidget {
  final PurchaseItem purchase;
  MyPurchaseItem(this.purchase);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 25,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
            title: Texts(weights: FontWeight.w600, title: 'Total:   ${purchase.amount}\$', colors: null, size: 18, family: null),
            subtitle: Texts(weights: FontWeight.w400, title: DateFormat('dd/MM/yyyy  kk:mm:a').format(purchase.dateTime), colors: null, size: null, family: null),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
