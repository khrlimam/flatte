import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flatte/widget/auth.dart';
import 'home.dart';

class main_page extends StatefulWidget {
  main_page({Key key, this.auth, this.userId, this.userEmail, this.namax, this.fotox, this.onSignedOut})
      : super(key: key);

  final String title = 'Halaman User';


  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId, userEmail, namax, fotox;

  @override
  State<StatefulWidget> createState() => main_pageState();
}
class main_pageState extends State<main_page> {



  @override
  void initState() {
    super.initState();
//    Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(
//            builder: (BuildContext context) => BottomNavBar()));
  }

  int _counter = 0;
  GoogleMapController mapController;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final LatLng _center = const LatLng(45.521563, -122.677433);



  bool layarHome = true;
  var dataUser = null;
  int layarIndex = 0;

  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
//      bottomNavigationBar: BottomNavBar(), //ini mau ganti yang google map ini atau gmn? beda scaffold
    );
  }


}

