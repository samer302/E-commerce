import 'package:flutter/material.dart';
import 'package:myproject/api/product_model.dart';
import '../productgridview.dart';
import '../../api/networkink.dart';




class MenClothing extends StatefulWidget {
  @override
  _MenClothingState createState() => _MenClothingState();
}

class _MenClothingState extends State<MenClothing> {
  Future<List<Product>> _products; //
  @override
  void initState() {
    super.initState();

    _products = ApiManager().getProduct('men clothing'); //
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
