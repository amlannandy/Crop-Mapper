import 'package:flutter/material.dart';

class MapCard extends StatelessWidget {

  final String mapImageUrl;
  final Function clickFunction;

  MapCard(this.mapImageUrl, this.clickFunction);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              image: mapImageUrl,
            ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.black54,
              child: Text(
                "View on Map",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            onTap: clickFunction,
          )
        ],
      ),
    );
  }
}