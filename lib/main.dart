import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/map_screen.dart';
import './screens/my_geo_tags_screen.dart';
import './screens/crop_map_screen.dart';
import './screens/chat_bot_screen.dart';
import './screens/crop_details_screen.dart';
import './screens/statistics_screen.dart';
import './screens/home_screen.dart';
import './screens/add_new_place_screen.dart';
import './providers/weather_provider.dart';
import './providers/sensors_provider.dart';
import './providers/my_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MyPlaces(),
        ),
        ChangeNotifierProvider.value(
          value: WeatherProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SensorsProvider(),
        ),
      ],
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
          HomeScreen.routeName : (ctx) => HomeScreen(),
          MapScreen.routeName : (ctx) => MapScreen(),
          MyGeoTagsScreen.routeName : (ctx) => MyGeoTagsScreen(),
          AddNewPlaceScreen.routeName : (ctx) => AddNewPlaceScreen(),
          CropDetailsScreen.routeName : (ctx) => CropDetailsScreen(),
          CropMapScreen.routeName : (ctx) => CropMapScreen(),
          ChatBotScreen.routeName : (ctx) => ChatBotScreen(),
          StatisticsScreen.routeName : (ctx) => StatisticsScreen(),
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}