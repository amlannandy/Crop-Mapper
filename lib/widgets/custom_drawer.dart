import 'package:flutter/material.dart';

import '../screens/add_new_place_screen.dart';
import '../screens/my_geo_tags_screen.dart';
import '../screens/home_screen.dart';
import '../screens/statistics_screen.dart';
import '../screens/chat_bot_screen.dart';
import '../screens/crop_map_screen.dart';

class CustomDrawer extends StatelessWidget {

  Widget buildListTitle(String title, Icon icon, BuildContext context, Function tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
        fontFamily: "Lilita One",
        fontSize: 26,
        color: Theme.of(context).primaryColor,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Image.asset("assets/images/logo.png", height: 250, width: 250, fit: BoxFit.fitWidth)
          ),
          SizedBox(height: 10),
          buildListTitle(
            "Home",
            Icon(Icons.home, color: Theme.of(context).primaryColor, size: 50),
            context,
            () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            }
          ),
          buildListTitle(
            "My Tags",
            Icon(Icons.supervised_user_circle, color: Theme.of(context).primaryColor, size: 50),
            context,
            () {
              Navigator.of(context).pushReplacementNamed(MyGeoTagsScreen.routeName);
            }
          ),
          buildListTitle(
            "My Maps",
            Icon(Icons.location_city, color: Theme.of(context).primaryColor, size: 50),
            context,
            () {
              Navigator.of(context).pushReplacementNamed(CropMapScreen.routeName);
            }
          ),
          buildListTitle(
            "Add Crop Field",
            Icon(Icons.add_location, color: Theme.of(context).primaryColor, size: 50),
            context,
            () {
              Navigator.of(context).pushNamed(AddNewPlaceScreen.routeName);
            }
          ),
          buildListTitle(
            "Chat with Ramu",
            Icon(Icons.chat, color: Theme.of(context).primaryColor, size: 50),
            context,
            () {
              Navigator.of(context).pushNamed(ChatBotScreen.routeName);
            }
          ),
          buildListTitle(
            "Statistics",
            Icon(Icons.format_align_right, color: Theme.of(context).primaryColor, size: 50),
            context,
            () {
              Navigator.of(context).pushNamed(StatisticsScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}