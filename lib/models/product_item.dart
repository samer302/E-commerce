import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/api/product_model.dart';
import '../constant/texts.dart';
// ignore: non_constant_identifier_names


class ProductItem extends StatelessWidget {

 // ignore: non_constant_identifier_names

  final Product product;
  ProductItem({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Image.network(product.image,fit: BoxFit.fitWidth,height: 100,),
          ),
         SizedBox(height: 18,),
          Texts(weights: FontWeight.w500, title: product.title, colors: Colors.black, size: 13, family: null),
          Texts(weights: FontWeight.w500, title: '${product.price.toStringAsFixed(0)}  \$', colors: Colors.black, size: 13, family: null),
        ],
      ),
    );
  }
}
