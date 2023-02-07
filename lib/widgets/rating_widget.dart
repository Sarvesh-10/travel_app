import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/model/destination.dart';

class Rating_Widget extends StatelessWidget {
  Rating_Widget({required this.dest, required this.color});
  final dest;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          unratedColor: Colors.white,
          itemSize: 20,
          initialRating: 4.0,
          onRatingUpdate: (value) {},
          minRating: 1,
          itemBuilder: (BuildContext context, int index) {
            return Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "${dest.rating}",
            style: TextStyle(
                color: color,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
