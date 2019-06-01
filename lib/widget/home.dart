import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController;
  int _page = 0;
  Color _color = Colors.white;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: _color,
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.map, size: 30,),
            Icon(Icons.create, size: 30),
            Icon(Icons.book, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.lightBlue[100],
          buttonBackgroundColor: Colors.brown,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: navigationToPage,
        ),
        body: PageView(
          children: <Widget>[
            Container(
              child: Center(
                child: Text("data"),
              )
            ),
            Container(
              child: Center(
                child: Text("Create"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Profil"),
              )
            ),
            Container(
              child: Center(
                child: Text("detail"),
              )
            ),
          ],
          controller: _pageController,
          onPageChanged: onPageChanged,
        )
        );
  }
  void navigationToPage(int page){
    _pageController.animateToPage(page, duration: Duration(milliseconds: 50), curve: Curves.easeInOut);
  }

  void onPageChanged(int page){
    Color _tempColor;
    switch (page) {
      case 0:
        _tempColor = Colors.white;
        break;
      case 1:
        _tempColor = Colors.white;
        break;
      case 2:
        _tempColor = Colors.white;
        break;
      case 3:
        _tempColor = Colors.white;
        break;
    }
    setState(() {
      this._page = page;
      this._color = _tempColor;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

}