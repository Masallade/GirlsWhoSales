import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/training_summary/add_training_summary.dart';
import 'package:girlzwhosell/screens/profile/training_summary/training_summary_null.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';


class TrainingSummary extends StatefulWidget {
  @override
  _TrainingSummaryState createState() => _TrainingSummaryState();
}

class _TrainingSummaryState extends State<TrainingSummary> {
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 350,
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
                                leading:
                                    Icon(Icons.laptop_chromebook, size: 50),
                                title: Text('Graphics and Web UI Design',
                                    style: TextStyle(
                                        color: Colors.teal, fontSize: 25)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '◘ Topic Covered: Logo Design, UI Design, Cliping Path, Flayer Design etc.',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(),
                                    Text(
                                      '◘ Institute Name: BITM',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(),
                                    Text(
                                      '◘ Country: Bangladesh',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(),
                                    Text(
                                      '◘ Location: Kawran Bazar',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(),
                                    Text(
                                      '◘ Training Year: 2019',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(),
                                    Text(
                                      '◘ Duration: 3 Months',
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
                                                          AddTrainingSummary()));
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
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: floatingActionButtonNext(
          context, MaterialPageRoute(builder: (context) => TrainingSummaryNull())),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
