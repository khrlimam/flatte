import 'package:flatte/widget/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset("assets/logo.png", height: 200, width: 200,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 100),
            child: Center(
              child: Hero(
                    tag: "dash",
                    transitionOnUserGestures: true,
                    child: MaterialButton(
                    color: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/GOOGLE.png", height: 50, width: 50,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 42.0),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'arial_rounded',
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Profil()));
                      }),
                  ),
            )
          )
        ],
      )),
    );
  }
}
