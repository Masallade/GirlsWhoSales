
import 'dart:io';

import 'package:flutter/material.dart';

const TWO_PI = 3.14 * 2;

class utils {
  final size = 200.0;
  static bool validatePhoneNumber(String number) {
    return RegExp(r"^(?:[+0]9)?[0-9]{10,13}$").hasMatch(number);
  }

  static bool validateEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static Future<bool> onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are_you_sure'),
        content: new Text('Do_you_want'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        actions: <Widget>[
          new TextButton(
              child: new Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          //SizedBox(height: 10),
          new TextButton(
            child: new Text('Yes'),
            onPressed: () => exit(0),
          ),
        ],
      ),
    ) ??
        false;
  }
  static Widget getLoader(){
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0,end: 1.0),
          duration: Duration(seconds: 6),
          builder: (context,value,child){
            int percentage = (value*100).ceil();
            return Container(
              width: 200.0,
              height: 200.0,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect){
                      return SweepGradient(
                          startAngle: 0.0,
                          endAngle: TWO_PI,
                          stops: [value,value],
                          // 0.0 , 0.5 , 0.5 , 1.0
                          center: Alignment.center,
                          colors: [Color(0xFF008269),Colors.grey.withAlpha(55)]
                      ).createShader(rect);
                    },
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        // image: DecorationImage(image: Image.asset("assets/images/radial_scale.png").image)
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200.0-40,
                      height: 200.0-40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Center(child: Text("$percentage%",
                        style: TextStyle(fontSize: 40),)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  static Widget getLoaderForClosingBalance(){
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0,end: 1.0),
          duration: Duration(seconds: 50),
          builder: (context,value,child){
            int percentage = (value*100).ceil();
            return Container(
              width: 200.0,
              height: 200.0,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect){
                      return SweepGradient(
                          startAngle: 0.0,
                          endAngle: TWO_PI,
                          stops: [value,value],
                          // 0.0 , 0.5 , 0.5 , 1.0
                          center: Alignment.center,
                          colors: [Color(0xFF008269),Colors.grey.withAlpha(55)]
                      ).createShader(rect);
                    },
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        // image: DecorationImage(image: Image.asset("assets/images/radial_scale.png").image)
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200.0-40,
                      height: 200.0-40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Center(child: Text("$percentage%",
                        style: TextStyle(fontSize: 40),)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  static Widget circularIndicatorInView() {
    return new WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(backgroundColor: Colors.black54, children: <Widget>[
          Center(
            child: Column(children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please Wait....",
                style: TextStyle(color: Colors.blueAccent),
              )
            ]),
          )
        ]));
  }

  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static void showDialogCustom(
      BuildContext context, String title, String body, String button) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: new Text(button),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  static void dataSuccessfullyLoaded(BuildContext context, String title, String body, String button) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          backgroundColor: Colors.grey,
          title: new Text(title),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: new Text(
                    button, style: TextStyle(color: Colors.black),)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}