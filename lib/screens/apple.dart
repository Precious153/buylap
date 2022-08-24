import 'package:flutter/material.dart';

class Apple extends StatelessWidget {
  const Apple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Apple',
        style: TextStyle(
            fontSize: 30,
            color: Colors.black
        ),),
    );
  }
}
