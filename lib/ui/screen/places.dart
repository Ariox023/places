import 'package:flutter/material.dart';

class InterestingPlace {
  late List<Image> images;
  late String name;
  late String description;
  bool selected = false;

  InterestingPlace({
    required this.images,
    required this.name,
    required this.description,
  });

  void addImage(String adress) {
    images.add(Image.network(adress));
  }
}

// ignore: long-method
List<InterestingPlace> completeListOfInterestigPlaces() {
  final items = <InterestingPlace>[];

  final place1 = InterestingPlace(
    images: [
      Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/6/6b/Vorota_kishineva.jpg',
      ),
      Image.network(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/a6/1a/0a/triumphal-arch.jpg?w=700&h=-1&s=1',
      ),
      Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Montaj_de_imagini_Commons_a_Chi%C8%99in%C4%83ului.jpg/310px-Montaj_de_imagini_Commons_a_Chi%C8%99in%C4%83ului.jpg',
      ),
    ],
    description: 'Cтолица и крупнейший город Молдавии.',
    name: 'Кишинёв',
  );

  items.add(place1);

  final place2 = InterestingPlace(
    images: [
      Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Montaj_de_imagini_Commons_a_B%C4%83l%C8%9Biului.jpg/272px-Montaj_de_imagini_Commons_a_B%C4%83l%C8%9Biului.jpg',
      ),
      Image.network(
        'https://esp.md/sites/default/files/styles/list_category_200x255/adaptive-image/public/photo_2021-07-15_13-22-20.jpg',
      ),
      Image.network(
        'http://www.prospect.md/images/gallery/belicy-moldova-8462-1.jpg',
      ),
    ],
    description:
        'Важнейший транспортный узел севера Молдавии, в состав которого входят две железнодорожные станции.',
    name: 'Бельцы',
  );

  items.add(place2);

  final place3 = InterestingPlace(
    images: [
      Image.network(
        'https://newsmaker.md/wp-content/uploads/2020/01/3-6-1024x681.jpg',
      ),
      Image.network(
        'https://static.locals.md/2019/01/50230545_602382620215921_6249786738395316224_n.jpg',
      ),
      Image.network(
        'https://i.simpalsmedia.com/point.md/news/thumbnails/large/73d3c6688aec1835296d3bcebc29536d.jpg',
      ),
      Image.network('https://orheitv.md/media/2019/02/Orhei1.png'),
      Image.network(
        'https://static.locals.md/2018/12/47573681_1965567396812161_7209945884509863936_n_8322829.jpg',
      ),
    ],
    description: 'Город и муниципий в Молдавии, центр Оргеевского района.',
    name: 'Орхей',
  );

  items.add(place3);

  final place4 = InterestingPlace(
    images: [
      Image.network(
        'https://fs.tonkosti.ru/0x/pt/0xptwn0803mokc40o8sgwck48.jpg',
      ),
      Image.network(
        'https://img.itinari.com/page/content/original/fcf47528-0633-4822-b02e-263e108bc732-istock-1066139262.jpg?ch=DPR&dpr=2.625&w=994&s=4489d2c075ffeeade1689f4f4fde513c',
      ),
      Image.network(
        'https://img.itinari.com/pages/images/original/4d64132a-0f95-422c-aac8-02eb860a337a-istock-635792246.jpg?ch=DPR&dpr=2.625&w=1600&s=5814ce8a1b9916d273ed5161c2eadb69',
      ),
      Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/a/a9/Stanca_deasupra_Rautului_Butuceni.jpg',
      ),
    ],
    description:
        'Историко-археологический комплекс, расположенный в 60 км к северо-востоку от Кишинёва, на реке Реут.',
    name: 'Старый Орхей',
  );

  items.add(place4);

  final place5 = InterestingPlace(
    images: [
      Image.network('https://static.locals.md/2016/11/Edinet_1.jpg'),
      Image.network('http://www.infotag.md/data/506/42349_ue.l.jpg'),
      Image.network(
        'https://noi.md/uploads/newsthumbs/760_500/2020_11_30/484543.webp',
      ),
      Image.network('https://mold.su/images/imagechisinau/edinti.jpg'),
    ],
    description: 'Город и муниципий в Молдавии, центр Единéцкого района.',
    name: 'Единцы',
  );

  items.add(place5);

  final place6 = InterestingPlace(
    images: [
      Image.network(
        'http://images2.moldovatrans.com/tur/imgbank/locations/20140424152313910.jpg',
      ),
      Image.network('https://mapio.net/images-p/41144592.jpg'),
      Image.network('https://geodzen.com/files/coats/md/rezina.gif'),
    ],
    description: 'Город в Молдавии, центр Резинского района.',
    name: 'Рези́на',
  );

  items.add(place6);

  final place7 = InterestingPlace(
    images: [
      Image.network(
        'https://www.deltalight.com/frontend/files/projects/images/source/003002_REA01.jpg',
      ),
      Image.network(
        'https://wine-and-spirits.md/wp-content/uploads/2016/09/MIMI6-1-1.jpg',
      ),
      Image.network(
        'https://winetours.md/pic/wineries/11/default/_MAX9276_web__1_.jpg',
      ),
      Image.network(
        'https://i.simpalsmedia.com/999.md/BoardImages/900x900/c8be8d37a8482cc1a5172df000da27f2.jpg',
      ),
      Image.network(
        'https://winetours.md/pic/wineries/11/default/Castel_Mimi_beci.jpg',
      ),
      Image.network(
        'https://www.brinzan.com/wp-content/uploads/2016/09/castel-mimi-winery-moldova-2016-19.jpg',
      ),
    ],
    description:
        'Замок Мими в настоящее время входит в число самых красивых архитектурных шедевров в мире вина.',
    name: 'Замок “Mimi”',
  );

  items.add(place7);

  final place8 = InterestingPlace(
    images: [
      Image.network(
        'http://aerotourmd.com/images/moldova/religious-tourism/capriana.jpg',
      ),
      Image.network('https://www.rosti.md/uploads/moldova/02/2392595.jpg'),
      Image.network(
        'https://static.locals.md/2014/04/monastyri_capriana_050.jpg',
      ),
      Image.network(
        'https://www.atcsindtur.md/uploads/Moldova/Monastiri/Hirjauka/DSCF7740.jpg',
      ),
    ],
    description:
        'В живописных Кодрах, в 40 км к северо-западу от Кишинева, расположен один из самых старинных монастырей Молдовы Каприяна. Дата основания монастыря 1429 год.',
    name: 'Монастырь Кэприяна',
  );

  items.add(place8);

  return items;
}
