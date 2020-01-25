import 'package:flutter/foundation.dart';

class Location {

  final double latitude;
  final double longitude;
  final String address;

  const Location({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });

}

class Place {

  final String id;
  final String cropName;
  final Location location;
  final String imageUrl;

  Place({
    @required this.id,
    @required this.cropName,
    @required this.location,
    @required this.imageUrl,
  });

}