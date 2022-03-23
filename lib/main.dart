import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _picker = ImagePicker();
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            DrawerHeader(
              child: Text('Drawer header.'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Settings...'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              final bar = _snackAction;
              ScaffoldMessenger.of(context).showSnackBar(bar.call());
            },
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body: Center(
        child: imageFile == null
            ? const Placeholder()
            : Image.file(
                imageFile!,
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.file_present_rounded),
            tooltip: 'Пример 1 home.',
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            tooltip: 'Пример 2 message.',
            label: 'Message',
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              _pickImageFromGallery();
            } else {
              _pickImageFromCamera();
            }
          });
        },
      ),
    );
  }

  SnackBar _snackAction() {
    return SnackBar(
      content: const Text(
        'Вы нажали на кнопку аларм в меню appbar.',
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      action: SnackBarAction(
        label: 'Я знаю.',
        textColor: Colors.white,
        disabledTextColor: Colors.black,
        onPressed: () {},
      ),
      backgroundColor: Colors.lightBlue,
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
    }
  }
}
