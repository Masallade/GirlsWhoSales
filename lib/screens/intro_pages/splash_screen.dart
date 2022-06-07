import 'dart:async';

import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/Requests.dart';



// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()),
//     ));
//   }
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: ClipRRect(
//         borderRadius: BorderRadius.zero,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 812.0,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(-1.0, -1.0),
//               end: Alignment(0.9999999701976781, 0.9999999701976781),
//               stops: [0.0, 1.0],
//               colors: [
//                 Color.fromARGB(255, 255, 203, 221),
//                 Color.fromARGB(255, 204, 227, 254)
//               ],
//             ),
//           ),
//           child: Stack(
//               clipBehavior: Clip.none,
//               fit: StackFit.expand,
//               alignment: Alignment.center,
//               children: [
//                 Image.asset('assets/images/girlwhosell.gif'),
//               ]),
//         ),
//       ),
//     );
//   }
// }


final player = AudioPlayer();
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.setAsset('assets/audio/sound.mp3');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }
  Function playSound = (){
    player.play();
    return 1;
  };
  Map<int, Widget> output = {1 : SignInPage()};


  String email;

  String password;

  bool isLoggedIn = false;



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedSplash(
        imagePath:'assets/images/finalsplashlogo.gif',
        home: SignInPage(),
        customFunction: playSound,
        duration: 2000,
        type: AnimatedSplashType.BackgroundProcess,
        outputAndHome: output,
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
        Requests.Login(context, email, password,'',false);
      });
      return;
    }
    else{
      var duration = const Duration(seconds: 0 );
      return Timer(duration, () {
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
