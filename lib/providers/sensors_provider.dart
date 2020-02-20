import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SensorsProvider with ChangeNotifier {

  String temperature = "";
  String humidity = "";
  String soilMoisture = "";

  Future<void> setTemperature() async {
    final url = "https://agro-agres.firebaseio.com/temperature.json";
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as String;
      print(response.body);
      print("Temperature - " + extractedData);
      temperature = extractedData + " °C";
      print(temperature);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> setHumidty() async {
    final url = "https://agro-agres.firebaseio.com/humidity.json";
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as String;
      print("Humidity - " +response.body);
      humidity = extractedData + "%";
      print(humidity);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> setSoilMoisture() async {
    final url = "https://agro-agres.firebaseio.com/moisture.json";
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as String;
      print("Soil Moisture - " +response.body);
      soilMoisture = extractedData + "%";
      print(soilMoisture);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List returnValues () {
    return [temperature, humidity, soilMoisture];
  }

}