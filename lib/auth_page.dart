import 'package:flutter/material.dart';
import 'package:new_app/login_page.dart';
import 'package:new_app/sign_%20up_page.dart';

class AuthPage extends StatefulWidget {  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true; //show login page initially

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignUpPage: toggleScreens);
    } else {
      return SignUpPage(showLoginPage: toggleScreens);
    }
  }

}