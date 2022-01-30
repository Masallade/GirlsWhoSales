import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
const TWO_PI = 3.14 * 2;

class utils {

  static bool validatePhoneNumber(String number) {
    return RegExp(r"^(?:[+0]9)?[0-9]{10,13}$").hasMatch(number);
  }
  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
  static Future<bool> onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the app?'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          new FlatButton(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: new Text(
                    'No', style: TextStyle(color: Colors.black),)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }
          ),
          //SizedBox(height: 10),
          new FlatButton(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: new Text(
                  'Yes', style: TextStyle(color: Colors.black),)
            ),
            onPressed: ()=> SystemNavigator.pop(),
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
          duration: Duration(seconds: 3),
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
                          colors: [Colors.lightBlue[800],Colors.grey.withAlpha(55)]
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
        child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            backgroundColor: Colors.grey,
            children: <Widget>[
              Center(
                child: Column(children: [
                  SizedBox(height: 10,),
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  backgroundColor: Colors.grey,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }

  void showDialogCustom(BuildContext context, String title, String body, String button) {
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
            new FlatButton(
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

  void showDialogCustomForLogin(BuildContext context, String title, String body, String button) {
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
            new FlatButton(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignInPage();
                    },
                  ),
                );
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static void showDialogCustomforApiResponse(
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
            new FlatButton(
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


  // static showToast(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.black12,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  // }
}