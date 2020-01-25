import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/my_places.dart';
import '../widgets/custom_drawer.dart';

class CropMapScreen extends StatefulWidget {

  static const routeName = '/crop_map_screen';

  @override
  _CropMapScreenState createState() => _CropMapScreenState();
}

class _CropMapScreenState extends State<CropMapScreen> {

  @override
  Widget build(BuildContext context) {

    final myPlaces = Provider.of<MyPlaces>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Map",
          style: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            20.2961,
            85.8245,
          ),
          zoom: 16,
        ),
        markers: myPlaces.places.map(
          (place) => Marker(
            markerId: MarkerId(place.cropName),
            position: LatLng(
              place.location.latitude,
              place.location.longitude,
            ),
          ),
        ).toSet(),
      ),
      drawer: CustomDrawer(),
    );
  }
}