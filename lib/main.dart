
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:girlzwhosell/screens/intro_pages/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'helpers/scroll_behaviour.dart';



void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
 // debugPaintSizeEnabled = false;

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

//   FirebaseMessaging messaging;
//   PushNotificationMessage _notificationInfo;
//   int totalNotifications = 0;
//   StreamSubscription onMsgSubcription;
//   StreamSubscription notificationSubcription;
//
//   void registerNotification() async {
//    // await Firebase.initializeApp();
//     messaging = FirebaseMessaging.instance;
//
// //three types of state in notification
//
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );
//     if(settings.authorizationStatus == AuthorizationStatus.authorized){
//       print('user granted permission');
//
//       //main msg
//      notificationSubcription= FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         PushNotificationMessage notification = PushNotificationMessage(
//         //  image: message.notification.bodyLocKey,
//           title: message.notification.title ?? "",
//           body: message.notification.body ?? "",
//           Datatitle: message.data['title'],
//           Databody: message.data['body'],
//         );
//     //   notificationsDetails = NotificationModel() as List<NotificationsDetails>;
//         setState(() {
//           totalNotifications ++;
//           _notificationInfo = notification;
//         });
//         if(notification !=null){
//           showSimpleNotification(
//               Text('${_notificationInfo.title ?? ""}'),
//              // leading: Image.network(_notificationInfo.image),
//               trailing: NotificationBadge(
//                 totalNotifications: totalNotifications,
//               ),
//               subtitle: Text('${_notificationInfo.body ?? " "}'),
//               background: Colors.cyan.shade700,
//               duration: Duration(seconds: 3)
//           );
//         }
//       });
// ///app is iin bG but opened & user taps on notification
//      onMsgSubcription= FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         final routeFromMsg = message.data['route'];
//         print('routeFromMsg : $routeFromMsg');
//       });
//     }
//     else{
//       print('permission denied by User');
//     }
//
//   }
//
//
//   String email;
//
//   String password;
//
//   bool isLoggedIn = false;

 // @override
//   void initState(){
//     super.initState();
//  //   registerNotification();
//    // autoLogIn();
//   }
//
//
// @override
//   void dispose (){
//     onMsgSubcription.cancel();
//     notificationSubcription.cancel();
//     super.dispose();
//   }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return OverlaySupport.global(
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'girlzwhosell',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF122F51),
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF122F51)) ,
        ),
         home: SplashScreen(),
      ),
    );
  }
  // autoLogIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String userName = prefs.getString('username');
  //   final String userPass = prefs.getString('userpass');
  //
  //   if (userName != null || userPass != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       email = userName;
  //       password = userPass;
  //       Requests.Login(context, email, password,'',false);
  //     });
  //     return;
  //   }
  //   // else{
  //   //   var duration = const Duration(seconds: 0 );
  //   //   return Timer(duration, () {
  //   //     Navigator.push(
  //   //       context,
  //   //       MaterialPageRoute(
  //   //         builder: (context) {
  //   //           return SignInPage();
  //   //         },
  //   //       ),
  //   //     );
  //   //   });
  //   // }
  // }
}
