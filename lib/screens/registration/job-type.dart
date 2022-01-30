import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/jobtitle_model.dart';
import 'package:girlzwhosell/model/jobtype_model.dart';
import 'package:girlzwhosell/screens/registration/experice_screen.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;

class JobType extends StatefulWidget {

  String jobtype;
  String selectedJobtitle;
  String Button;
  List<superPowerModel> selecjobsTypes = [];
  List<jobCatagories> selectedJobTitles = [];
  // receive data from the FirstScreen as a parameter
   JobType({Key key,this.jobtype, this.selectedJobtitle,this.Button,this.selecjobsTypes,this.selectedJobTitles}) : super(key: key);

  @override
  _JobTypeState createState() => _JobTypeState(jobtype: jobtype, selectedJobtitle: selectedJobtitle ,Button: Button, selecjobsTypes:selecjobsTypes,selectedJobTitles: selectedJobTitles);
}

class _JobTypeState extends State<JobType> {
  GlobalKey <FormState> _formKey = GlobalKey();
  String jobtype;
  String selectedJobtitle;
  String Button;
  List<superPowerModel> selecjobsTypes = [];
   List<jobCatagories> selectedJobTitles = [];
  _JobTypeState({this.jobtype, this.selectedJobtitle, this.Button,this.selecjobsTypes,this.selectedJobTitles});
  // @override
  // void initState(){
  //   super.initState();
  //   print('jobtype : $jobtype');
  //   // jobTitles();
  //
  // }

//  final _multiSelectKey = GlobalKey<FormFieldState>();

 // List<String> listProvinces=[];
 // jobCatagories _selectedProvince;
  // final _items = _data
  //     .map((animal) => MultiSelectItem<jobCatagories>(animal, animal.title))
  //     .toList();


  // Future<List<jobCatagories>> getProvinceList() async {
  //
  //   final response = await http.get(Uri.parse("https://biitsolutions.co.uk/girlzwhosell/API/job_title.php"));
  //
  //   _data = parseProvinces(response.body);
  //
  //   return parseProvinces(response.body);
  // }
  //
  // List<jobCatagories> parseProvinces(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //
  //   return parsed.map<jobCatagories>((json) => jobCatagories.fromJson(json)).toList();
  // }


  @override
  void initState() {

   // getProvinceList();
    getData();
    setState(() {
      print('lists of selected jobtypes : $Button');
      //print('listOfJob : $selecjobsTypes');
    });

    super.initState();
  }

  static List<jobCatagories> _data = [];
  final url = "https://biitsolutions.co.uk/girlzwhosell/API/job_title.php";
  List data = List(); //List of Responsebody
Future<String> getData() async{
  var res = await http.get(Uri.parse(url));
  var resbody = json.decode(res.body);
  setState(() {
    data = resbody;
  });
  print('jobtitle $resbody');
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
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 30.0,),
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
              child: Column(
                children: [
                  LinearProgressIndicator(
                    minHeight: 10.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                    value: 0.4,
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 280.0),
                    child: Text(
                      '30%',
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
            SizedBox(
              height: 37,
            ),
            Text("You're halfway there!",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: HeadingStyle),
            SizedBox(
              height: 20,
            ),
            Text('Which of these sectors pique\n your curiosity? ',
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
                    "What job are you looking for?",
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
                child: Form(
                  key: _formKey,
                  child: DropdownButtonHideUnderline(
                    child:  ButtonTheme(
                        alignedDropdown: true,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: DropdownButton<String>(
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: new Text('Select Job Title' ,style: TextStyle(
                                    height: 1.5,
                                    fontSize: 16.0,
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),),
                              ),
                              // value:  jobTitle == null ? null : Lists.jobCatagories[jobTitle],
                              value: jobtype,
                              onChanged: (String newvalue) {
                                setState(() {
                                  jobtype = newvalue;
                                });
                                print('newvalue ${jobtype}');
                              },
                              items: data.map((item) {
                                return DropdownMenuItem(child: Row(
                                  children: [
                                    Text('${item["title"]}' , style: TextStyle(
                                        height: 1.5,
                                        fontSize: 16.0,
                                        fontFamily: 'Questrial',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black
                                    ),),
                                  ],
                                ),
                                  value: item["title"].toString(),
                                );
                              }).toList()),
                        )
                    ),
                  ),
                ),
              ),
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
                  if (_formKey.currentState.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExperienceScreen(jobtype: jobtype,selecjobsTypes:selecjobsTypes ,selectedJobTitles: selectedJobTitles,Button: Button,)));
                    print('Successful');

                  } else {
                    print('Try Again');
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