
import 'package:flutter/material.dart';

import 'package:flatte/widget/auth.dart';
import 'package:flatte/widget/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.auth, this.onSignedIn}) : super(key: key);


  final BaseAuth auth;
  final VoidCallback onSignedIn;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                                    child:
                                    FlatButton(
                                      onPressed: () => tombolMasuk(),
                                      child:  Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'arial_rounded',
                                          fontSize: 25.0,
                                        ),
                                      ),

                                    )

                                ),

                              ],
                            ),
                          ),
                          onPressed: () {
                          }),
                    ),
                  )
              )
            ],
          )),
    );

  }

  void tombolMasuk() async{
    String userId = "";
    userId = await widget.auth.signIn();

    if (userId.length > 0 && userId != null) {
      widget.onSignedIn();
    }
  }
}
