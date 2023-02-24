import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:travel_app/model/category.dart';
import 'package:provider/provider.dart';



class CategoryData extends ChangeNotifier {
  final List<VacationCategory> _listOfCategory = [
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
        isSelected: false)
  ];

  List get list {
    return UnmodifiableListView(_listOfCategory);
  }

  void toggleDone(VacationCategory cat) {
    _listOfCategory.forEach((element) {
      element.isSelected = false;
    });
    cat.toggleIsSelected();
    notifyListeners();
  }
}
