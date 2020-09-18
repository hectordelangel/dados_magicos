import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dados(title: 'Dados mágicos'),
    );
  }
}

class Dados extends StatefulWidget {
  Dados({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  int _randomLeft = 0;
  int _randomRight = 0;
  final _randomLeftController = TextEditingController();
  final _randomRightController = TextEditingController();
  var _iconWidgets = List<Widget>();

  void _generateRandom() {
    setState(() {
      Random random1 = new Random();
      _randomLeft = random1.nextInt(6)+1;
      _randomLeftController.text = _randomLeft.toString();
      Random random2 = new Random();
      _randomRight = random2.nextInt(6)+1;
      _randomRightController.text = _randomRight.toString();
      _iconWidgets.clear();
      get_dado(_randomLeft);
      get_dado(_randomRight);
    });
  }

  void get_dado(number){
    switch(number) {
    case 1: {
      _iconWidgets.add(
          Image.asset('images/1.png',
            height: 100,
            width: 100,
          )
      );
    }
    break;
    case 2: {
      _iconWidgets.add(
          Image.asset('images/2.png',
            height: 100,
            width: 100,
          )
      );
    }
    break;
    case 3: {
      _iconWidgets.add(
          Image.asset('images/3.png',
            height: 100,
            width: 100,
          )
      );
    }
    break;
    case 4: {
      _iconWidgets.add(
          Image.asset('images/4.png',
            height: 100,
            width: 100,
          )
      );
    }
    break;
    case 5: {
      _iconWidgets.add(
          Image.asset('images/5.png',
            height: 100,
            width: 100,
          )
      );
    }
    break;
    case 6: {
      _iconWidgets.add(
          Image.asset('images/6.png',
            height: 100,
            width: 100,
          )
      );
    }
    break;
    default: { print("Invalid number"); }
    break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _buildInputsRow(),

          Padding(
            padding: const EdgeInsets.only(left: 75, right: 75, bottom: 10),
              child: Row(
                  children: _iconWidgets
              ),
            ),
        ],
      ),
    );
  }

  Row _buildInputsRow() {
    return Row(
      children: [
        _buildRandomField(_randomLeftController),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'let\'s roll',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                onPressed: () {
                  _generateRandom();
                }),
          ),
        ),
        _buildRandomField(_randomRightController),
      ],
    );
  }

  Flexible _buildRandomField(controller) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            enabled: false,
            controller: controller,
            decoration: InputDecoration(contentPadding: EdgeInsets.all(10))),
      ),
    );
  }
}
