import 'package:flutter/material.dart';
import '../widgets/chart_bar.dart';

class AppChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[700],
      margin: EdgeInsets.all(10),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ChartBar(
              "Rice",
              12
            ),
            ChartBar(
              "Wheat",
              16
            ),
            ChartBar(
              "Maize",
              13
            ),
            ChartBar(
              "Mustard",
              19
            ),
            ChartBar(
              "Strawberry",
              12
            ),
            ChartBar(
              "Hemp",
              16
            ),
            ChartBar(
              "Cauliflower",
              10
            ),
            ChartBar(
              "Onion",
              14
            ),
          ],
        ),
      ),
    );
  }
}