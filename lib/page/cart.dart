import 'package:flutter/material.dart';
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Cart',
        style: TextStyle(
            fontSize: 30,
            color: Colors.black
        ),),
    );
  }
}
