import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/jobtitle_model.dart';
import 'package:girlzwhosell/model/jobtype_model.dart';
import 'package:girlzwhosell/screens/intro_pages/Registration_page.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';

import 'package:http/http.dart'as http;

// ignore: must_be_immutable
class ExperienceScreen extends StatefulWidget {
  String jobtype;
  String Button;
  String selectedJobtitle;
  String ExperiencenDetail;
  final ValueChanged<dynamic> onSubmit;
  List<superPowerModel> selecjobsTypes = [];
  List<jobCatagories> selectedJobTitles = [];
  ExperienceScreen({this.jobtype,this.Button,this.selectedJobtitle,this.ExperiencenDetail, this.onSubmit,this.selecjobsTypes,this.selectedJobTitles});

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState(
    Button: Button,  jobtype: jobtype,selectedJobtitle: selectedJobtitle, ExperiencenDetail: ExperiencenDetail, onSubmit: onSubmit , selecjobsTypes: selecjobsTypes,selectedJobTitles: selectedJobTitles);
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  // declare a variable to keep track of the input text
  // create a TextEditingController
  TextEditingController fieldControllor= TextEditingController();
  String Button;
  String jobtype;
  String selectedJobtitle;
  String ExperiencenDetail;
  final ValueChanged<String> onSubmit;
  List<superPowerModel> selecjobsTypes = [];
  List<jobCatagories> selectedJobTitles = [];
  _ExperienceScreenState({this.Button,this.jobtype,this.selectedJobtitle,this.ExperiencenDetail, this.onSubmit,this.selecjobsTypes,this.selectedJobTitles,});

  bool isValue = false;
  String _dropdownError;

  _validateForm() {
    bool _isValid = _formKey.currentState.validate();

    if (ExperiencenDetail == null) {
      setState(() => _dropdownError = "Please select an option!");
      _isValid = false;
    }

    if (_isValid) {
      //form is valid
    }
  }
@override
  void initState(){
    super.initState();

   setState(() {
     print('jobtitle : $jobtype');
     print('listofjobtype : $Button');
   });
    getData();
  }


  final url = "https://biitsolutions.co.uk/girlzwhosell/API/experience.php";
  // ignore: deprecated_member_use
  List data = List(); //List of Responsebody
  // ignore: missing_return
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
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
          ),
        ) ,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //BackButtonPop(),
                Image.asset(
                  'assets/images/logo.png',
                  scale: 2.7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 45.0),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        minHeight: 10.0,
                        backgroundColor: Colors.grey[300],
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                        value: 0.6,
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 295.0 ,right: 12.0),
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
                SizedBox(
                  height: 37,
                ),
                Text("Almost there!",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: HeadingStyle),
                SizedBox(
                  height: 20,
                ),
                Text('How experienced are you?',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: subtitleStyle),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                      child: Text(
                        "Your years of experience?",
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 17.0,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Image.asset('assets/images/heart.png'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0,top: 16),
                  child: Container(
                  //  height: 150,
                    width: SizeConfig.screenWidth,
                    height: 70.0,
                    decoration: BoxDecoration(
                    //  color: Colors.yellow,
                   //   border: Border.all(width: 1.0, color: Colors.grey[300]),
                    ),
                    child: GestureDetector(
                      onTapDown: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: Column(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.grey[300])),
                            child: DropdownButtonHideUnderline(
                              child:  ButtonTheme(
                                alignedDropdown: true,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: new Text('Select Experience' ,style: TextStyle(
                                          height: 1.5,
                                          fontSize: 16.0,
                                          fontFamily: 'Questrial',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      )),
                                    ),
                                    // value:  jobTitle == null ? null : Lists.jobCatagories[jobTitle],
                                    value: ExperiencenDetail,
                                    onChanged: (String newvalue) {
                                      setState(() {
                                        ExperiencenDetail = newvalue;
                                        _dropdownError = null;
                                      });
                                      print('newvalue ${ExperiencenDetail}');
                                    },
                                      items: data.map((item) {
                                        return DropdownMenuItem(
                                          child: Row(
                                          children: [
                                            Text('${item["experience"]}',style: TextStyle(
                                                height: 1.5,
                                                fontSize: 16.0,
                                                fontFamily: 'Questrial',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black
                                            )),
                                          ],
                                        ),
                                          value: item["id"].toString(),
                                        );
                                      }).toList()),
                                )
                                ),
                              ),
                            ),
                        ],
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
                  padding: const EdgeInsets.only( left: 12, right: 12),
                  child: Container(
                    // width:SizeConfig.screenWidth,
                    width: SizeConfig.screenWidth,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color:  Colors.red[100],
                      color: Color.fromARGB(255, 255, 65, 129),
                      borderRadius: BorderRadius.circular(5.0),
                      // border: Border.all(color: Theme.of(context).accentColor)),
                    ),
                    child: GestureDetector(
                      // only enable the button if the text is not empty
                      onTap: () async {
                        if (ExperiencenDetail == null ) {
                          _validateForm();
                          print('ExperiencenDetail Succeffull $ExperiencenDetail');
                          print('fail');

                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage(jobtype:jobtype ,ExperiencenDetail: ExperiencenDetail,Button: Button,)));
                          print('Successful');
                        }
                      },
                      child: ListTile(
                        title: Center(
                          child: GestureDetector(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
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
          ),
        ),
      ),
    );
  }
}