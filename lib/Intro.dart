import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'main_page.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Find Out',
            body:
                '"Knowing yourself is the beginning of all wisdom."–Aristotle',
            //image: buildImage('assets/intro.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Best Self Help',
            body: 'This is not for distribution as it is a college project',
            //image: buildImage('assets/intro.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Click Next to SIGN IN',
            body: 'If you are waiting for a sign this is it',
            //image: buildImage('assets/bg.png'),
            decoration: getPageDecoration(),
          )
        ],
        done: Icon(Icons.arrow_forward),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: Text('skip'),
        next: Icon(Icons.arrow_forward_outlined),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));

  //Widget buildImage(String path)=> Center(child: Image.asset(path, width: 250,));
  PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      pageColor: Colors.grey);
}
