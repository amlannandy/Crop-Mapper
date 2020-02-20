import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/crop_activity_card.dart';
import '../providers/my_places.dart';
import '../screens/map_screen.dart';
import '../widgets/place_details_card.dart';
import '../providers/location_provider.dart';
import '../providers/sensors_provider.dart';
import '../widgets/map_card.dart';

class CropDetailsScreen extends StatefulWidget {

  static const routeName = '/crop_details_screen';

  @override
  _CropDetailsScreenState createState() => _CropDetailsScreenState();
}

class _CropDetailsScreenState extends State<CropDetailsScreen> {

  // var _isLoading = false;
  // var _isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<SensorsProvider>(context).setTemperature().then((_) {
  //       Provider.of<SensorsProvider>(context).setHumidty().then((_) {
  //         Provider.of<SensorsProvider>(context).setSoilMoisture().then((_) {
  //           setState(() {
  //             _isLoading = false;
  //           });
  //         });
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    Provider.of<SensorsProvider>(context).setTemperature();
    Provider.of<SensorsProvider>(context).setHumidty();
    Provider.of<SensorsProvider>(context).setSoilMoisture();
    List conditions = Provider.of<SensorsProvider>(context).returnValues();

    final placeId = ModalRoute.of(context).settings.arguments;
    final currentPlace = Provider.of<MyPlaces>(context).findPlaceById(placeId);
    final mapUrl = LocationProvider.generateLocationPreviewImage(
      currentPlace.location.latitude,
      currentPlace.location.longitude,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Details",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          //_isLoading ? Center(child: CircularProgressIndicator(),) : 
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                )
              ),
              elevation: 10,
              color: Colors.white54,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    PlaceDetailsCard(currentPlace),
                    CropActivityCard(
                      conditions[0],
                      conditions[1],
                      conditions[2],
                    ),
                    MapCard(
                      mapUrl,
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (ctx) => MapScreen(
                              initialLocation: currentPlace.location,
                              isSelecting: false,
                            )
                          )
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}