import 'package:flutter/material.dart';
import 'package:myproject/api/product_model.dart';
import '../productgridview.dart';
import '../../api/networkink.dart';






class WomenClothing extends StatefulWidget {
  @override
  _WomenClothingState createState() => _WomenClothingState();
}

class _WomenClothingState extends State<WomenClothing> {
  Future<List<Product>> _products; //
  @override
  void initState() {
    super.initState();

    _products = ApiManager().getProduct('women clothing'); //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: FutureBuilder(
        future: _products,
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            return ProductGridView(
              products: snapshot.data,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
