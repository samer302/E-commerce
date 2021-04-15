import 'package:flutter/material.dart';
import 'package:myproject/screen/CartPage.dart';

class CartItem {
  final int id;
  final String title;
  final double price;
  final String photo;
  bool isChecking;
  final double quantity;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.photo,
    @required this.isChecking,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String image,
    double price,
    String title,
    String productId,
  ) {
    _items.putIfAbsent(
        productId,
        () => CartItem(
              photo: image,
              price: price,
              title: title,
              quantity: 1,
            ));
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
