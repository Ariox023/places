import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

/// Класс служит для хранения экземпляра(единицы) списка интересных мест, и преобразования его в json и обратно для хранения этого списка в файле.

class InterestingPlace {
  String name;
  String description;
  bool selected;
  String images;

  InterestingPlace({
    required this.name,
    required this.description,
    required this.selected,
    required this.images,
  });

  factory InterestingPlace.fromJson(Map<String, dynamic> json) =>
      InterestingPlace(
        name: json['name'] as String,
        description: json['description'] as String,
        selected: json['selected'] as bool,
        images: json['images'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'description': description,
        'selected': selected,
        'images': images,
      };

  void addImage(String adress) {
    images.compareTo(';$adress');
  }
}

Future<List<InterestingPlace>> completeListOfInterestigPlaces() async {
  late List<InterestingPlace> items;
  final stringJson = await _loadCrosswordAsset();

  final json = jsonDecode(stringJson) as List<dynamic>;
  items = json
      .map(
        // ignore: avoid_annotating_with_dynamic
        (dynamic e) => InterestingPlace.fromJson(e as Map<String, dynamic>),
      )
      .toList();

  return items;
}

Future<String> _loadCrosswordAsset() async {
  final dirPath = await _getDirPath;
  final file = File('$dirPath/places_data.json');
  if (!file.existsSync()) {
    final str = await rootBundle.loadString('lib/res/places_data.json');
    await file.writeAsString(str);
  }

  return file.readAsString();
}

Future completeJSONFromListOfInterestigPlaces(
  List<InterestingPlace> items,
) async {
  final json = jsonEncode(items.map((e) => e.toJson()).toList());
  await _writeCrosswordAsset(json);
}

Future _writeCrosswordAsset(String json) async {
  // rootBundle.evict('lib/res/places_data.json');
  final dirPath = await _getDirPath;
  final file = File('$dirPath/places_data.json');
  await file.writeAsString(json);
}

Future<String> get _getDirPath async {
  final dir = await getApplicationDocumentsDirectory();

  return dir.path;
}
