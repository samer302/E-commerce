import 'package:flutter/material.dart';
import '../api/product_model.dart';
import 'product_item.dart';
import '../screen/product_details.dart';



class ProductGridView extends StatefulWidget {
  static const String id = '/ProductGridView';

  final List<Product> products;

  ProductGridView({this.products});

  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 5.0 / 7.0,
          crossAxisCount: 2,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => GestureDetector(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // set rounded corner radius
            ),
            child: ProductItem(product:widget.products[index])),
        onTap: () {
          // Navigator.of(context).pushNamed(Details.id);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetails(
                product: widget.products[index],
              ),
            ),
          );
        },
      ),
    );
  }
}