import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/map_screen.dart';
import './screens/my_geo_tags_screen.dart';
import './screens/crop_details_screen.dart';
import './screens/add_new_place_screen.dart';
import './providers/my_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider.value(
      value: MyPlaces(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.amber,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.amber,
              fontFamily: "Lilita One",
              fontSize: 34,
            ),
            display1: TextStyle(
              color: Colors.green[900],
              fontFamily: "Alatsi",
              fontSize: 22,
            ),
            display2: TextStyle(
              color: Colors.amber,
              fontFamily: "Alatsi",
              fontSize: 22,
            ),
            display3: TextStyle(
              color: Colors.black,
              fontFamily: "Alatsi",
              fontSize: 22,
            ),
            display4: TextStyle(
              color: Colors.white,
              fontFamily: "Alatsi",
              fontSize: 20,
            ),
          ),
          highlightColor: Colors.green,
        ),
        routes: {
          "/" : (ctx) => MyGeoTagsScreen(),
          MapScreen.routeName : (ctx) => MapScreen(),
          AddNewPlaceScreen.routeName : (ctx) => AddNewPlaceScreen(),
          CropDetailsScreen.routeName : (ctx) => CropDetailsScreen(),
        },
      ),
    );
  }
}