import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/profile/profile_details/upload_photo.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';

import 'edit_personal_details.dart';

class PersonalDetail extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String dob;
  final String religion;
  final String gender;
  final String maritalStatus;
  final String nationality;
  final String nid;



  final List<SeekerDetails> userDetails;




  const PersonalDetail({Key key, this.userDetails, this.firstName, this.lastName, this.fatherName, this.motherName, this.dob, this.religion, this.gender, this.maritalStatus, this.nationality, this.nid}) : super(key: key);

  @override
  _PersonalDetailState createState() => _PersonalDetailState(this.userDetails);
}

class _PersonalDetailState extends State<PersonalDetail> {


  final List<SeekerDetails> userDetails;

  _PersonalDetailState(this.userDetails);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header2(
        context,
        titleText: Strings.personalDetails,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPersonalDetails(userDetails: userDetails)));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: FloatingActionButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPhotoPage()));
                      },
                      child: Icon(
                        Icons.person_add,
                        size: 80.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                    title: Text('Code Solution', textAlign: TextAlign.center),
                    subtitle: Text('info@codesolution101.com',
                        textAlign: TextAlign.center)),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Father's Name",
                              icon: Icons.person,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.fatherName,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Mother's Name",
                              icon: Icons.person,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.motherName,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Date of Birth",
                              icon: Icons.calendar_today,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.dob,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Religion",
                              icon: Icons.featured_video,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.religion,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Gender",
                              icon: Icons.supervisor_account,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.gender,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Marital Status",
                              icon: Icons.loyalty,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.maritalStatus,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "Nationality",
                              icon: Icons.flag,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.nationality,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: FieldTitleWithIcon(
                              title: "National ID No.",
                              icon: Icons.contact_mail,
                            ),
                          ),
                          ProfileInputField(
                            initValue: widget.nid,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
