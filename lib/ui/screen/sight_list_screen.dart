import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:places/res/assets/app_strings.dart';
import 'package:places/res/assets/settings.dart';
import 'package:places/ui/screen/places.dart';
import 'package:places/ui/screen/selected_places.dart';
import 'package:places/ui/screen/single_place_screen.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late List<InterestingPlace> _items = [];

  @override
  void initState() {
    super.initState();
    _initializeListOfInterestingPlaces();
  }

  @override
  void didUpdateWidget(covariant SightListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initializeListOfInterestingPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
                completeJSONFromListOfInterestigPlaces(_items);
                Navigator.pushNamed(context, '/');
              },
              title: Text(AppStrings.mapOfStrings[
                      'appSinglePlaceScreenDrawner2${SettingsApp.lang}'] ??
                  ''),
            ),
            ListTile(
              onTap: () {
                // final selectedPlaces = <InterestingPlace>[];
                // for (final element in _items) {
                //   if (element.selected) {
                //     selectedPlaces.add(element);
                //   }
                // }
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) => SelsectedPlaces(items: _items),
                  ),
                );
              },
              title: Text(AppStrings.mapOfStrings[
                      'appSingleListScreenDrawner2${SettingsApp.lang}'] ??
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
                'appSingleListScreenAppBarTitle${SettingsApp.lang}'] ??
            ''),
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (final item in _items)
            Container(
              key: Key(item.name),
              child: SafeArea(
                top: false,
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SectionTitle(
                        title: item.name,
                        key: Key(item.name),
                      ),
                      SizedBox(
                        height: 250,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push<void>(
                                MaterialPageRoute(
                                  builder: (context) => SightPlaceScreen(
                                    place: item,
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  color: item.selected
                                      ? colorScheme.primary.withOpacity(0.08)
                                      : Colors.transparent,
                                ),
                                CarouselSlider(
                                  items: item.images
                                      .split(';')
                                      .map(
                                        Image.network,
                                      )
                                      .toList(),
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: item.selected
                                          ? colorScheme.primary
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                item.selected = !item.selected;
                              });
                            },
                            child: Text(
                              AppStrings.mapOfStrings[
                                      'appSingleListScreenLikeButton${SettingsApp.lang}'] ??
                                  '',
                              semanticsLabel: item.name,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
        onReorder: _onReorder,
      ),
    );
  }

  Future<void> _initializeListOfInterestingPlaces() async {
    final listFuture = await completeListOfInterestigPlaces();
    setState(() {
      _items = listFuture;
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      var ind = newIndex;
      if (newIndex > oldIndex) {
        ind = newIndex - 1;
      }
      final itemX = _items.removeAt(oldIndex);
      _items.insert(ind, itemX);
    });
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    required Key key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
