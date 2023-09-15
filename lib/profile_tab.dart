import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/upload.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  Uint8List? _image;

  void selecctImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  // bool valNotify1 = true;

  // bool valNotify2 = false;

  // bool valNotify3 = false;

  // onChangeFunction1(bool newValue1) {
  //   setState(() {
  //     valNotify1 = newValue1;
  //   });
  // }

  // onChangeFunction2(bool newValue2) {
  //   setState(() {
  //     valNotify2 = newValue2;
  //   });
  // }

  // onChangeFunction3(bool newValue3) {
  //   setState(() {
  //     valNotify3 = newValue3;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          title: Text(
            'PROFILE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notification_important))
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 183, 90, 164),
                Color.fromRGBO(189, 182, 182, 1)
              ],
            )),
          )),
      body: Container(
          child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(children: [
            Icon(
              Icons.person,
              size: 40,
              color: Color.fromRGBO(19, 19, 19, 1.0),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Account',
              style: TextStyle(fontSize: 20),
            )
          ]),
          Divider(
            height: 10,
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Stack(children: [
              _image != null
                  ? CircleAvatar(
                      radius: 65,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(
                          "https://th.bing.com/th/id/OIP.y2QHBC0wfW4Hx7WBj1fVBAHaGA?pid=ImgDet&rs=1"),
                    ),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {
                    selecctImage();
                  },
                ),
                bottom: -10,
                left: 80,
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Add Image',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          buildAcountOptioin(context, 'Change Password'),
          SizedBox(
            height: 10,
          ),
          buildAcountOptioin(context, 'Appearance'),
          SizedBox(
            height: 10,
          ),
          buildAcountOptioin(context, 'Privacy'),
          SizedBox(
            height: 10,
          ),
          buildAcountOptioin(context, 'Delete Account'),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   children: [
          //     Icon(CupertinoIcons.volume_up),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Text(
          //       'Notifications',
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ],
          // ),
          // Divider(
          //   height: 10,
          //   thickness: 3,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // //buildNotificationOption('Reminders', valNotify1, onChangeFunction1),
          // //buildNotificationOption('Ads', valNotify2, onChangeFunction2),
          // //buildNotificationOption('Updates', valNotify3, onChangeFunction3),
          // SizedBox(
          //   height: 20,
          // ),
          Row(children: [
            Icon(
              Icons.question_mark,
              size: 40,
              color: Color.fromRGBO(21, 20, 21, 1.0),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'About',
              style: TextStyle(fontSize: 20),
            )
          ]),
          Divider(
            height: 10,
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'About APP',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black54,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'About US',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black54,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                )
              ],
            ),
          ]),
          Divider(
            height: 10,
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Signed In as: '
                  '${user.email!}',
                  style: TextStyle(fontSize: 25, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                color: Color.fromRGBO(10, 10, 10, 1.0),
                minWidth: 150,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
        ],
      )),
    );
  }

  // Padding buildNotificationOption(
  //     String title, bool value, Function onChangeMethod) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 25,
  //             color: Colors.black54,
  //           ),
  //         ),
  //         Transform.scale(
  //           scale: 0.7,
  //           child: CupertinoSwitch(
  //             activeColor: Color.fromRGBO(14, 13, 14, 1.0),
  //             trackColor: Colors.black54,
  //             value: value,
  //             onChanged: (bool newvalue) {
  //               onChangeMethod(newvalue);
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  GestureDetector buildAcountOptioin(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.black54,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
