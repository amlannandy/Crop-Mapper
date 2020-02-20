import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<WeatherProvider>(context).getFiveDayForecast().then((_) {
        Provider.of<WeatherProvider>(context).getForecast().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agro Acres",
          style: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/weather.jpg",
              fit: BoxFit.fill,
            ),
          ),
          _isLoading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.grey),) : Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row1(),
                  Divider(color: Colors.grey[300], thickness: 0.4),
                  Row2(),
                  Row3(),
                  Divider(color: Colors.grey[300], thickness: 0.4),
                  Row4(),
                  Divider(color: Colors.grey[300], thickness: 0.4),
                  Row5(),
                  Row6(),
                  Row7(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.location_on,
            color: Colors.redAccent,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            Provider.of<WeatherProvider>(context).getLocation(),
            style: Theme.of(context).textTheme.display3,
          ),
        )
      ],
    );
  }
}

class Row2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
        )
      ],
    );
  }
}

class Row3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "MAX",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getMaxTemp(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "MIN",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getMinTemp(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Row4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.cloud,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Cloudiness",
                    style: Theme.of(context).textTheme.display3,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getCloudiness(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.filter_vintage,
                    color: Colors.pink,
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
                Provider.of<WeatherProvider>(context).getHumidity(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Row5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.zoom_out_map,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Pressure",
                    style: Theme.of(context).textTheme.display3,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getPressure(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.toys,
                    color: Colors.blue[800],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Wind Speed",
                    style: Theme.of(context).textTheme.display3,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getWindSpeed(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Row6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromRGBO(6, 190, 182, 1), Color.fromRGBO(72, 177, 191, 1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text("3 Day Forecast", style: Theme.of(context).textTheme.display2),
    );
  }
}

class Row7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.wb_sunny,
                color: Colors.orange,
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Temperature",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: "Alatsi",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Cloudiness",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: "Alatsi",
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "1",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getDayOneTemp(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getDayOneCloudiness(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "2",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getDayTwoTemp(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getDayTwoCloudiness(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "3",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getDayThreeTemp(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                Provider.of<WeatherProvider>(context).getDayThreeCloudiness(),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}