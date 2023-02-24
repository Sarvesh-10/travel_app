import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/widgets/rating_widget.dart';
import '../Constants/list_of_packages.dart';
import '../model/package.dart';

class PackageListView extends StatelessWidget {
  const PackageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return PackageTile(
            package: Provider.of<PackageData>(context).packages[index],
          );
        },
        itemCount: Provider.of<PackageData>(context).packages.length,
      ),
    );
  }
}

class PackageTile extends StatelessWidget {
  PackageTile({required this.package});
  final Package package;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(package.imageFilePath),
                      width: 120,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                      child: Text(
                        package.placeName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            fontFamily: 'Urbanist'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "₹${package.price}",
                        style: TextStyle(
                            color: Colors.red,
                            overflow: TextOverflow.clip,
                            fontFamily: 'Urbanist'),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Rating_Widget(
                          dest: package,
                          color: Colors.black,
                        )),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        width: 150,
                        child: Text(
                          package.description,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist',
                              color: Color(0xff767676),
                              height: 1.5),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.ltr,
                        )),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
                  Provider.of<PackageData>(context,listen: false).toggleIsHeart(package);
                },
                child: Icon(
                  package.isHearted
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Provider.of<PackageData>(context).isHearted(package) ? Colors.red : Colors.black,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
