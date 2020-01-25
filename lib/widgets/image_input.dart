import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/light_icon_button.dart';

class ImageInput extends StatefulWidget {

  final Function selectImage;

  ImageInput(this.selectImage);
  
  @override
  _ImageInputState createState() => _ImageInputState();

}


class _ImageInputState extends State<ImageInput> {

  File _storedImage;

  Future _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null)
      return;
    setState(() {
      _storedImage = imageFile;
    });
    widget.selectImage(_storedImage);
  }

  Future _uploadPicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null)
      return;
    setState(() {
      _storedImage = imageFile;
    });
    widget.selectImage(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            )
          ),
          child: _storedImage == null ?
            Text("No Image") :
            Image.file(
              _storedImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          alignment: Alignment.center,
        ),
        Column(
          children: <Widget>[
            LightIconButton(
              icon: Icons.camera_alt,
              text: "Camera",
              function: _takePicture,
            ),
            LightIconButton(
              icon: Icons.filter,
              text: "Gallery",
              function:  _uploadPicture,
            ),
          ],
        )
      ],
    );
  }
}