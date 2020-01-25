// import 'dart:io';
import 'dart:convert';
import 'package:crop_mapping_app/providers/location_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import '../models/place.dart';

class MyPlaces with ChangeNotifier {

  List<Place> _places = [];
  String currentImageUrl;
  String currentAddress;

  List<Place> get places {
    return [..._places];
  }

  Future<void> fetchAndSetPlaces() async {
    const url = 'https://agro-agres.firebaseio.com/crop_fields.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String,dynamic>;
      final List<Place> loadedPlaces = [];
      print(extractedData);
      extractedData.forEach((id, data) {
        loadedPlaces.add(Place(
          id: id,
          cropName: data['cropName'],
          imageUrl: data['imageUrl'],
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

  Future<void> addPlace(String cropName, Location loc) async {
    const url = 'https://agro-agres.firebaseio.com/crop_fields.json';
    try {
      final response = await http.post(url, body: json.encode({
        'cropName' : cropName,
        'imageUrl' : currentImageUrl,
        'latitude' : loc.latitude,
        'longitude' : loc.longitude,
        'address' : currentAddress,
      }));
      final newPlace = Place(
      id: json.decode(response.body)['name'],
      cropName: cropName,
      imageUrl: currentImageUrl,
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

  Future uploadPic(pickedImage) async {
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('crop_images/${Path.basename(pickedImage.path)}}');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(pickedImage);
      await uploadTask.onComplete;
      print("File uploaded!");
      firebaseStorageRef.getDownloadURL().then((fileUrl) {
        currentImageUrl = fileUrl;
      });
      notifyListeners();
  }

  Future uploadAddress(double lat, double long) async {
    currentAddress = await LocationProvider.getPlaceAddress(lat, long);
  }

}