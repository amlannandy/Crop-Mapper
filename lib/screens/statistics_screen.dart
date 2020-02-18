import 'package:crop_mapping_app/widgets/app_chart.dart';
import 'package:crop_mapping_app/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {

  static const routeName = '/statistics_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistics",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppChart(),
            StatCard(
              "Rice",
              12
            ),
            StatCard(
              "Wheat",
              16
            ),
            StatCard(
              "Maize",
              13
            ),
            StatCard(
              "Mustard",
              19
            ),
            StatCard(
              "Strawberry",
              12
            ),
            StatCard(
              "Hemp",
              16
            ),
            StatCard(
              "Cauliflower",
              10
            ),
            StatCard(
              "Onion",
              14
            ),
          ],
        )
      ),
    );
  }
}