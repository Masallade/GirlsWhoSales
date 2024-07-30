import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/jobtitle_model.dart';
import 'package:girlzwhosell/model/jobtype_model.dart';
import 'package:girlzwhosell/screens/registration/experice_screen.dart';
import 'package:girlzwhosell/screens/registration/job-type.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;

// ignore: must_be_immutable
class industryLevel extends StatefulWidget {
  String industry;
  String jobtypes;
  String jobtype;
  String joblevel;
  String selectedJobtitle;
  String Button;
  final String userId;
  // receive data from the FirstScreen as a parameter
  industryLevel({Key key,this.industry, this.jobtypes, this.jobtype, this.joblevel, this.selectedJobtitle,this.Button ,this.userId}) : super(key: key);

  @override
  _industryLevelState createState() => _industryLevelState(industry: industry, jobtypes: jobtypes, jobtype: jobtype,joblevel: joblevel, selectedJobtitle: selectedJobtitle ,Button: Button, userId: userId);
}

class _industryLevelState extends State<industryLevel> {
  GlobalKey <FormState> _formKey = GlobalKey();
  String industry;
  String jobtypes;
  String jobtype;
  String joblevel;
  String selectedJobtitle;
  String Button;
final String userId;
  _industryLevelState({ this.industry ,this.jobtypes, this.jobtype,this.joblevel, this.selectedJobtitle, this.Button ,this.userId});

  @override
  void initState() {

    getData();
    setState(() {
      print('=================INDUSTRY Page ================');
      print('selected joblevel : $joblevel');
      print("userId is $userId");
      print('selected jobtypes : $jobtypes');
      print('lists of selected categories : $Button');

    });

    super.initState();
  }

  final url = "https://biitsolutions.co.uk//girlzwhosell/API/job_industries.php";
  // ignore: deprecated_member_use
  List data = List(); //List of Responsebody



// ignore: missing_return
  Future<String> getData() async{
    var res = await http.get(Uri.parse(url));
    var resbody = json.decode(res.body);
    setState(() {
      data = resbody;
    });
    print('industry types $resbody');
  }
  String _dropdownError;

  _validateForm() {
    bool _isValid = _formKey.currentState.validate();

    if (industry == null) {
      setState(() => _dropdownError = "Please select an option!");
      _isValid = false;
    }

    if (_isValid) {
      //form is valid
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon( Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
        ),
      ) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27.5,right: 27.5),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 2.7,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 12.0, right: 12.0,top: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      minHeight: 10.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                      value: 0.5,
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 280.0),
                      child: Text(
                        '45%',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("You're halfway there!",//You're just \n two step away!
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: HeadingStyle),
            SizedBox(
              height: 10,
            ),
            Text('Which of these Industries pique\n your curiosity? ',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: subtitleStyle),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Which industry type are you looking for?",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 17.0,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      /* letterSpacing: 0.0, */
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/heart.png'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0 ,right: 12.0,top: 16),
              child: Container(
                width: SizeConfig.screenWidth,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6))),
                child: DropdownButtonHideUnderline(
                  child:  ButtonTheme(
                      alignedDropdown: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: DropdownButton<String>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: new Text('Select industry' ,style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),),
                            ),
                            value: industry,
                            onChanged: (String newvalue) {
                              setState(() {
                                industry = newvalue;
                                _dropdownError = null;
                              });
                              print('newvalue ${industry}');
                            },
                            items: data.map((item) {
                              return DropdownMenuItem(child: Row(
                                children: [
                                  Text('${item["name"]}' , style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),),
                                ],
                              ),
                                value: item["name"].toString(),
                              );
                            }).toList()),
                      )
                  ),
                ),
              ),
            ),

            _dropdownError == null
                ? SizedBox.shrink()
                : Text(
              _dropdownError ?? "",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(SizeConfig.screenWidth, 60.0),
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
                  if (industry == null) {
                    _validateForm();
                    print('fail');

                  } else {
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => JobType(industry: industry,jobtype: jobtype,jobtypes: jobtypes,joblevel: joblevel, Button:Button)));
                    print('Success');
                  }


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}