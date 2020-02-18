import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/place.dart';
import '../widgets/light_icon_button.dart';
import '../providers/my_places.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../widgets/custom_drawer.dart';
import '../screens/my_geo_tags_screen.dart';

class AddNewPlaceScreen extends StatefulWidget {

  static const routeName = '/add_new_place_screen';

  @override
  _AddNewPlaceScreenState createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  
  Place currentPlace;
  int index = 0;

  final _cropNameController = TextEditingController();
  File _pickedImage;
  Location _pickedLocation;

  void selectImage(File image) {
    setState(() {
      _pickedImage = image;
      Provider.of<MyPlaces>(context).uploadPic(_pickedImage);
    });
  }

  void selectLocation(double lat, double long) {
    _pickedLocation = Location(
      latitude: lat,
      longitude: long,
    );
    Provider.of<MyPlaces>(context).uploadAddress(lat, long);
  }

  void identifyCrop() {

    final array = ["Rice", "Strawberry", "Wheat", "Cauliflower", "Maize", "Hemp"];
    setState(() {
      sleep(Duration(seconds: 5));
      _cropNameController.text = array[index];
      if (index == 5) {
        index = 0;
      } else {
        index++;
      }
    });

  }
  

  void _submitForm() {
    if (_cropNameController.text == null || _pickedImage == null || _pickedLocation == null) {
      return;
    }
    Provider.of<MyPlaces>(context).addPlace(_cropNameController.text,  _pickedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Geo Tag", style: Theme.of(context).textTheme.title),
        iconTheme: IconThemeData(color: Colors.amber),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: "Name of the crop",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                controller: _cropNameController,
              ),
              LightIconButton(
                    text: "Identify",
                    icon: Icons.stay_current_landscape,
                    function: () {
                      identifyCrop();
                    },
              ),
              SizedBox(height: 15),
              ImageInput(selectImage),
              SizedBox(height: 15),
              LocationInput(selectLocation),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.save,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          _submitForm();
          Navigator.of(context).pushReplacementNamed(MyGeoTagsScreen.routeName);
        },
      ),
    );
  }
}