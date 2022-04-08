import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';
import 'add_professional_certification.dart';


class ProfessionalCertificationNull extends StatefulWidget {
  @override
  _ProfessionalCertificationNullState createState() =>
      _ProfessionalCertificationNullState();
}

class _ProfessionalCertificationNullState
    extends State<ProfessionalCertificationNull> {
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
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DottedBorder(
                        padding: EdgeInsets.all(4),
                        dashPattern: [9, 5],
                        child: Container(
                          height: 300,
                          width: double.maxFinite,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Add Professional Certification Summary',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddProfessionalCertification()));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
