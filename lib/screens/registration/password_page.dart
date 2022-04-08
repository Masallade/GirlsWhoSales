import 'package:flutter/material.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/utils/strings.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  bool passwordVisible;
  bool passwordVisibleConfirm;

  List<String> _selectOption = ['✉️'+Strings.appMail, '📱 '+Strings.userPhone];
  int _defaultChoiceIndex;

  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
    passwordVisibleConfirm = false;
    _defaultChoiceIndex = 0;
    super.initState();
  }

  Expanded selectOption() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _selectOption.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        ChoiceChip(
                          label: Container(
                            width: SizeConfig.screenWidth,
                            child: Text(
                              _selectOption[index],
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                          backgroundColor:Color(0xFFD7D7D7),
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          selected: _defaultChoiceIndex == index,
                          selectedColor: kAccentColor,
                          onSelected: (bool selected) {
                            setState(() {
                              _defaultChoiceIndex = selected ? index : 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: <Widget>[
             // BackgroundWidget(size: size),
              BackButtonPop(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.screenHeight*.9,
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70.0,),
                      Padding(
                        padding: const EdgeInsets.only(top:20, left: 50.0, right: 50.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Color(0xFFD7D7D7),
                          valueColor: AlwaysStoppedAnimation<Color>(kAccentColor),
                          value: 0.6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PageTitle(
                          titleText:
                          Strings.labelText5,

                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      selectOption(),
                      SizedBox(height: 50.0,),
                      PageTitle(
                        titleText:
                        Strings.titleText7,
                        fontSize: 24.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                      PageTitle(
                        titleText:
                        Strings.titleText8,
                        fontSize: 15.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        passwordVisible ? Icons.visibility : Icons.visibility_off, color: kAccentColor,),
                                    onPressed: (){
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue[800],
                                    ),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue[900],
                                      width: 2.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(fontSize: 15.0 , color: Colors.blue[900]),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                obscureText: !passwordVisibleConfirm,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        passwordVisibleConfirm ? Icons.visibility  : Icons.visibility_off , color:kAccentColor),
                                    onPressed: (){
                                      setState(() {
                                        passwordVisibleConfirm = !passwordVisibleConfirm;
                                      });
                                    },
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue[800],
                                    ),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue[900],
                                      width: 2.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(color: Colors.blue[900], fontSize: 15.0),
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 12.0),
      //   child: floatingActionButtonNext(
      //       context, MaterialPageRoute(builder: (context) =>JobSearchAll())),
      // ),
      // //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
