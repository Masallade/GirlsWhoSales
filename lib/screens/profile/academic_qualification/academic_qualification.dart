import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/academic_qualification/academic_qualification_null.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';
import 'add_academic_qualification.dart';

class AcademicQualification extends StatefulWidget {
  @override
  _AcademicQualificationPage3State createState() =>
      _AcademicQualificationPage3State();
}

class _AcademicQualificationPage3State extends State<AcademicQualification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(context, titleText: Strings.academicQualification,),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight*.7,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.school, size: 50),
                          title: Text('BSc',
                              style: TextStyle(
                                  color: Colors.teal, fontSize: 25)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '◘ Electrical and Electronic Engineering',
                                style: TextStyle(fontSize: 18),
                              ),
                              Divider(),
                              Text(
                                '◘ Institute Name: Atish Dipankar University',
                                style: TextStyle(fontSize: 18),
                              ),
                              Divider(),
                              Text(
                                '◘ Result: 3.39 out of 4.0',
                                style: TextStyle(fontSize: 18),
                              ),
                              Divider(),
                              Text(
                                '◘ Passing Year: 2017',
                                style: TextStyle(fontSize: 18),
                              ),
                              Divider(),
                              Text(
                                '◘ Duration: 4 Years',
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddAcademicQualification()));
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        size: 30,
                                      ),
                                      onPressed: null)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: floatingActionButtonNext(context,
          MaterialPageRoute(builder: (context) => AcademicQualificationNull())),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
