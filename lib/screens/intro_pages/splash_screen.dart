import 'dart:async';
import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/second_splash_screen.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/intro_pages/user_type_copy.dart';
import 'package:girlzwhosell/screens/intro_pages/webview_for_employer_login.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/Requests.dart';
import '../../mentor_mentee/SignupForm/Mentorform.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  int? userTypeValue = 1;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    userType();
    // autoLogIn();
    // player.setAssset('assets/audio/sound.mp3');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // player.dispose();
  }


  Future<int?> userType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getBool(KeyisUserAlreadyLogin) ?? false){
      print("return ttype 3 valuue");
      return 3;
    }else{
      prefs.setBool(KeyisUserAlreadyLogin, false);
    }
    userTypeValue = prefs.getInt('usertype');

    if (userTypeValue == null || (userTypeValue != 0 && userTypeValue != 1 && userTypeValue != 2)) {
      userTypeValue = -1;
      prefs.setInt('usertype', userTypeValue!);
    }

    print('User type: $userTypeValue');
    return userTypeValue;
  }



  Function playSound = (){
    // player.play();
    return 1;
  };
  Map<int, Widget> output0= {1 : UserType()};//UserType, SignInPage,WebViewClass
  Map<int, Widget> output1= {1 : SignInPage()};//UserType, SignInPage,WebViewClass
  Map<int, Widget> output2= {1 : WebViewClass()};//UserType, SignInPage,WebViewClass
  Map<int, Widget> output3= {1 : SecondSplash()};

  String? email;

  String? password;

  bool isLoggedIn = false;




  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return FutureBuilder<int?>(
      future: userType(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the userTypeValue, show a loading screen
          // return CircularProgressIndicator();
          return Container(
                    color: Colors.white,
                  );
          //         or any other loading widget
        } else if (snapshot.hasError) {
          // Handle error if the userTypeValue retrieval fails
          return Text('Error: ${snapshot.error}');
        } else {
          // userTypeValue is retrieved successfully
          int? userTypeValue = snapshot.data;

          if (userTypeValue == -1) {
            return AnimatedSplash(
              imagePath: 'assets/images/finalsplashlogo.gif',
              onAnimationCompleted: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));}, // SignInPage, UserType, WebViewClass
              onReadyToGoNextScreen: ()=> output0,
            );
          } else if (userTypeValue == 0 || userTypeValue == 1) {
            return AnimatedSplash(
              imagePath: 'assets/images/finalsplashlogo.gif',
              onReadyToGoNextScreen: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));}, // SignInPage, UserType, WebViewClass
              duration: Duration(milliseconds: 2000),
              onAnimationCompleted: ()=>output1,
            );
          } else if (userTypeValue == 2) {
            return AnimatedSplash(
              imagePath: 'assets/images/finalsplashlogo.gif',
                onReadyToGoNextScreen: ()=> WebViewClass(), // SignInPage, UserType, WebViewClass

              duration: Duration(milliseconds: 2000),
              onAnimationCompleted: ()=>output2,
            );
          }else if (userTypeValue == 3){
            return AnimatedSplash(
              imagePath: 'assets/images/finalsplashlogo.gif',
              // onAnimationCompleted: ()=>SecondSplash(), // SignInPage, UserType, WebViewClass
                onAnimationCompleted: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecondSplash()));},// SignInPage, UserType, WebViewClass


                duration: Duration(milliseconds: 2000),
              onReadyToGoNextScreen: ()=>output3,
            );
          } else {
            // Handle unexpected userTypeValue
            return Text('Invalid userTypeValue');
          }
        }
      },
    );
  }



  autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(!prefs.getBool(KeyisUserAlreadyLogin)!)
      return;

    final String? userName = prefs.getString(keyUserName);
    final String? userPass = prefs.getString(KeyUserPassword);

    if (userName != null || userPass != null) {
      setState(() {
        isLoggedIn = true;
        email = userName;
        password = userPass;
        Requests.Login(context, email, password,'',false);
        print("user auto login successsfully");
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
