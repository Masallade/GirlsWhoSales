import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/registration/more_info.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';

class NamePage extends StatefulWidget {
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: <Widget>[
           //   BackgroundWidget(size: size),
              BackButtonPop(),
              SizedBox(height: 6.0,),
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
                        const EdgeInsets.only(top: 100,  left: 50.0, right: 50.0,bottom: 20.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Color(0xFFD7D7D7),
                          valueColor:
                          AlwaysStoppedAnimation<Color>(kAccentColor),
                          value: 0.2,
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0 ),
                        child: PageTitle(
                          titleText:
                          'Provide Your First Name \n & Last Name',
                          fontSize: 24.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: CommonInputForm(labelText: 'First Name',),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Divider(
                                    thickness: 2.0,
                                    color: Color(0xFFD7D7D7),
                                  )),
                            ),
                            Text("AND"),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    thickness: 2.0,
                                    color: Color(0xFFD7D7D7),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      CommonInputForm(labelText: 'Last Name',),
                      // PageTitle(titleText: Strings.titleText4, fontSize: 25.0,),
                      // CommonInputForm(labelText: Strings.labelText2,),
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
            context, MaterialPageRoute(builder: (context) => MoreInfo())),
      ),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
