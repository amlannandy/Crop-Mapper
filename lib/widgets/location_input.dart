import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/location_provider.dart';
import '../widgets/light_icon_button.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {

  final Function selectPlace;

  LocationInput(this.selectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final myLocation = await Location().getLocation();
    final staticMapUrl = LocationProvider.generateLocationPreviewImage(myLocation.latitude, myLocation.longitude);
    setState(() {
      _previewImageUrl = staticMapUrl;
    });
    widget.selectPlace(myLocation.latitude, myLocation.longitude);
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapScreen(
          isSelecting: true,    
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    final staticMapUrl = LocationProvider.generateLocationPreviewImage(selectedLocation.latitude, selectedLocation.longitude);
    setState(() {
      _previewImageUrl = staticMapUrl;
    });
    widget.selectPlace(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).primaryColor)
          ),
          alignment: Alignment.center,
          width: double.infinity,
          height: 140,
          child: _previewImageUrl == null ?
            Text(
              "No Location choosen!",
              style: Theme.of(context).textTheme.body1,
            ) :
            Image.network(
              _previewImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LightIconButton(
                text: "Current Location",
                icon: Icons.my_location,
                function: _getCurrentUserLocation,
              ),
              LightIconButton(
                text: "Select on Map",
                icon: Icons.location_on,
                function: _selectOnMap,
              )
            ],
          ),
        )
      ],
    );
  }
}