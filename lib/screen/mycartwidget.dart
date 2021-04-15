import 'package:flutter/material.dart';
import 'package:myproject/constant/texts.dart';


class MyCartWidget extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  final String title;
  final String photo;
  final String number;
  final double quantity;
 // bool isChecking;
  MyCartWidget({this.id,this.price,this.title,this.photo,this.number,this.productId,this.quantity,
    //this.isChecking
  });
  @override
  _MyCartWidgetState createState() => _MyCartWidgetState();
}

class _MyCartWidgetState extends State<MyCartWidget> {
  bool isChecking =false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
           leading: CircleAvatar(child: Image.network(widget.photo),),
          title: Texts(weights: null, title: '${widget.price.toString()}\$', colors: null, size: null, family: null),
          subtitle: Texts(weights: null, title: widget.title, colors: null, size: null, family: null),
          isThreeLine: true,
           trailing: IconButton(
             onPressed: (){
               setState(() {
               isChecking=!isChecking;
             });},
             icon: isChecking
                 ?Icon(
               Icons.check_box,
               color: Colors.green,)
                 :Icon(
               Icons.check_box_outline_blank_sharp,
               color: Colors.red,)
           ),
        ),
      ),
    );
  }
}
