import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser!;

  bool valNotify1= true;

  bool valNotify2= false;

  bool valNotify3 = false;

  onChangeFunction1(bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3){
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
        title: Text('SETTING',style: TextStyle(fontWeight: FontWeight.bold,),),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(148, 59, 59, 1.0),
                Color.fromRGBO(12, 12, 12, 1.0)
            ],
          )
        ),
      )),
    body: Container(
      child: ListView(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.person,size: 40,color: Color.fromRGBO(19, 19, 19, 1.0),),
              SizedBox(width: 10,),
              Text('Account', style: TextStyle(fontSize: 20 ),)
            ]
          ),
          Divider(height: 10,thickness: 3,),
          SizedBox(height: 10,),
          buildAcountOptioin(context, 'Change Password'),
          SizedBox(height: 10,),
          buildAcountOptioin(context, 'Appearance'),
          SizedBox(height: 10,),
          buildAcountOptioin(context, 'Privacy'),
          SizedBox(height: 10,),
          buildAcountOptioin(context, 'Delete Account'),

          SizedBox(height: 40,),

          Row(
            children: [
              Icon(CupertinoIcons.volume_up),
              SizedBox(width: 10,),
              Text('Notifications', style: TextStyle(fontSize: 20 ),),
            ],
          ),
          Divider(height: 10,thickness: 3,),
          SizedBox(height: 10,),

          buildNotificationOption('Reminders', valNotify1, onChangeFunction1),
          buildNotificationOption('Ads', valNotify2, onChangeFunction2),
          buildNotificationOption('Updates', valNotify3, onChangeFunction3),

          SizedBox(height: 20,),
          Row(
              children: [
                Icon(Icons.question_mark,size: 40,color: Color.fromRGBO(
                    21, 20, 21, 1.0),),
                SizedBox(width: 10,),
                Text('About', style: TextStyle(fontSize: 20 ),)
              ]
          ),
          Divider(height: 10,thickness: 3,),
          SizedBox(height: 10,),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('About APP',style: TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black54,
                  ),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black54,)
                ],
              ),


              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('About US',style: TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black54,
                  ),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black54,)
                ],
              ),

            ]
          ),
          Divider(height: 10,thickness: 3,),
          SizedBox(height: 10,),

          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Signed In as: '
                    '${user.email!}',style: TextStyle(
                  fontSize: 25,
                  color: Colors.black54
                ),),
              ),
              SizedBox(height: 20,),
              MaterialButton(onPressed: () => FirebaseAuth.instance.signOut(),
                color: Color.fromRGBO(10, 10, 10, 1.0),
                minWidth: 150,
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                child: const Text('Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
              )
            ],
          )),
        ],
      )
    ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 25,
          color: Colors.black54,
        ),),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: Color.fromRGBO(14, 13, 14, 1.0),
            trackColor: Colors.black54,
            value: value,
            onChanged: (bool newvalue) {
              onChangeMethod(newvalue);
          },
          ),
        )
      ],
    ),);
  }

  GestureDetector buildAcountOptioin(BuildContext context, String title){
    return GestureDetector(
      onTap: (){


      },child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          color: Colors.black54,
        ),),
        Icon(Icons.arrow_forward_ios,color: Colors.black54,)
      ],
    ),
    );
  }
}
