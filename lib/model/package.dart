import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:travel_app/Constants/list_of_packages.dart';

class Package {
  final String placeName;
  final String price;

  final double rating;
  final String description;
  bool isHearted = false;
  final String imageFilePath;
  Package(
      {required this.placeName,
      required this.price,
      required this.rating,
      required this.description,
      required this.isHearted,
      required this.imageFilePath});

  toggleIsHearted() {
    isHearted = !isHearted;
  }
}


// child: Icon(
//               //   Icons.favorite_outline,
//               //   size: 30,
//               // ),
