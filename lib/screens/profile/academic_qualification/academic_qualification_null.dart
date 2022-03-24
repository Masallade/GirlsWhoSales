import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/academic_qualification/add_academic_qualification.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';


class AcademicQualificationNull extends StatefulWidget {
  @override
  _AcademicQualificationNullState createState() =>
      _AcademicQualificationNullState();
}

class _AcademicQualificationNullState extends State<AcademicQualificationNull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(context, titleText: Strings.academicQualification),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DottedBorder(
                        padding: EdgeInsets.all(4),
                        dashPattern: [9, 5],
                        child: Container(
                          height: 250,
                          width: double.maxFinite,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Add Academic Qualificaton',
                                style: TextStyle(fontSize: 25),
                              ),
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddAcademicQualification()));
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
