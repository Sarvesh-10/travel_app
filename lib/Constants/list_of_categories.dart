import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/model/category.dart';

List<VacationCategory> listOfCategory = [
  VacationCategory(
      categoryType: 'Beach',
      image: Image.asset(
        'images/beachtree.png',
        height: 70,
        width: 70,
      ),
      isSelected: true,
      ),
  VacationCategory(
      categoryType: 'Mountain',
      image: Image.asset(
        'images/mountain.jpeg',
        height: 70,
        width: 50,
      ),
      isSelected:  false
      )
];


