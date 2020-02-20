import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {

  static const routeName = '/map_screen';

  final Location initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation = const Location(
      latitude: 20.2961,
      longitude: 85.8245,
    ),
    this.isSelecting = true,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  void viewPopUp() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map",
          style: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            color: Theme.of(context).accentColor,
            onPressed: _pickedLocation == null ? null :
            () {
              Navigator.of(context).pop(_pickedLocation);
            },
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelecting) ? null : {
          Marker(
            markerId: MarkerId('m1'),
            position: _pickedLocation == null ?
              LatLng(
                widget.initialLocation.latitude,
                widget.initialLocation.longitude,
              ) : _pickedLocation,
              onTap: () {
                viewPopUp();
              }
          ),
        },
      ),
    );
  }
}