import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_app/Schemes.dart';
import 'package:new_app/profile_tab.dart';
import 'package:new_app/FAQs.dart';
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
    Community(),
    FAQs(),
    Profile(),
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
          tabBackgroundColor: Color.fromARGB(255, 183, 90, 164),
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
              icon: Icons.help,
              text: 'Schemes',
            ),
            GButton(
              icon: Icons.question_answer,
              text: 'FAQs',
            ),
            GButton(
              icon: Icons.person_2,
              text: 'Profile',
            ),
            // GButton(
            //   icon: Icons.notification_important,
            //   text: 'Notifications',
            // ),
          ],
        ),
      ),
    );
  }
}

class Community extends StatelessWidget {
  const Community({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Find();
  }
}
