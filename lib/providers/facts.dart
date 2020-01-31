import 'package:flutter/material.dart';

class Facts extends StatelessWidget {
  Facts({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.person_pin,
              size: 25,
              color: Colors.green,
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Alatsi",
                      fontSize: 16,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    text, 
                    style: TextStyle(
                      fontFamily: "Alatsi",
                      fontSize: 16,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          backgroundColor: Colors.green,
          child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.supervised_user_circle,
            size: 25,
            color: Theme.of(context).accentColor,
            ),
        ),
      ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}