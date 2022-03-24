import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:girlzwhosell/screens/registration/write_name_page.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/utils/strings.dart';


class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: <Widget>[
              BackgroundWidget(size: size),
              BackButtonPop(),
              SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(top:100,  left: 50.0, right: 50.0,),
                        child: LinearProgressIndicator(
                          backgroundColor: Color(0xFFD7D7D7),
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.green),
                          value: 0.6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: PageTitle(titleText: Strings.titleText3, fontSize: 25.0,),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              print('google');
                            },
                            child: Container(
                              width:SizeConfig.screenWidth,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  // ignore: deprecated_member_use
                                  border: Border.all(color: Theme.of(context).accentColor)),
                              child: Container(
                                child: GestureDetector(
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Icon(FontAwesomeIcons.google,color: Color(0xFFDE1E37),size: 30.0,),
                                    ),
                                    title: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:50.0,bottom: 10.0),
                                        child: Text(
                                          'Import from Google',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          GestureDetector(
                            onTap: (){
                              print('facebook');
                            },
                            child: Container(
                              width: SizeConfig.screenWidth,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  // ignore: deprecated_member_use
                                  border: Border.all(color: Theme.of(context).accentColor)),
                              child: Container(
                                child: GestureDetector(
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Icon(FontAwesomeIcons.facebookF,color: Color(0xFF3B5999),size: 30.0,),
                                    ),
                                    title: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:50.0,bottom: 10.0),
                                        child: Text(
                                          'Import from Facebook',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                                    child: Divider(
                                      thickness: 2.0,
                                      color: Color(0xFFD7D7D7),
                                      height: 50.0,
                                    )),
                              ),
                              Text("OR"),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                                    child: Divider(
                                      thickness: 2.0,
                                      color: Color(0xFFD7D7D7),
                                      height: 50.0,
                                    )),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>NamePage()));
                            },
                            child: Container(
                              width:SizeConfig.screenWidth,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.pink)),
                              child: Container(
                                color: Colors.pink,
                                child: GestureDetector(
                                  child: ListTile(
                                    title: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'Enter your information',
                                          style: kH2WTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: floatingActionButtonNext(
            context, MaterialPageRoute(builder: (context) => NamePage())),
      ),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
