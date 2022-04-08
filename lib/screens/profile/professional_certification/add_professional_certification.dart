import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/professional_certification/professional_certification_null.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';



class AddProfessionalCertification extends StatefulWidget {
  @override
  _AddProfessionalCertificationState createState() =>
      _AddProfessionalCertificationState();
}

class _AddProfessionalCertificationState
    extends State<AddProfessionalCertification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(
        context,
        titleText: Strings.professionalCertification,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Certification Title*",
                            labelText: 'Certification Title*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Institute Name*",
                            labelText: 'Institute Name*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Location*",
                            labelText: 'Location*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: floatingActionButtonNext(
          context, MaterialPageRoute(builder: (context) => ProfessionalCertificationNull())),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
