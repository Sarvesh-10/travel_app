import 'package:flutter/material.dart';

class VacationCategory {
  final String categoryType;
  final Image image;
   bool? isSelected;
  VacationCategory({required this.categoryType, required this.image, this.isSelected = false});
}
