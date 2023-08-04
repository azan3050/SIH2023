import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_app/search.dart';
import 'package:new_app/settings_page.dart';
import 'alexaaa.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Find(),
    AI(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_page),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: GNav(
          backgroundColor: Colors.transparent,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: Color.fromRGBO(148, 59, 59, 1.0),
          gap: 10,
          selectedIndex: _page,
          onTabChange: (index) {
            setState(() {
              _page = index;
            });
          },
          padding: EdgeInsets.all(12),
          tabs: [
            GButton(
              icon: Icons.home_filled,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search_sharp,
              text: 'Find',
            ),
            GButton(
              icon: Icons.mic,
              text: 'Ask AI',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
