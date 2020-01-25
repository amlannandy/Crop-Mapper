import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/place_card.dart';
import '../widgets/custom_drawer.dart';
import '../providers/my_places.dart';

class MyGeoTagsScreen extends StatefulWidget {

  static const routeName = '/';

  @override
  _MyGeoTagsScreenState createState() => _MyGeoTagsScreenState();
}

class _MyGeoTagsScreenState extends State<MyGeoTagsScreen> {

  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<MyPlaces>(context).fetchAndSetPlaces().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    final myPlaces = Provider.of<MyPlaces>(context);

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
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          _isLoading ?
          Center(
            child:CircularProgressIndicator(),
          ) : GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 6.8/10,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              ),
            itemCount: myPlaces.places.length,
            itemBuilder: (ctx, index) => PlaceCard(
            myPlaces.places[index]
            ),
          ),
        ],
      )
    );
  }
}