// ignore_for_file: always_use_package_imports

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'places.dart';

class SightPlaceScreen extends StatelessWidget {
  final InterestingPlace place;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  SightPlaceScreen({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              title: const Text('Основной экран ...'),
            ),
            const ListTile(
              title: Text('Setting 3...'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Детальное описание'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('${place.name}: ${place.description}'),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: CarouselSlider(
                items: place.images,
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  // height: ,
                  enlargeCenterPage: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
