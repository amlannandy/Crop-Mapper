import 'package:flutter/material.dart';

import 'custom_text.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double amount;

  ChartBar(this.label, this.amount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 4),
        FittedBox(
          child: CustomText(
            amount.toStringAsFixed(0),
            18
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1 - (amount/25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        CustomText(label, 8),
        SizedBox(height: 4),
      ],
    );
  }
}