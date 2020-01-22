import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/place.dart';
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

  final _cropNameController = TextEditingController();
  File _pickedImage;
  Location _pickedLocation;

  void _submitForm() {
    if (_cropNameController.text == null || _pickedImage == null || _pickedLocation == null) {
      return;
    }
    Provider.of<MyPlaces>(context).addPlace(_cropNameController.text, _pickedImage, _pickedLocation);
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
                  labelText: "Name of the place",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                controller: _cropNameController,
              ),
              SizedBox(height: 15),
              ImageInput(),
              SizedBox(height: 15),
              LocationInput(),
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