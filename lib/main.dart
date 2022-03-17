// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, avoid_print, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: MySecondWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  MyFirstWidget({Key? key}) : super(key: key);
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // при горячем рестарте значение счетчика сбрасывается. Потому что у StatelessWidget нет состояния(каждый раз стоится заново.).
    counter++;
    print(counter);
    return Container(
      child: Center(
        child: Text('Hello'),
      ),
    );
  }
}

class MySecondWidget extends StatefulWidget {
  const MySecondWidget({Key? key}) : super(key: key);
  @override
  State<MySecondWidget> createState() => _MySecondWidget();
}

class _MySecondWidget extends State<MySecondWidget> {
  // при горячем рестарте сохраняется предыдущее значение счетчика. Потому что у StatefulWidgetа есть состояние.
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    counter++;
    print(counter);
    return Container(
      child: Center(
        child: Text('Hello $counter'),
      ),
    );
  }
}
