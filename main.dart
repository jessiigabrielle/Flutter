import 'package:aula1/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Center(child: Text('hello world!!!!!!!', textDirection: TextDirection.ltr,)),
      home: HomePage(), 
    );
  }
}
