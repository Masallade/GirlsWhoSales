import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/JobLevel.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;

// ignore: must_be_immutable
class entryLevel extends StatefulWidget {
  String jobtypes;
  // receive data from the FirstScreen as a parameter
  entryLevel({Key key,this.jobtypes, }) : super(key: key);

  @override
  _entryLevelState createState() => _entryLevelState(jobtypes: jobtypes,);
}

class _entryLevelState extends State<entryLevel> {
  GlobalKey <FormState> _formKey = GlobalKey();
  String jobtypes;

  _entryLevelState({ this.jobtypes});

  @override
  void initState() {
    getData();
    super.initState();
  }

  final url = "https://biitsolutions.co.uk//girlzwhosell/API/jobtype.php";
  // ignore: deprecated_member_use
  List data = List(); //List of Responsebody



// ignore: missing_return
  Future<String> getData() async{
    var res = await http.get(Uri.parse(url));
    var resbody = json.decode(res.body);
    setState(() {
      data = resbody;
    });
    print('Different job typess $resbody');
  }
  String _dropdownError;

  _validateForm() {
    bool _isValid = _formKey.currentState.validate();

    if (jobtypes == null) {
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
              const EdgeInsets.only(left: 12.0, right: 12.0,top: 45.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      minHeight: 10.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                      value: 0.2,
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 280.0),
                      child: Text(
                        '12%',
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
              height: 37,
            ),
            Text(
                //"Congrats, almost You're there!",
                'Great! Just a few \n more steps to go!',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: HeadingStyle),
            SizedBox(
              height: 20,
            ),
            Text('Please answer the following questions to\n proceed to registration.',
                //'Which of these Job Type pique\n your curiosity? ',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: subtitleStyle),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "What job type are you looking for?",
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
                              child: new Text('Select Job type' ,style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),),
                            ),
                            value: jobtypes,
                            onChanged: (String newvalue) {
                              setState(() {
                                jobtypes = newvalue;
                                _dropdownError = null;
                              });
                              print('newvalue ${jobtypes}');
                            },
                            items: data.map((item) {
                              return DropdownMenuItem(child: Row(
                                children: [
                                  Text('${item["type"]}' , style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),),
                                ],
                              ),
                                value: item["type"].toString(),
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
              height: 120,
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
                  if (jobtypes == null) {
                    _validateForm();
                    print('fail');

                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => jobLevel(jobtypes: jobtypes,)));
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