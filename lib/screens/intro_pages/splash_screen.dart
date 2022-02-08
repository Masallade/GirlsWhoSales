import 'dart:async';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/size_config.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()),
    ));
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 375.0,
        height: 812.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -1.0),
            end: Alignment(0.9999999701976781, 0.9999999701976781),
            stops: [0.0, 1.0],
            colors: [
              Color.fromARGB(255, 255, 203, 221),
              Color.fromARGB(255, 204, 227, 254)
            ],
          ),
        ),
        child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
             Image.asset('assets/images/splashNewlogo.gif',scale: 2.5),
            ]),
      ),
    ),
    );
  }
}
