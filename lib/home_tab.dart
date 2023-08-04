import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_app/healthOverview.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
          ),
          title: Text(
            'HOME',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(148, 59, 59, 1.0),
                Color.fromRGBO(10, 10, 10, 1.0)
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            width: 370,
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(211, 149, 149, 0.9803921568627451),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Text(
                    'How do you feel?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RatingBar.builder(
                      minRating: 1,
                      updateOnDrag: true,
                      itemBuilder: (context, _) => Icon(Icons.star),
                      onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                          })),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 370,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(211, 149, 149, 0.9803921568627451),
              ),
              onPressed: () => HealthOverview(),
              child: Text('Health Overview'),
            ),
          )
        ],
      ),
    );
  }
}
