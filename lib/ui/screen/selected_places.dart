import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:places/res/assets/app_strings.dart';
import 'package:places/res/assets/settings.dart';
import 'package:places/ui/screen/places.dart';
// import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/single_place_screen.dart';

class SelsectedPlaces extends StatefulWidget {
  final List<InterestingPlace> items;

  const SelsectedPlaces({Key? key, required this.items}) : super(key: key);

  @override
  State<SelsectedPlaces> createState() => _SelsectedPlacesState();
}

class _SelsectedPlacesState extends State<SelsectedPlaces> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late final List<InterestingPlace> _items = widget.items;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return WillPopScope(
      onWillPop: () async {
        await Future(_goToSecondScreen);

        return false;
      },
      child: Scaffold(
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
                onTap: _goToSecondScreen,
                title: Text(AppStrings.mapOfStrings[
                        'appSingleListScreenAppBarTitle${SettingsApp.lang}'] ??
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
                  'appSelectedPlacesScreenAppBarTitle${SettingsApp.lang}'] ??
              ''),
        ),
        body: Scrollbar(
          child: ListView(
            children: [
              for (final item in _items)
                if (item.selected)
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
                                            ? colorScheme.primary
                                                .withOpacity(0.08)
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
          ),
        ),
      ),
    );
  }

  void _goToSecondScreen() {
    // final selectedPlaces = <InterestingPlace>[];
    // for (final element in _items) {
    //   if (element.selected) {
    //     selectedPlaces.add(element);
    //   }
    // }
    completeJSONFromListOfInterestigPlaces(_items);
    Navigator.of(context).pushNamed('/second');
    // Navigator.of(context).push<void>(
    //   MaterialPageRoute(
    //     builder: (context) => const SightListScreen(),
    //   ),
    // );
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
