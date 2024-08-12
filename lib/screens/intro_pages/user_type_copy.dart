import 'package:flutter/material.dart';
import 'package:girlzwhosell/mentor_mentee/SignupForm/Mentorform.dart';
import 'package:girlzwhosell/screens/intro_pages/jobtypess.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/intro_pages/webview_for_employer_login.dart';
import 'package:girlzwhosell/screens/registration/superPowerPage.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class UserType extends StatefulWidget {
final String? userId;

   UserType({Key? key, this.userId}) : super(key: key);
  @override
  _UserTypeState createState() => _UserTypeState(userId:userId);
}

class _UserTypeState extends State<UserType> {

  final String? userId;
  String _text = 'Hello!';
  String _text2 = 'Hi! Welcome to';
  String _text3 = 'GirlzWhoSell Career Conextions!';
  String _text4 = '';
  Color? Color1 = Colors.blueGrey[300];

  _UserTypeState({this.userId});
  // Color Color1 = Color.fromARGB(255, 112, 126, 148);
  void _doSomething() {
    setState(() {
      _text = 'Hello There!';
      _text2 = 'Welcome to Career Conextions.';
      _text3 = 'Let\'s get you started!';
      _text4 = 'Are you a ..';
      // isSelected = true;
    });
  }

  TextEditingController textInputController = TextEditingController();

  List<String> _selectWhoYouAre = [
    'Job Seeker',
    'Mentor/Mentee',
    'Hiring',
  ];

  int selected = -1;

  GlobalKey<FormState> _formKey = GlobalKey();

  //String url ='https://biitsolutions.co.uk/girlzwhosell/uploads/terms_conditions/GWS_Terms_and_Conditions.docx';
  String url ='https://girlzwhosellcareerconextions.com/uploads/terms_conditions/GWS_Terms_and_Conditions.docx';

  Future<void>? launched;
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<Null> userType(int type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setInt('usertype',type);
    print("player prefes set ${prefs.getInt('usertype')}");

  }



  @override
  Widget build(BuildContext context) {
    var n = 3;
    var listOfContainers = <Padding>[];
    var list = List<int>.generate(n, (i) => i + 0);
    list.forEach((i) {
      Color borderColor = (i == selected)
          ? Color.fromRGBO(1, 82, 174, 1)
          : Color.fromRGBO(220, 225, 234, 1);
      return listOfContainers.add(
        Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 16,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selected = i;
                  userType(0);
                  print(i);
                });
               _doSomething();
                if(selected == 1){
                  userType(1);
                  _doSomething();
                }
                if(selected == 2){
                  userType(2);
                  _doSomething();
                }
              },
              child: Container(
                width: SizeConfig.screenWidth,
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: ListTile(
                  title: Text(
                    '${_selectWhoYouAre[i]}',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Questrial',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: selected == i
                      ? Icon(
                          Icons.check,
                          color: Color.fromRGBO(117, 162, 66, 1),
                        )
                      : null,
                ),
              ),
            )),
      );
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
        //    // Navigator.of(context).pop();
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //     size: 30.0,
        //   ),
        // ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27.5, right: 27.5),
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 2.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Text(_text, style: HeadingStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(_text2, style: subtitleStyle)),
                SizedBox(
                  height: 5,
                ),
                Text(_text3, style: subtitleStyle),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(_text4,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Questrial'))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listOfContainers,
                ),
                SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(SizeConfig.screenWidth!, 60.0),
                          primary: Color.fromARGB(255, 255, 65, 129),
                          //onSurface:  Colors.pinkAccent[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // setState(() {
                          //   selected = i;
                          //   print(i);
                          // });
                          print(selected);
                         if(selected == 0){
                          // _doSomething();
                          //  Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SuperPowerPage()));
                           Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));//SignInPage,entryLevel
                         }
                          if(selected == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MentorForm()));
                          }
                          if(selected == 2){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewClass()));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please Select Something')));
                        }
                      }),
                ),
                SizedBox(
                  height: 26,
                ),
                InkWell(
                    onTap:() => setState(() {
                      launched = _launchInBrowser(url);
                    }),
                    child: Text("Terms & Conditions", style: TermsCondition)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
