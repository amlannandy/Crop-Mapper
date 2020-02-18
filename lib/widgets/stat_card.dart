import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {

  final int amount;
  final String cropName;

  StatCard(this.cropName, this.amount);

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 10,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Text(
          amount.toString(),
          style: Theme.of(context).textTheme.title,
        ),
        title: Text(
          cropName,
          style: Theme.of(context).textTheme.display2,
        ),
        trailing: Text(
          "Bhubaneshwar",
          style: Theme.of(context).textTheme.display2,
        ),
      ),
    );
  }
}