import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/references/add_references.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';



class ReferencesNull extends StatefulWidget {
  @override
  _ReferencesNullState createState() => _ReferencesNullState();
}

class _ReferencesNullState extends State<ReferencesNull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(
        context,
        titleText: Strings.references,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: DottedBorder(
                        padding: EdgeInsets.all(4),
                        dashPattern: [9, 5],
                        child: Container(
                          height: 300,
                          width: double.maxFinite,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Add References',
                                style: TextStyle(fontSize: 30),
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
                                               AddReferences()));
                                  })
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
