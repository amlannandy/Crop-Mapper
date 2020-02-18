// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// //import 'package:firebase_livestream_ml_vision/firebase_livestream_ml_vision.dart';
// class MLProvider with ChangeNotifier {

//   Future<void> identifyCrop(File imageFile) async {

//     final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
//     FirebaseVision.instance.modelManager().setupModel('<model(model.tflite)>', 'assets/');
//     final VisionEdgeImageLabeler visionEdgeLabeler = FirebaseVision.instance.visionEdgeImageLabeler('<foldername(modelname)>', modelLocation);
//     final List<VisionEdgeImageLabel> visionEdgeLabels = await visionEdgeLabeler.processImage(visionImage);
//     for (VisionEdgeImageLabel label in visionEdgeLabels) {
//       final String text = label.text;
//       final double confidence = label.confidence;
//     }
//   }

// }