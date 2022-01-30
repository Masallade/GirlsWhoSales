import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/size_config.dart';

class ResetSuccessfullScreen extends StatefulWidget {

  @override
  _ResetSuccessfullScreen createState() {
    return _ResetSuccessfullScreen();
  }
}

class _ResetSuccessfullScreen extends State<ResetSuccessfullScreen> {
  TextEditingController textPasswordController = new TextEditingController();
  TextEditingController textConfirmPasswordController =
  new TextEditingController();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();

    return new Future.value(false);
  }

  @override
  void initState() {
    super.initState();
  }
  String password;
  final _key = GlobalKey<FormFieldState>();
  final key = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          //  backgroundColor: mainBgColor
          body: SingleChildScrollView(
            child: Column(
              children: [
              //  BackButtonPop(),
                SizedBox(
                  height: 120,
                ),

                Image.asset(
                  'assets/images/successImage.png',scale:1.0,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 200,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 34, 34, 34),

                      /* letterSpacing: 0.0, */
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('Successful' ,
                          duration: Duration(seconds: 5) ,
                          textStyle: TextStyle(
                            height: 1.171875,
                            fontSize: 24.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 34, 34, 34),),
                        )],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  '''You have successfully reset your password.
Proceed to login now.''',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16.0,
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 112, 126, 148),

                    /* letterSpacing: 0.0, */
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20 , right: 20),
                  child: Container(
                    // width:SizeConfig.screenWidth,
                    width: SizeConfig.screenWidth,
                    height:60.0,                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Color.fromARGB(255, 255, 65, 129),
                    borderRadius: BorderRadius.circular(5.0),
                    // border: Border.all(color: Theme.of(context).accentColor)),
                  ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                      },
                      child: ListTile(
                        title: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Proceed to Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
