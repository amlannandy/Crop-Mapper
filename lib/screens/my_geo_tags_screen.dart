import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/place_card.dart';
import '../widgets/custom_drawer.dart';
import '../providers/my_places.dart';

class MyGeoTagsScreen extends StatelessWidget {

  static const routeName = '/';

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
      drawer: CustomDrawer(),
      body: FutureBuilder(
        future: Provider.of<MyPlaces>(context).fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
        snapshot.connectionState == ConnectionState.waiting ?
          Center(child: CircularProgressIndicator()) :
          Consumer<MyPlaces>(
            child: Center(
              child: Text(
                "No Places yet!",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            builder: (ctx, myPlaces, ch) => myPlaces.places.length <= 0 ?
            ch: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 6.3/10.1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: myPlaces.places.length,
              itemBuilder: (ctx, index) => PlaceCard(
                myPlaces.places[index]
              ),
            ),
          ),
      )
    );
  }

}