import 'package:flutter/material.dart';
class Icon_content extends StatelessWidget {
  const Icon_content({this.logo ,this.data});

  final IconData logo;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[


        Icon(
          logo,
          color: Colors.white,
          size: 50.0,
        ),
        SizedBox(
          height: 20.0,

        ),
        Text(
          "$data ",style: TextStyle(fontSize: 20.0,color: Colors.white),
        ),                       ],
    );
  }
}
