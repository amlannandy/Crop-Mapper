import 'package:flutter/material.dart';

class LightIconButton extends StatelessWidget {

  final String text;
  final Function function;
  final IconData icon;

  LightIconButton({
    @required this.text,
    @required this.function,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    
    return OutlineButton.icon(
      label: Text(
        text,
        style: Theme.of(context).textTheme.display1,
      ),
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor
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