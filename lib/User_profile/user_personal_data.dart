import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/User_profile/Edit_Profile.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/fullscreen.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;

  EditProfilePage({required this.currentUserDetails});
  @override
  _EditProfilePageState createState() => _EditProfilePageState(currentUserDetails: currentUserDetails);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final CurrentUserDetails currentUserDetails;
  _EditProfilePageState({required this.currentUserDetails});


  TextEditingController dateCtl = TextEditingController();

  // String name;
  // String Phone;
  // String email;
  // String city;



  void initState(){
    super.initState();
    print('${currentUserDetails.user_Id}');
    print('Profile :  ${currentUserDetails.profile}');
    print('${currentUserDetails.uName}');
    print('${currentUserDetails.password}');
    print('City is my profile before edit: ${currentUserDetails.nationality}');
  }

  DateTime? _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date!,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (_date != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 20.0,
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage1(uName: currentUserDetails.uName,password: currentUserDetails.password,  user_Id: currentUserDetails.user_Id,profile: currentUserDetails.profile, userDetails: currentUserDetails.userDetails, country: null, jobDetails: currentUserDetails.jobDetails, city : currentUserDetails.city, nationality :currentUserDetails.nationality)));
              },
              child: Image.asset('assets/images/edit.png' , color: Colors.black,))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: SizeConfig.screenHeight,
                // width:SizeConfig.screenWidth,
                child: ListView.builder(
                    itemCount: currentUserDetails.userDetails!.length == null ? 0 : currentUserDetails.userDetails!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 50,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return FullScreenImage(
                                      imageUrl: currentUserDetails.userDetails![index].profilePicture,
                                      tag: "generate_a_unique_tag",
                                    );
                                  }));
                            },
                            child: Container(
                              // color: Colors.yellow,
                              width:100,
                              height: 100,
                              child: ClipOval(
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.network(currentUserDetails.userDetails![index].profilePicture ?? Placeholder() as String, fit: BoxFit.cover ,width: 100,height: 100,),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text('${currentUserDetails.userDetails![index].firstname ?? ""}' , style: HeadingStyle,),
                          SizedBox(height: 5,),
                          Text('${currentUserDetails.userDetails![index].jobTitle ?? ""}' , style: subtitleStyle,),
                          SizedBox(height: 40,),
                          Container(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Phone' , style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Questrial',
                                      color: Color.fromRGBO(113, 126, 149, 1)
                                  ),),
                                  // Text('${userDetails[index].mobileNumber ?? ""}',
                                  Text('${currentUserDetails.userDetails![index].mobileNumber ?? ""}' ,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Questrial',
                                        color: Color.fromRGBO(34, 34, 34, 1)
                                    ),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                            child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
                          ),
                          Container(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text('Email' , style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Questrial',
                                      color: Color.fromRGBO(113, 126, 149, 1)
                                  ),),
                                  Text('${currentUserDetails.userDetails![index].email ?? ""}' , style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Questrial',
                                      color: Color.fromRGBO(34, 34, 34, 1)
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                            child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
                          ),
                          Container(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Location' , style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Questrial',
                                      color: Color.fromRGBO(113, 126, 149, 1)
                                  ),
                                  ),
                                  Text('${currentUserDetails.userDetails![index].city ?? "Canada"}', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Questrial',
                                      color: Color.fromRGBO(34, 34, 34, 1)
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                            child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
                          ),
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}


