import 'package:flutter/foundation.dart';
import 'package:myproject/models/cart.dart';
import 'cart.dart';

class PurchaseItem{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime  dateTime;
  PurchaseItem({this.id,this.amount,this.products,this.dateTime});
}

class Purchase with ChangeNotifier{
  List<PurchaseItem> _purchase = [];

  List<PurchaseItem> get purchas {
    return [..._purchase];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _purchase.insert(
      0,
      PurchaseItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }

}