import 'package:flutter/material.dart';

class CropDetailsScreen extends StatelessWidget {

  static const routeName = '/crop_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Details",
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}