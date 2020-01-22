import 'package:flutter/material.dart';

class LightButton extends StatelessWidget {

  final String text;
  final Function function;

  LightButton({
    @required this.text,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {
    
    return OutlineButton(
      child: Text(
        text,
        style: Theme.of(context).textTheme.display1,
        textAlign: TextAlign.center,
      ),
      onPressed: function,
      color: Colors.pink,
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      highlightedBorderColor: Colors.green[700],
    );
  }
}