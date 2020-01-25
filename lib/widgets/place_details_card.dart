import 'package:flutter/material.dart';

import '../models/place.dart';

class PlaceDetailsCard extends StatelessWidget {

  final Place currentPlace;

  PlaceDetailsCard(this.currentPlace);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.gif",
            image: currentPlace.imageUrl,
            height: 200,
            width: 150,
            placeholderCacheHeight: 200,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  currentPlace.cropName,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 34,
                    fontFamily: "Alatsi"
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  currentPlace.location.address,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontFamily: "Alatsi"
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}