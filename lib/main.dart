// ignore_for_file: unused_import, always_use_package_imports

import 'package:flutter/material.dart';

import 'ui/screen/places.dart';
import 'ui/screen/sight_list_screen.dart';
import 'ui/screen/single_place_screen.dart';

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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return null;
      },
      routes: {
        '/second': (context) => const SightListScreen(),
      },
      home: const MyHomePage(
        title: 'Пример',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      resizeToAvoidBottomInset: false,
      drawer: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              child: Text('Settings...'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
              title: const Text('Список мест ...'),
            ),
            const ListTile(
              title: Text('Setting 2...'),
            ),
            const ListTile(
              title: Text('Setting 3...'),
            ),
          ],
        ),
      ),
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
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Пример строки для ввода',
                helperText: 'Введите строку.',
                labelText: 'Нажмите для вызова клавиатуры.',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
