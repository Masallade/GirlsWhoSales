
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/intro_pages/splash_screen.dart';
import 'package:girlzwhosell/screens/main_menu/navbar_builder_copy.dart';
import 'package:new_version/new_version.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/scroll_behaviour.dart';
import 'model/PushNotificationMessage _model.dart';
import 'notification_badge/badge_for notification.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'screens/intro_pages/sign_in_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
  //   runApp(new MyApp());
  // });
  runApp(MyApp());
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
   // await Firebase.initializeApp();
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
        //  image: message.notification.bodyLocKey,
          title: message.notification.title ?? "",
          body: message.notification.body ?? "",
          Datatitle: message.data['title'],
          Databody: message.data['body'],
        );
    //   notificationsDetails = NotificationModel() as List<NotificationsDetails>;
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


  String email;

  String password;

  bool isLoggedIn = false;

 @override
  void initState() {
   super.initState();
   registerNotification();
   //autoLogIn();
   // Instantiate NewVersion manager object (Using GCP Console app as example)
   final newVersion = NewVersion(
     iOSId: 'com.girlzwhosell',
     androidId: 'com.girlzwhosell',
   );

   // You can let the plugin handle fetching the status and showing a dialog,
   // or you can fetch the status and display your own dialog, or no dialog.
   const simpleBehavior = true;

   if (simpleBehavior) {
     basicStatusCheck(newVersion);
   } else {
     advancedStatusCheck(newVersion);
   }

 }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    print(' status of update $status');
    if (status != null) {
      print(status.releaseNotes);
      print(status.appStoreLink);
      print(status.localVersion);
      print(status.storeVersion);
      print(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogTitle: 'Update Available',
        dialogText: 'Update your app from ${status.localVersion} to ${status.storeVersion} ',
        dismissButtonText: 'Maybe Later',
        allowDismissal: true
      );
    }
  }





@override
  void dispose (){
    onMsgSubcription.cancel();
    notificationSubcription.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'GirlzWhoSell',
        theme: ThemeData(
          primaryColor: Color(0xFF122F51),
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF122F51)) ,
        ),
         home: SplashScreen(),
      // home: AnimatedSplashScreen(
      //   splash: Image.asset('assets/images/girlwhosell.gif' , width: 400,height: 400,),
      //   // nextScreen: LoginScreen(),
      //   nextScreen: isLoggedIn == true ? Requests.Login(context, email, password, 'token1', false) : SignInPage(),
      //   splashTransition: SplashTransition.sizeTransition,
      //   splashIconSize: 300,
      // ),
      );
  }
  autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userName = prefs.getString('username');
    final String userPass = prefs.getString('userpass');

    if (userName != null || userPass != null) {
      setState(() {
        isLoggedIn = true;
        email = userName;
        password = userPass;
     //   Requests.Login(context, email, password,'',false);
      });
      return;
    }
    else{
    //  var duration = const Duration(seconds: 0 );
      return Timer(Duration(seconds: 0), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SignInPage();
            },
          ),
        );
      });
    }
  }
}
