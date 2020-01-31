import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_places.dart';
import '../screens/map_screen.dart';
import '../widgets/place_details_card.dart';
import '../providers/location_provider.dart';
import '../widgets/map_card.dart';

class CropDetailsScreen extends StatelessWidget {

  static const routeName = '/crop_details_screen';

  @override
  Widget build(BuildContext context) {

    final placeId = ModalRoute.of(context).settings.arguments;
    final currentPlace = Provider.of<MyPlaces>(context).findPlaceById(placeId);
    final mapUrl = LocationProvider.generateLocationPreviewImage(
      currentPlace.location.latitude,
      currentPlace.location.longitude,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Details",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 465,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                )
              ),
              elevation: 10,
              color: Colors.white54,
              child: Column(
                children: <Widget>[
                  PlaceDetailsCard(currentPlace),
                  MapCard(
                    mapUrl,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (ctx) => MapScreen(
                            initialLocation: currentPlace.location,
                            isSelecting: false,
                          )
                        )
                      );
                    }
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}