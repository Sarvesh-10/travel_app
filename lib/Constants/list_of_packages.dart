import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:travel_app/model/package.dart';

List<Package> listOfPackages = [
  Package(
      placeName: 'Kuta Beach',
      price: "20,000",
      rating: 4.5,
      description:
          "A Resort is a place used for vacation or a day for relaxation",
      isHearted: false,
      imageFilePath: "images/KutaBeach.png"),
  Package(
      placeName: 'Baga Beach',
      price: "15,000",
      rating: 4.5,
      description:
          "A Resort is a place used for vacation or a day for relaxation",
      isHearted: false,
      imageFilePath: "images/BagaBeach.png")
];

class PackageData extends ChangeNotifier {
  final List<Package> _listOfPackages = [
    Package(
        placeName: 'Kuta Beach',
        price: "20,000",
        rating: 4.5,
        description:
            "A Resort is a place used for vacation or a day for relaxation",
        isHearted: false,
        imageFilePath: "images/KutaBeach.png"),
    Package(
        placeName: 'Baga Beach',
        price: "15,000",
        rating: 4.5,
        description:
            "A Resort is a place used for vacation or a day for relaxation",
        isHearted: false,
        imageFilePath: "images/BagaBeach.png")
  ];

  List get packages {
    return UnmodifiableListView(_listOfPackages);
  }

  toggleIsHeart(Package package) {
    package.toggleIsHearted();
    notifyListeners();
  }

  bool isHearted(Package pack) => pack.isHearted;
}
