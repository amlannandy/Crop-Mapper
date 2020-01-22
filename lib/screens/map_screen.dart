import 'package:crop_mapping_app/widgets/custom_drawer.dart';
import 'package:crop_mapping_app/widgets/light_button.dart';
import 'package:flutter/material.dart';

import '../widgets/light_icon_button.dart';

class MapScreen extends StatelessWidget {

  static const routeName = '/map_screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Geo Tags",
          style: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Testing...", style: Theme.of(context).textTheme.display1),
              Text("Testing...", style: Theme.of(context).textTheme.display2),
              Text("Testing...", style: Theme.of(context).textTheme.display3),
              Text("Testing...", style: Theme.of(context).textTheme.display4),
              LightIconButton(
                text: "Delete",
                icon: Icons.delete,
                function: () {},
              ),
              LightButton(
                function: () {},
                text: "Cancel",
              ),
            ],
          ),
      ),
      drawer: CustomDrawer(),
    );
  }

}