import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cont = 1;
  void _onLongPress() {
    setState(() {
      _cont = 0;
    });
    // _ pq é privado pq so vai usar aqui nessa classe
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First Flutter App'),
      ),
      body: GestureDetector(
        child: Center(
          child: Text(
            'Calc: $_cont',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            print('clicouuu');
            _cont = _cont * 2;
          });
        },
        onLongPress: _onLongPress,
      ),
    );
  }
}

