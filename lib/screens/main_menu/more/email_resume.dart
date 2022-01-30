import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TimesEmailResume extends StatefulWidget {
  @override
  _TimesEmailResumeState createState() => _TimesEmailResumeState();
}

class _TimesEmailResumeState extends State<TimesEmailResume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Times Email Resume'),
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
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                        '1',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'times Emailed Resume',
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
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: ListTile(
                            title: Text(
                              'career@cibl-bd.com',
                              style: TextStyle(
                                color: Colors.lightBlue,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                ),
                                Text(
                                    'Web: PHP, Javascript, WEB API,'
                                        ' (REST/SOAP), Git',
                                  style: TextStyle(fontSize: 16,color: Colors.black),
                                ),
                                SizedBox(height: 8),
                                Text(
                                    '01/27/2020',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.pink,
              ),
              child: Text(
                'New Email Resume',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
