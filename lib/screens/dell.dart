import 'package:flutter/material.dart';

class Dell extends StatelessWidget {
  const Dell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Dell',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black
            ),),
          Image.asset('images/Saly.png')
        ],
      ),
    );
  }
}
