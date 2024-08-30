
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/provider_model/about_us_state_management.dart';
import 'package:girlzwhosell/dawood/presentation/job_details/controller/job_details_state_Management.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/routes_manager.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/intro_pages/splash_screen.dart';
import 'package:new_version/new_version.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dawood/presentation/resources/theme_manager.dart';
import 'helpers/scroll_behaviour.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  // await Firebase.initializeApp();
  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  // );
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
  //   runApp(new MyApp());
  // });
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>AboutUsStateManagement()),
          ChangeNotifierProvider(create:(_)=>JobDetailsStateManagement())
        ],
    child: MyApp(),
    ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // FirebaseMessaging messaging;
  // PushNotificationMessage _notificationInfo;
  // int totalNotifications = 0;
  // StreamSubscription onMsgSubcription;
  // StreamSubscription notificationSubcription;

//   void registerNotification() async {
//    await Firebase.initializeApp();
//     messaging = FirebaseMessaging.instance;
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


  String? email;
  String? password;
  bool isLoggedIn = false;

 @override
  void initState() {
   super.initState();
   // _checkVersion();
   // registerNotification();
   // autoLogIn();
   // Instantiate NewVersion manager object (Using GCP Console app as example)

   // final newVersion = NewVersion(
   //   iOSId: 'com.girlzwhosell',
   //   androidId: 'com.girlzwhosell',
   // );

   // You can let the plugin handle fetching the status and showing a dialog,
   // or you can fetch the status and display your own dialog, or no dialog.
   // const simpleBehavior = true;

   // if (simpleBehavior) {
   //   basicStatusCheck(newVersion);
   // } else {
   //   advancedStatusCheck(newVersion);
   // }

 }
 //-------------------------------CHECK VERSION

  void _checkVersion() async {
    final newVersion = NewVersion(
      androidId: "com.girlzwhosell",
    );
    final status = (await newVersion.getVersionStatus())!;
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status,
      dialogTitle: "Update Available",
      dismissButtonText: "Skip",
      dialogText: "Please update the app from " + "${status.localVersion}" + " to " + "${status.storeVersion}",
      dismissAction: () {
        SystemNavigator.pop();
      },
      updateButtonText: "Lets! update",
    );

    print("DEVICE : " + status.localVersion);
    print("STORE : " + status.storeVersion);
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
    // onMsgSubcription.cancel();
    // notificationSubcription.cancel();
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
        title: 'Girlz Who Sell',
        theme: getApplicationTheme(),
         initialRoute: Routes.splashRoute,
         onGenerateRoute: RouteGenerator.getRoute,
         // home: SplashScreen(),
      );
  }
  autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userName = prefs.getString('username');
    final String? userPass = prefs.getString('userpass');

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
