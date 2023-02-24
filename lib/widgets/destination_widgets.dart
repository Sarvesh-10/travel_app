import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/widgets/rating_widget.dart';

import '../Constants/list_of_categories.dart';
import '../Constants/list_of_destination.dart';
import '../Screens/booking_screen.dart';
import '../model/category.dart';
import '../model/destination.dart';

class DestinationListView extends StatelessWidget {
  const DestinationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: Provider.of<DestinationData>(context).ListOfDest.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return DestinationTile(
                dest: Provider.of<DestinationData>(context).ListOfDest[index]);
          }),
    );
  }
}

class DestinationTile extends StatelessWidget {
  DestinationTile({required this.dest});
  final Destination dest;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: BookingScreen(dest: dest),
                  type: PageTransitionType.fade));
        },
        child: Stack(alignment: Alignment.topCenter, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              height: 250,
              width: 190,
              fit: BoxFit.cover,
              image: AssetImage(dest.filePath),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black],
              ),
            ),
            height: 250,
            width: 190,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      dest.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 4, left: 10, right: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        Text(dest.location,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: Rating_Widget(
                      dest: dest,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: GestureDetector(
              onTap: () {
                Provider.of<DestinationData>(context, listen: false)
                    .toggleIsHeart(dest);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22,
                child: Icon(
                  dest.isHearted?Icons.favorite:Icons.favorite_border_outlined,
                  color: dest.isHearted ? Colors.red : Colors.black,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
