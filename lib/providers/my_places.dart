import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/place.dart';
import 'dart:io';

class MyPlaces with ChangeNotifier {

  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  Future<void> fetchAndSetPlaces() async {
    const url = 'https://agro-agres.firebaseio.com/places.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String,dynamic>;
      final List<Place> loadedPlaces = [];
      extractedData.forEach((id, data) {
        loadedPlaces.add(Place(
          id: id,
          cropName: data['cropName'],
          image: data['image'],
          location: Location(
            latitude: data['latitude'],
            longitude: data['longitude'],
            address: data['address'],
          ),
        ));
        _places = loadedPlaces;
        notifyListeners();
      });
    } catch(error) {
      throw error;
    }
  }

  Future<void> addPlace(String cropName, File image, Location loc) async {
    const url = 'https://agro-agres.firebaseio.com/places.json';
    try {
      final response = await http.post(url, body: json.encode({
        'cropName' : cropName,
        'image' : image,
        'latitude' : loc.latitude,
        'longitude' : loc.longitude,
        'address' : loc.address,
      }));
      final newPlace = Place(
      id: json.decode(response.body)['name'],
      cropName: cropName,
      image: image,
      location: loc,
    );
      _places.add(newPlace);
      notifyListeners();
    } catch (error) {
      throw error;
    }
    

  }

  Place findPlaceById(String id) {
    return _places.firstWhere((place) => place.id == id);
  }

}