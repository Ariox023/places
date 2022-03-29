// ignore_for_file: always_use_package_imports, no_logic_in_create_state

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'places.dart';
import 'single_place_screen.dart';

class SightListScreen extends StatefulWidget {
  final List<InterestingPlace>? items;

  const SightListScreen({Key? key, this.items}) : super(key: key);

  @override
  State<SightListScreen> createState() {
    return _SightListScreenState(items);
  }
}

class _SightListScreenState extends State<SightListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late final List<InterestingPlace> _items;

  _SightListScreenState(List<InterestingPlace>? items) {
    _items = items ?? completeListOfInterestigPlaces();
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
            const DrawerHeader(
              child: Text('Settings...'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              title: const Text('Основной экран'),
            ),
            ListTile(
              onTap: () {
                final selectedPlaces = <InterestingPlace>[];
                for (final element in _items) {
                  if (element.selected) {
                    selectedPlaces.add(element);
                  }
                }
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) =>
                        SightListScreen(items: selectedPlaces),
                  ),
                );
              },
              title: const Text('Выбранные места'),
            ),
            const ListTile(
              title: Text('Setting 3...'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Список интересных мест'),
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
                                  items: item.images,
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
                              'Хочу посетить',
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

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        // ignore: parameter_assignments
        newIndex -= 1;
      }
      final itemX = _items.removeAt(oldIndex);
      _items.insert(newIndex, itemX);
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
