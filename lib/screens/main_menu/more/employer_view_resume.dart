import 'package:flutter/material.dart';


class EmployerViewResume extends StatefulWidget {
  @override
  _EmployerViewResumeState createState() => _EmployerViewResumeState();
}

class _EmployerViewResumeState extends State<EmployerViewResume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Employer Viewed Resume'),
        backgroundColor: Colors.red[200],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
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
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          '110',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Employers viewed my Resume',
                          style: TextStyle(
                            color:Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              SingleChildScrollView(
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
                            title: Text(
                              'The ACME Laboratories Limited',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.date_range, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text('Viewed on:8/28/2020',
                                    style: TextStyle(color: Colors.black54,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            trailing: Icon(Icons.done_all),
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
                            title: Text(
                              'Kallol Group of Companies',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.date_range, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text('Viewed on:7/8/2020',
                                    style: TextStyle(color: Colors.black54,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            trailing: Icon(Icons.done),
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
                            title: Text(
                              'Eye-Cone International',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.date_range, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text('Viewed on:7/2/2020',
                                    style: TextStyle(color: Colors.black54,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            trailing: Icon(Icons.done),
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
                            title: Text(
                              'Telnet Centric Limited',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.date_range, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text('Viewed on:12/2/2020',
                                    style: TextStyle(color: Colors.black54,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            trailing: Icon(Icons.done_all),
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
                            title: Text(
                              'iVenture Limited',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.date_range, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text('Viewed on:11/01/2020',
                                    style: TextStyle(color: Colors.black54,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            trailing: Icon(Icons.done),
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
                            title: Text(
                              'Uber Technologies',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.date_range, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text('Viewed on:11/2/2020',
                                    style: TextStyle(color: Colors.black54,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            trailing: Icon(Icons.done),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ListTile(
                onTap: (){},
                title: Row(
                  children: <Widget>[
                    Icon(Icons.check,size: 15.0),
                    Text(
                        'Summerey resume view',
                        style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                onTap: (){},
                title: Row(
                  children: <Widget>[
                    Icon(Icons.done_all,size: 15.0),
                    Text(
                        'Detail resume view',
                        style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold)
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
