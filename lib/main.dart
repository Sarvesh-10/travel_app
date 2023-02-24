import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Constants/custom_text_styles.dart';
import 'package:travel_app/Constants/list_of_categories.dart';
import 'package:travel_app/Constants/list_of_destination.dart';

import 'package:travel_app/Constants/list_of_packages.dart';

import 'package:travel_app/widgets/destination_widgets.dart';

import 'model/package.dart';
import 'widgets/category_widgets.dart';
import 'widgets/package_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return CategoryData();
        }),
        ChangeNotifierProvider(create: (context) {
          return DestinationData();
        }),
        ChangeNotifierProvider(create: (context) {
          return PackageData();
        })
      ],
      child: MaterialApp(
        title: 'Travel App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Travel Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ///move to profile page,
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hello, Vineetha',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter'),
                        ),
                      ],
                    ),
                    Icon(Icons.notifications),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Where do you\t\t\t\t\t\t\t\t\t\twant to explore today?",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      wordSpacing: 1.4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      focusColor: Colors.grey,
                      hoverColor: Colors.grey,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Choose Category", style: subHeadingTextStyle),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: seeAllTextStyle,
                        ))
                  ],
                ),
              ),
              CategoryListView(),
              DestinationListView(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Popular Package", style: subHeadingTextStyle),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: seeAllTextStyle,
                      ))
                ],
              ),
              Column(
                children: [
                  PackageTile(package: listOfPackages[0]),
                  PackageTile(package: listOfPackages[1]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// child: GestureDetector(
//   onTap: () {},
//   child: CircleAvatar(
//     backgroundColor: Colors.white,
//     radius: 20,
//     child: Icon(
//       Icons.favorite,
//       color: Colors.red,
//     ),
//   ),
// ),

//  PageTransition(
//           type: PageTransitionType.fade,
//           child: BookingScreen(
//             dest: dest,
//           ))
