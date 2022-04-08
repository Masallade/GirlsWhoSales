import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/training_summary/training_summary.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';


class AddTrainingSummary extends StatefulWidget {
  @override
  _AddTrainingSummaryState createState() => _AddTrainingSummaryState();
}

class _AddTrainingSummaryState extends State<AddTrainingSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(
        context,
        titleText: Strings.trainingSummary,
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Training Title*",
                            labelText: 'Training Title*',
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
                            hintText: "Topic Covered*",
                            labelText: 'Topic Covered*',
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
                            hintText: "Country*",
                            labelText: 'Country*',
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
                            hintText: "Location",
                            labelText: 'Location',
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
                            hintText: "Training Year*",
                            labelText: 'Training Year*',
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
                            hintText: "Duration*",
                            labelText: 'Duration*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      SizedBox(
                        height: 100,
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
      floatingActionButton: floatingActionButtonNext(
          context, MaterialPageRoute(builder: (context) => TrainingSummary())),
     // bottomNavigationBar: BottomInfoBar(),
    );
  }
}
