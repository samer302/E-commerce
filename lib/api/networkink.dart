import 'product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ApiManager {
  Future<List<Product>> getProduct(String categoryName) async {
    var client = http.Client(); //مشان ما نكتبا تحت بس
    List<Product> listOfProducts; //الليست يلي بدنا نحط فيا الداتا
    try {
      var response = await client
          .get('https://fakestoreapi.com/products/category/' + '$categoryName');
      if (response.statusCode == 200) {
        //اذا في داتا
        var jsonString = response.body; //ننسب لداتا لمتغير
        var jsonMap = json.decode(jsonString); //مندخل ماب مشان الديكود
        listOfProducts = List<Product>.from(jsonMap
            .map((model) => Product.fromJson(model))); //حطيناها فورم بموديل
     //   print(listOfProducts);
        // product = Product.fromJson(jsonMap);
      }
    } catch (error) {
      return listOfProducts;
    }
    return listOfProducts;
  }
}