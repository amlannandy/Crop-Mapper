import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherProvider with ChangeNotifier {

  static const API_KEY = "b2a10a9761ad7d802d0786451a1880c7";
  WeatherStation weatherStation = new WeatherStation(API_KEY);
  Weather weather;
  List<Weather> forecasts;
  
  Future<void> getForecast() async {

    weather = await weatherStation.currentWeather();

  }

  Future<void> getFiveDayForecast() async {

    forecasts = await weatherStation.fiveDayForecast();
    print(forecasts);
  }

  String getLocation() {
    return weather.areaName;
  }

  String getMaxTemp() {
    return weather.tempMax.celsius.toStringAsFixed(1) + "°C";
  }

  String getMinTemp() {
    return weather.tempMin.celsius.toStringAsFixed(1) + "°C";
  }

  String getHumidity() {
    return weather.humidity.toString() + "%";
  }

  String getCloudiness() {
    return weather.cloudiness.toString() + "%";
  }

  String getPressure() {
    return weather.pressure.toString() + " Pa";
  }

  String getWindSpeed() {
    return weather.windSpeed.toString() + " m/s";
  }

  String getDayOneTemp() {
    return forecasts[0].temperature.celsius.toStringAsFixed(1) + "°C"; 
  }

  String getDayTwoTemp() {
    return forecasts[1].temperature.celsius.toStringAsFixed(1) + "°C"; 
  }

  String getDayThreeTemp() {
    return forecasts[2].temperature.celsius.toStringAsFixed(1) + "°C"; 
  }

  String getDayOneCloudiness() {
    return forecasts[0].cloudiness.toString() + "%"; 
  }

  String getDayTwoCloudiness() {
    return forecasts[1].cloudiness.toString() + "%"; 
  }

  
  String getDayThreeCloudiness() {
    return forecasts[2].cloudiness.toString() + "%"; 
  }

}