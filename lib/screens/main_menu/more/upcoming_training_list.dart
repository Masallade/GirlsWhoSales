import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TrainingList extends StatefulWidget {
  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Training List'),
        backgroundColor: Colors.red[200],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                margin:
                EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                color: Colors.white,
                elevation: 5.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Total Number of Trainings',
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.group_add, color: Colors.blueAccent),
                            SizedBox(width: 10),
                            Text('25',style: TextStyle(color: Colors.blueAccent))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: (){},
                                child: Text(
                                  'Suggested',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.pink,
                              )
                          ),
                          Expanded(
                            // ignore: deprecated_member_use
                            child: FlatButton(
                                onPressed: (){},
                                child: Text(
                                    'All',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                                )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading:
                            Icon(Icons.laptop_chromebook),
                            title: Text(
                                'Certificate Course on Global Export-Import Business ',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(
                                'BdJobs Training,BDBL Building(Lavel 19),'
                                    '12 kawran Bazar C/A,Dhaka-1215',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading:
                              Icon(Icons.date_range),
                              title: Text('Date: 6 Feb - 20 mar 2020'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.laptop_chromebook),
                            title: Text(
                                'L/C Procedures for Import & Export With'
                                    ' Practical Exercise',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(
                                  'A.K.Arcade (2nd Floor),771,Sheikh Mujib Road,'
                                      'Choumuhoni Circle,Chattogram'
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading: Icon(Icons.date_range),
                              title: Text('Date: Friday,February 7,2020'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.laptop_chromebook),
                            title: Text(
                                'Certificate Course on Global'
                                    ' Export-Import Business',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(
                                'BdJobs Training,BDBL Building(Lavel 19),'
                                    '12 kawran Bazar C/A,Dhaka-1215',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading:
                              Icon(Icons.date_range),
                              title: Text('Date: 6 Feb - 20 mar 2020'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.laptop_chromebook),
                            title: Text(
                                'Certificate Course on Global'
                                    ' Export-Import Business',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(
                                'BdJobs Training,BDBL Building(Lavel 19),'
                                    '12 kawran Bazar C/A,Dhaka-1215',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: ListTile(
                              leading:
                              Icon(Icons.date_range),
                              title: Text('Date: 6 Feb - 20 mar 2020'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
