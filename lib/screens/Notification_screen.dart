
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/notification_badge/badge_for%20notification.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationScreen extends StatefulWidget {

  final user_Id;
  final token1;
  PushNotificationMessage notificationInfo;
  NotificationScreen({this.user_Id,this.token1 ,this.notificationInfo});
  @override
  _NotificationScreenState createState() => _NotificationScreenState(user_Id: user_Id ,token1: token1 ,notificationInfo: notificationInfo);
}

class _NotificationScreenState extends State<NotificationScreen> {

  final user_Id;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseMessaging messaging;
  String token1;
  StreamSubscription onMsgSubcription;
  StreamSubscription notificationSubcription;
  _NotificationScreenState({this.user_Id ,this.token1 ,this.notificationInfo});

 // void initState(){
 //   super.initState();
 //   getToken();
 //  // registerNotification();
 // }

Future getToken() async{
   await _firebaseMessaging.getToken().then((token) {
     print("Token is :$token");
     setState(() {
       token1 = token;
     });
   } );
}

  int totalNotifications = 0;
  //model
  PushNotificationMessage notificationInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            //  color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style:TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
            //fontWeight: FontWeight.w700,
          ),
          // style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
       //   mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //NotificationBadge(totalNotifications: totalNotifications),
          notificationInfo !=null ? ListTile(
          leading:Image.network(notificationInfo.image ?? 'https://biitsolutions.co.uk/girlzwhosell/public/dist/img/Career%20Conextions.png'),
          title:Text("${ notificationInfo.Datatitle ?? notificationInfo.title }" , style: TextStyle(
                fontFamily: 'Questrial',
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),),
              //SizedBox(height: 10,),
           subtitle:Text("${ notificationInfo.Databody ?? notificationInfo.body}" , style: TextStyle(
                  fontFamily: 'Questrial',
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),
          ) : Center(child: Text('No Notification')),
        ],
      ),
    );
  }
  // Future getQue() async {
  //  if(token1!=null){
  //   var response = await http.post('https://biitsolutions.co.uk/girlzwhosell/API/fcm_register.php',
  //   body: {
  //     "token": token1,
  //     "user_id": user_Id
  //   });
  //   print(token1);
  //   print(user_Id);
  //   return json.decode(response.body);
  //
  //  }
  //  else {
  //    print("Token is Null");
  //  }
  // }
}
