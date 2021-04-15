import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Texts extends StatelessWidget {
  final String title;
  final Color colors;
  final double size;
  final String family;
  var weights;
  Texts({
    @required this.weights,
    @required this.title,
    @required this.colors,
    @required this.size,
    @required this.family,
  });
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color:colors, fontSize: size,
        fontFamily: family,
        fontWeight: weights,
      ),
      textAlign: TextAlign.start,
    );
  }
}





