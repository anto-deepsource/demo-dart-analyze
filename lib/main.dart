import 'dart:convert'; // unused import
import 'dart:math'; // unused import
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void _increment() {
    var unused = 42; // unused local variable
    setState(() {
      counter++;
    });
    print('Counter is now $counter'); // avoid_print
  }

  void _deadMethod() {
    // This method is never called — dead code
    var x = 10;
    if (x > 20) {
      print('unreachable'); // dead code branch + avoid_print
    }
  }

  String _noReturnType() {
    // ignore: missing_return
    if (counter > 0) {
      return 'positive';
    }
    // missing return path for counter <= 0
  }

  @override
  Widget build(BuildContext context) {
    var title = 'Demo'; // prefer_final_locals

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        // avoid_unnecessary_containers
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // prefer_const_constructors
              Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              // sized_box_for_whitespace
              Container(
                width: 100,
                height: 20,
              ),
              ElevatedButton(
                onPressed: _increment,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
