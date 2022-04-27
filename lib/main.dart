import 'package:flutter/material.dart';
import 'package:places/res/assets/app_strings.dart';
import 'package:places/res/assets/settings.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.mapOfStrings['appName${SettingsApp.lang}'] ?? '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/second': (context) => const SightListScreen(),
      },
      home: MyHomePage(
        title: AppStrings.mapOfStrings['appTitle${SettingsApp.lang}'] ?? '',
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
      resizeToAvoidBottomInset: false,
      drawer: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Text(AppStrings.mapOfStrings[
                      'appMainDrawnerHeader${SettingsApp.lang}'] ??
                  ''),
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
              title: Text(AppStrings.mapOfStrings[
                      'appMainDrawnerSetting1${SettingsApp.lang}'] ??
                  ''),
            ),
            ListTile(
              title: Text(AppStrings.mapOfStrings[
                      'appMainDrawnerSetting2${SettingsApp.lang}'] ??
                  ''),
            ),
            ListTile(
              title: Text(AppStrings.mapOfStrings[
                      'appMainDrawnerSetting3${SettingsApp.lang}'] ??
                  ''),
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
            Text(AppStrings.mapOfStrings[
                    'appMainColumnFirstElement${SettingsApp.lang}'] ??
                ''),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: AppStrings.mapOfStrings[
                        'appMainFirstTextFormFieldhint${SettingsApp.lang}'] ??
                    '',
                helperText: AppStrings.mapOfStrings[
                        'appMainFirstTextFormFieldhelper${SettingsApp.lang}'] ??
                    '',
                labelText: AppStrings.mapOfStrings[
                        'appMainFirstTextFormFieldlabel${SettingsApp.lang}'] ??
                    '',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: AppStrings.mapOfStrings[
                'appMainNameOfFloatingActionButton${SettingsApp.lang}'] ??
            '',
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
