import 'package:flutter/material.dart';
import '../../api/product_model.dart';
import '../productgridview.dart';
import '../../api/networkink.dart';




class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  Future<List<Product>> _products; //
  @override
  void initState() {
    super.initState();

    _products = ApiManager().getProduct('electronics'); //
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