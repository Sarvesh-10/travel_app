
import 'package:flutter/material.dart';

import '../Constants/list_of_categories.dart';
import '../model/category.dart';
class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
          itemCount: listOfCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryTile(
              category: listOfCategory[index],
            );
          }),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({required this.category});

  final VacationCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: category.isSelected! ? Colors.green : Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      height: 90,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            category.image,
            SizedBox(
              width: 6,
            ),
            Text(
              category.categoryType,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Urbanist'),
            ),
          ],
        ),
      ),
    );
  }
}