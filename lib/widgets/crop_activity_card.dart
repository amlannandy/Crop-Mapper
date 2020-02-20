import 'package:flutter/material.dart';

class CropActivityCard extends StatelessWidget {

  final String temperature;
  final String humidity;
  final String soilMoisture;

  CropActivityCard(this.temperature, this.humidity, this.soilMoisture);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.wb_sunny,
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Temperature",
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  temperature,
                  style: Theme.of(context).textTheme.display3,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.toys,
                      color: Colors.orange,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Humidity",
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  humidity,
                  style: Theme.of(context).textTheme.display3,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.public,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Soil Moisture",
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  soilMoisture,
                  style: Theme.of(context).textTheme.display3,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}