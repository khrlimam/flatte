import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  List _dropdown = ["Github", "Facebook", "Twitter"];
  List<DropdownMenuItem<String>> _listdropdown;
  String _social;

  @override
  void initState() {
    _listdropdown = getDropDownMenuItems();
    _social = _listdropdown[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _dropdown) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String select) {
    setState(() {
      _social = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 40.0,
                    ),
                    height: 470.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 5.0,
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40.0,
                                ),
                                Text(
                                  "User Name",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                SizedBox(
                                  height: 0.0,
                                ),
                                Container(
                                  height: 300.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 250.0,
                                        height: 300.0,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0,
                                                  bottom: 5.0,
                                                  left: 0.0,
                                                  right: 0.0),
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  icon: Icon(
                                                    Icons.email,
                                                    color: Colors.black,
                                                    size: 22,
                                                  ),
                                                  hintText: "Email Address",
                                                  hintStyle:
                                                      TextStyle(fontSize: 17.0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 0),
                                              width: 250.0,
                                              height: 1.0,
                                              color: Colors.grey[400],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 0.0,
                                                  right: 0.0),
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  icon: Icon(
                                                    Icons.place,
                                                    size: 22.0,
                                                    color: Colors.black,
                                                  ),
                                                  hintText: "Adderess",
                                                  hintStyle:
                                                      TextStyle(fontSize: 17.0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 0),
                                              width: 250.0,
                                              height: 1.0,
                                              color: Colors.grey[400],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 0.0,
                                                  right: 0.0),
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  icon: Icon(
                                                    Icons.wc,
                                                    size: 22.0,
                                                    color: Colors.black,
                                                  ),
                                                  hintText: "Gender",
                                                  hintStyle:
                                                      TextStyle(fontSize: 17.0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 0),
                                              width: 250.0,
                                              height: 1.0,
                                              color: Colors.grey[400],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 0.0,
                                                  right: 0.0),
                                              child: TextField(
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  icon: Icon(
                                                    Icons.map,
                                                    size: 22.0,
                                                    color: Colors.black,
                                                  ),
                                                  hintText: "Cordinat",
                                                  hintStyle:
                                                      TextStyle(fontSize: 17.0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 0),
                                              width: 250.0,
                                              height: 1.0,
                                              color: Colors.grey[400],
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0.0,
                                                    bottom: 0.0,
                                                    left: 0.0,
                                                    right: 0.0),
                                                child: DropdownButton(
                                                  items: _listdropdown,
                                                  value: _social,
                                                  onChanged:
                                                      changedDropDownItem,
                                                  isExpanded: false,
                                                  hint: Text("Social"),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  elevation: 5,
                                  color: Color(0xFF00838f),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  child: Text(
                                    "Send",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              elevation: 5.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage: NetworkImage(
                                      "https://images.unsplash.com/photo-1498602753442-dfa7a49fc9c4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94ea2de4e20d2cc30c4ec7f2178a34f0&auto=format&fit=crop&w=500&q=60")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
