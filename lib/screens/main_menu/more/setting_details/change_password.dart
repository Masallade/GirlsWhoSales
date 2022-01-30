import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() =>
      _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Change Password'),
        backgroundColor: Colors.red[200],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[

                      Text(
                        'User ID',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'codesolution101@gmail.com',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Old Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: IconButton(
                              onPressed:(){},

                              icon: Icon(Icons.visibility_off),
                            )
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.visibility_off),
                            )
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.visibility_off),
                            )
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.check,
          size: 40.0,
        ),
      ),
    );
  }
}