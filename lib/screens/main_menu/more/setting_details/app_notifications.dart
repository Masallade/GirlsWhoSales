import 'package:flutter/material.dart';


class AppNotifications extends StatefulWidget {
  @override
  _AppNotificationsState createState() => _AppNotificationsState();
}

class _AppNotificationsState extends State<AppNotifications> {

  bool value1 =  true;
  bool value2 = false;
  bool value3 = true;
  bool value4 = false;
  bool value5 = true;

  void onChangedValue(bool value){
    setState(() {
      value1 = value;
    });
  }

  void onChangedValue2(bool value){
    setState(() {
      value2 = value;
    });
  }

  void onChangedValue3(bool value){
    setState(() {
      value3 = value;
    });
  }

  void onChangedValue4(bool value){
    setState(() {
      value4 = value;
    });
  }

  void onChangedValue5(bool value){
    setState(() {
      value5 = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Notifications'),
        backgroundColor: Colors.red[200],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              /*leading: Image.asset(
                'assets/images/CST.png',
                color: Colors.blueAccent,
              ),*/
              leading: Icon(Icons.donut_small, color: Theme.of(context).primaryColor),
              title: Text(
                  'Job Portal',
              style: TextStyle(fontWeight: FontWeight.bold)
              ),
              trailing: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SwitchListTile(
                value: value1,
                onChanged: onChangedValue,
                activeColor: Colors.red[200],
                title: Text(
                  'Allow notifications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Allow notifications from this app, including nofication '
                        'messages, sounds and vibration'
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SwitchListTile(
                value: value2,
                onChanged: onChangedValue2,
                activeColor: Colors.red[200],
                title: Text(
                  'Set as priority',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Show notifications at the top of the notification panel'
                        ' and include them in the allowed list while do not '
                        'disturb mode is on.'
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SwitchListTile(
                value: value3,
                onChanged: onChangedValue3,
                activeColor: Colors.red[200],
                title: Text(
                  'Preview in pop-ups',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Shows previews of notifications in pop-ups at the top of'
                        ' the screen.'
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SwitchListTile(
                value: value4,
                onChanged: onChangedValue4,
                activeColor: Colors.red[200],
                title: Text(
                  'Hide on lock screen',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Hide notifications from this app while the device is locked.'
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SwitchListTile(
                value: value5,
                onChanged: onChangedValue5,
                activeColor: Colors.red[200],
                title: Text(
                  'Hide content on lock screen',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Hide notifications content from this app while the device is locked.'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
