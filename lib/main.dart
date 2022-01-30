import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:girlzwhosell/screens/intro_pages/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This is the last thing you need to add.
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // final pushNotificationService = PushNotificationService(_firebaseMessaging);
    //pushNotificationService.initialise();
    // the rest of your build method
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

      systemNavigationBarColor: Colors.red[50],
      // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return OverlaySupport(
      child: MaterialApp(
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