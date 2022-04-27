import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:places/res/assets/app_strings.dart';
import 'package:places/res/assets/settings.dart';
import 'package:places/ui/screen/places.dart';

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
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              title: Text(AppStrings.mapOfStrings[
                      'appSinglePlaceScreenDrawner2${SettingsApp.lang}'] ??
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
        title: Text(AppStrings.mapOfStrings[
                'appSinglePlaceScreenAppBarTitle${SettingsApp.lang}'] ??
            ''),
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
                items: place.images
                    .split(';')
                    .map(
                      Image.network,
                    )
                    .toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
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
