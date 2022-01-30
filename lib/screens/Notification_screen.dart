
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/notification_badge/badge_for%20notification.dart';
import 'package:http/http.dart'as http;
import 'package:overlay_support/overlay_support.dart';

class NotificationScreen extends StatefulWidget {

  final user_Id;
  final token1;
  NotificationScreen({this.user_Id,this.token1});
  @override
  _NotificationScreenState createState() => _NotificationScreenState(user_Id: user_Id ,token1: token1);
}

class _NotificationScreenState extends State<NotificationScreen> {

  final user_Id;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseMessaging messaging;
  String token1;
  _NotificationScreenState({this.user_Id ,this.token1});

 void initState(){
   super.initState();
   getToken();
   registerNotification();
 }

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
  PushNotificationMessage _notificationInfo;
  void registerNotification() async {
//    await Firebase.initializeApp();
    //instance for firebase messaging
    messaging = FirebaseMessaging.instance;

//three types of state in notification

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('user granted permission');

      //main msg
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationMessage notification = PushNotificationMessage(
          // image: message.notification.,
          title: message.notification.title,
          body: message.notification.body,
          Datatitle: message.data['title'],
          Databody: message.data['body'],
        );

setState(() {
   totalNotifications ++;
  _notificationInfo = notification;
});
if(notification !=null){
  showSimpleNotification(
    Text(_notificationInfo?.title),
    leading: NotificationBadge(
      totalNotifications: totalNotifications,
    ),
    subtitle: Text(_notificationInfo?.body),
    background: Colors.cyan.shade700,
    duration: Duration(seconds: 3)
  );
}
      });
    }
else{
  print('permission denied by User');
    }

  }
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child: Text('Notification Available Soon')),
            // SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 28 ),
            //   child: Container(
            //     width:SizeConfig.screenWidth,
            //     height: 55.0,
            //     decoration: BoxDecoration(
            //       // color:  Colors.red[100],
            //       color: Colors.pinkAccent[200],
            //       borderRadius: BorderRadius.circular(5.0),
            //       // border: Border.all(color: Theme.of(context).accentColor)),
            //     ),
            //     child: GestureDetector(
            //       onTap: ()
            //       {
            //          getQue();
            //       },
            //       child: ListTile(
            //         title: Center(
            //           child: Padding(
            //             padding: const EdgeInsets.only(bottom: 10.0),
            //             child: Text(
            //               'Send Notification',
            //               style:  TextStyle(
            //                 fontFamily: 'Poppins',
            //                 fontStyle: FontStyle.normal,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.white,
            //                 fontSize: 17.0,
            //                 //fontWeight: FontWeight.w700,
            //               ),
            //
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //showinh here badge for showing totalNotifications
            NotificationBadge(totalNotifications: totalNotifications,),
            _notificationInfo !=null ? Column(
              children: [
                Text("title: ${ _notificationInfo.Datatitle ?? _notificationInfo.title }" , style: TextStyle(
                  fontFamily: 'Questrial',
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 10,),
                Text("Body: ${ _notificationInfo.Databody ?? _notificationInfo.body}" , style: TextStyle(
                    fontFamily: 'Questrial',
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),),
              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
  Future getQue() async {
   if(token1!=null){
    var response = await http.post('https://biitsolutions.co.uk/girlzwhosell/API/fcm_register.php',
    body: {
      "token": token1,
      "user_id": user_Id
    });
    print(token1);
    print(user_Id);
    return json.decode(response.body);

   }
   else {
     print("Token is Null");
   }
  }
}
