import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:travel_app/model/destination.dart';

List<Destination> list_of_dests = [
  Destination(
      name: 'Kuta Beach',
      location: 'Bali, Indonesia',
      rating: 4.2,
      isHearted: false,
      filePath: "images/KutaBeach.png"),
  Destination(
      name: 'Baga Beach',
      location: 'Goa, India',
      rating: 4.8,
      isHearted: false,
      filePath: "images/BagaBeach.png"),
  Destination(
      name: 'Ajantha Beach',
      location: 'Goa India',
      rating: 4.8,
      isHearted: false,
      filePath: 'images/AjanthaBeach.png')
];

class DestinationData extends ChangeNotifier {
  final List<Destination> _list_of_dests = [
    Destination(
        name: 'Kuta Beach',
        location: 'Bali, Indonesia',
        rating: 4.2,
        isHearted: false,
        filePath: "images/KutaBeach.png"),
    Destination(
        name: 'Baga Beach',
        location: 'Goa, India',
        rating: 4.8,
        isHearted: false,
        filePath: "images/BagaBeach.png"),
    Destination(
        name: 'Ajantha Beach',
        location: 'Goa India',
        rating: 4.8,
        isHearted: false,
        filePath: 'images/AjanthaBeach.png')
  ];

  List get ListOfDest {
    return UnmodifiableListView(_list_of_dests);
  }

  toggleIsHeart(Destination dest) {
    dest.toggleisHearted();
    notifyListeners();
  }

  bool isHearted(Destination dest) => dest.isHearted;
}
