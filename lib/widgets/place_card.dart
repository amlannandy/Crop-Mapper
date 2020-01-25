import 'dart:ui';
import 'package:flutter/material.dart';

import '../screens/crop_details_screen.dart';
import '../models/place.dart';

class PlaceCard extends StatelessWidget {

  final Place currentPlace;

  PlaceCard(this.currentPlace);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(CropDetailsScreen.routeName, arguments: currentPlace.id),
      child: Card(
        color: Colors.white54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
          )
        ),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: currentPlace.imageUrl,
                height: 205,
                placeholderCacheHeight: 200,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.only(top: 2.5, left: 10, right: 5, bottom: 2.5),
                alignment: Alignment.centerLeft,
                child: Text(
                  currentPlace.cropName,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}