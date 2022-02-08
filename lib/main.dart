import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/notification_badge/badge_for%20notification.dart';
import 'package:girlzwhosell/screens/intro_pages/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This is the last thing you need to add.
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  debugPaintSizeEnabled = false;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging messaging;
  PushNotificationMessage _notificationInfo;
  int totalNotifications = 0;
  StreamSubscription onMsgSubcription;
  StreamSubscription notificationSubcription;
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
     notificationSubcription= FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationMessage notification = PushNotificationMessage(
          image: message.notification.bodyLocKey,
          title: message.notification.title ?? "",
          body: message.notification.body ?? "",
          Datatitle: message.data['title'],
          Databody: message.data['body'],
        );

        setState(() {
          totalNotifications ++;
          _notificationInfo = notification;
        });
        if(notification !=null){
          showSimpleNotification(
              Text('${_notificationInfo.title ?? ""}'),
             // leading: Image.network(_notificationInfo.image),
              trailing: NotificationBadge(
                totalNotifications: totalNotifications,
              ),
              subtitle: Text('${_notificationInfo.body ?? " "}'),
              background: Colors.cyan.shade700,
              duration: Duration(seconds: 3)
          );
        }
      });
///app is iin bG but opened & user taps on notification
     onMsgSubcription= FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        final routeFromMsg = message.data['route'];
        print('routeFromMsg : $routeFromMsg');
      });
    }
    else{
      print('permission denied by User');
    }

  }

  StreamSubscription subscription;
  StreamSubscription internetSubscription;
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;


  @override
  void initState(){
    super.initState();
     subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() => this.result = result);
    });
    internetSubscription = InternetConnectionChecker().onStatusChange.listen((status) {
     var hasInternet = status = InternetConnectionStatus.connected;
      setState(() => hasInternet = hasInternet);
    });

    Connection ();
    registerNotification();
  }
  void Connection ()  async{
    hasInternet = await InternetConnectionChecker().hasConnection;
    result = await Connectivity().checkConnectivity();

    final color = hasInternet ? Colors.pinkAccent[200] : Colors.blue[800];
    final txt = hasInternet ? 'Internet' :'No Internet Connection';

    if(result == ConnectivityResult.mobile){
      showSimpleNotification(
        Text('$txt : Mobile Network Connected' , style: TextStyle(
            color: Colors.white ,fontSize: 20
        ),),
        background: color,
      );
    }
    else if (result == ConnectivityResult.wifi){
      showSimpleNotification(
        Text('$txt : Wifi Connected' , style: TextStyle(
            color: Colors.white ,fontSize: 20
        ),),
        background: Colors.red,
      );
    }
    else {
      showSimpleNotification(
        Text('$txt : No Network Connection' , style: TextStyle(
            color: Colors.white ,fontSize: 20
        ),),
        background: Colors.red,
      );
    }
  }

  void dispose (){
    subscription.cancel();
    internetSubscription.cancel();
    onMsgSubcription.cancel();
    notificationSubcription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

      systemNavigationBarColor: Colors.red[50],
      // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return OverlaySupport.global(
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'GirlzWhoSell',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF122F51),
          accentColor: Color(0xFF122F51), fontFamily: 'Poppins' ,
        ),
        home: SplashScreen(),
      ),
    );
  }
}