import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  GoogleMapController mapController;
  BehaviorSubject<double> radius = BehaviorSubject(seedValue: 1.0);
  int _radioValue1 = 1;

  List<LatLng> coordinates = [
    LatLng(-8.542653, 116.082825),
    LatLng(-8.532297, 116.079134),
    LatLng(-8.539173, 116.088061),
    LatLng(-8.549698, 116.093469),
    LatLng(-8.540446, 116.077074),
    LatLng(-8.549698, 116.075701),
    LatLng(-8.547746, 116.085486),
    LatLng(-8.536626, 116.080765)
  ];

  void _handleRadioValueChange1(i) {
    setState(() {
      _radioValue1 = i;
    });
  }

  @override
  Widget build(context) {
    return Stack(children: [
      GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(-8.532578, 116.0694391), zoom: 20),
        onMapCreated: _onMapCreated,
        myLocationEnabled:
            true, // Add little blue dot for device location, requires permission from user
      ),
      Positioned(
        bottom: 70,
        left: 2,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Radio(
              value: 0,
              groupValue: _radioValue1,
              onChanged: _handleRadioValueChange1,
            ),
            new Text(
              'Heroes',
              style: new TextStyle(fontSize: 16.0),
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue1,
              onChanged: _handleRadioValueChange1,
            ),
            new Text(
              'Problems',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 50,
          left: 10,
          child: Slider(
            min: 1.0,
            max: 20.0,
            divisions: 20,
            value: radius.value,
            label: 'Radius ${radius.value.round()}km',
            activeColor: Colors.blue,
            inactiveColor: Colors.blue.withOpacity(0.2),
            onChanged: _updateQuery,
          ))
    ]);
  }

  _addMarker() {
    var marker = MarkerOptions(
        position: mapController.cameraPosition.target,
        icon: BitmapDescriptor.defaultMarker,
        infoWindowText: InfoWindowText('Magic Marker', '🍄🍄🍄'));
        mapController.addMarker(marker);
  }

  _updateQuery(value) {
    setState(() {
      radius.add(value);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _addMarker();
    });
  }
}
