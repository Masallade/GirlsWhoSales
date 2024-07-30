import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/model/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import '../model/profileUpdate.dart';

class EditProfilePage1 extends StatefulWidget {
  final country;
  String nationality;
  final uName;
  final password;
  final user_Id;
  final profile;
  final city;
  final List<SeekerDetails> userDetails;
  final List<JobDetails> jobDetails;
  final String firstName;

  EditProfilePage1(
      {this.uName,
        this.city,
        this.nationality,
        this.jobDetails,
      this.password,
      this.user_Id,
      this.profile,
      this.userDetails,
      this.firstName,
      this.country});
  @override
  _EditProfilePage1State createState() => _EditProfilePage1State(
      uName: uName,
    nationality : nationality,
      password: password,
      user_Id: user_Id,
      userDetails: userDetails,
      jobDetails: jobDetails,
      profile: profile,
      firstName: firstName,
      country: country,
    city : city,
  );
}

class _EditProfilePage1State extends State<EditProfilePage1> {
  String country;
  final uName;
  String nationality;
  final password;
  final user_Id;
  final String profile;
  final String city;
  final List<SeekerDetails> userDetails;
  final List<JobDetails> jobDetails;
  final String firstName;
  bool showPassword = false;

  _EditProfilePage1State(
      {this.uName,
      this.password,
      this.user_Id,
      this.profile,
        this.city,
        this.nationality,
      this.userDetails,
      this.firstName,
      this.country,
      this.jobDetails});

  BuildContext context;

  GlobalKey<FormState> formKey = GlobalKey();

  String name;
  String nation;
  String Phone;
  String email;
  String cityN;
  File _image;


  List cityUsa = ['Baltimore', 'NewYork', 'Virginia'];
  String cityNamex;

  String uploadurl =
      'https://girlzwhosellcareerconextions.com/API/' + "user_update.php";

  Response response;
  String progress;
  Dio dio = Dio();

  void initState() {
    super.initState();
    print('$user_Id');
    print('$uName');
    print('$password');
    print('Cityyyyyyyyyyyyy: $nationality');
  }


  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile == null) {
        _image = File('image.png');
      }
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile == null) {
        _image = File('image.png');
      }
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,
                          color: Colors.pinkAccent[200]),
                      title: new Text('Gallery',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 17.0,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                          )),
                      onTap: () {
                        //  pickImage(ImageSource.gallery);
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: Colors.pinkAccent[200],
                    ),
                    title: new Text('Camera',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 17.0,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                          /* letterSpacing: 0.0, */
                        )),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

   uploadResume(context) async {
    print('You press update');
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      utils.showLoadingDialog(context, _keyLoader);

        formKey.currentState.save();
        var dio = new Dio();
        var formData = FormData.fromMap({
          "id": user_Id,
          "firstname": name,
          "profile_picture": await

          _image==null ? profile :
              await

          MultipartFile.fromFile(_image.path, filename: basename(_image.path)),
          "city": cityN,
          "mobile_no": Phone,
        });

        print('cityzaitoon1 : $cityN');
        response = await dio.post(
          uploadurl,
          data: formData,
          onSendProgress: (int sent, int total) {
            String percentage = (sent / total * 100).toStringAsFixed(2);
            setState(() {
              progress = " " " " + percentage + " % uploading";
              //update the progress
            });
          },
        );

        if (response.statusCode == 200) {
          print('cityzaitoon1 : $cityN');
          print('You press update status is 200');
          print('image  $_image');
          print(response.data);

          Requests.ProfileLogin(context, uName, password, 'token', false);


          // Requests.ProfileLogin(context, uName, password, 'token', false);
           profileUpdate = ProfileUpdate.fromJson(json.decode(response.data));
          return profileUpdate;

        } else {
          showToast(
            'Failed to Update',
            context: context,
            fullWidth: true,
            backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
            animation: StyledToastAnimation.slideFromBottomFade,
            reverseAnimation: StyledToastAnimation.fade,
            position: StyledToastPosition.center,
            animDuration: Duration(seconds: 2),
            duration: Duration(seconds: 4),
            curve: Curves.elasticOut,
            reverseCurve: Curves.linear,
          );
        }

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
//    String _formatDate = DateFormat.yMMMd().format(_date);
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
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 20.0,
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                  height: SizeConfig.screenHeight,
                  child: ListView.builder(
                      itemCount: userDetails.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Center(
                                child: Stack(
                                  children: [
                                    ClipOval(
                                      child: _image != null
                                          ? Image.file(
                                              _image,
                                              width: 160,
                                              height: 160,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              width: 130,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Theme.of(context)
                                                          .scaffoldBackgroundColor),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        spreadRadius: 2,
                                                        blurRadius: 10,
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset: Offset(0, 10))
                                                  ],
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        userDetails[index]
                                                                .profilePicture ??
                                                            Placeholder(),
                                                      ))),
                                            ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 4,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                            color: Colors.pinkAccent[200],
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              _showPicker(context);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                                initialValue: userDetails[index].firstname,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  hintText: 'Name',
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    name = value;
                                  });
                                  print('fisrtname is :$name');
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                                initialValue:
                                    '${userDetails[index].mobileNumber}',
                                keyboardType: TextInputType.phone,
                                onChanged: (String value) {
                                  setState(() {
                                    Phone = value;
                                    print('Phone: $Phone');
                                  });
                                },
                                decoration: InputDecoration(
                                    //  suffixText: '${userDetails[index].mobileNumber}',
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: 'Phone',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Questrial',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[300],
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                                initialValue: '${userDetails[index].city}',
                                keyboardType: TextInputType.text,
                                onChanged: (String value) {
                                  setState(() {
                                    cityN = value;
                                    print('State : $cityN');
                                  });
                                },
                                decoration: InputDecoration(
                                  //  suffixText: '${userDetails[index].mobileNumber}',
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    hintText: 'Loc',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Questrial',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[300],
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: SizeConfig.screenWidth,
                                height: 55.0,
                                decoration: BoxDecoration(
                                  color: Colors.pinkAccent[200],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    uploadResume(context);
                                  },
                                  child: ListTile(
                                    title: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'Update',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
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
// Padding(
//                                   padding: const EdgeInsets.only(left: 0, top: 16),
//                                   // padding: EdgeInsets.only(left: 0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 10),
//                                             child: Icon(Icons.location_on_outlined,
//                                               size: 25,
//                                               color: Color.fromARGB(255, 112, 126, 148),),
//                                           ),
//                                           Text('Location',
//                                             style: TextStyle(
//                                               fontSize: 20.0,
//                                               fontFamily: 'Questrial',
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromARGB(255, 112, 126, 148),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Container(
//                                           child: Container(
//                                             child: GestureDetector(
//                                               onTapDown: (_) =>
//                                                   FocusManager.instance.primaryFocus?.unfocus(),
//                                               child: Container(
//                                                 // width: SizeConfig.screenWidth,
//                                                 height: 58,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.circular(5.0),
//                                                     border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6),)),
//                                                 child: DropdownButtonHideUnderline(
//                                                   child:  ButtonTheme(
//                                                       alignedDropdown: true,
//                                                       child: DropdownButton<String>(
//                                                           hint: new Text('Select State' ,style: TextStyle(
//                                                             height: 1.5,
//                                                             fontSize: 16.0,
//                                                             fontFamily: 'Questrial',
//                                                             fontWeight: FontWeight.w400,
//                                                             color: Color.fromARGB(255, 112, 126, 148),
//                                                           )),
//                                                           // value:  jobTitle == null ? null : Lists.jobCatagories[jobTitle],
//                                                           value: cityNamex,
//                                                           onChanged: (String newvalue) {
//                                                             setState(() {
//                                                               cityNamex = newvalue;
//                                                               // _dropdownError = null;
//                                                             });
//                                                             print('Select City ${cityNamex}');
//                                                           },
//                                                           items: cityUsa.map((item) {
//                                                             return DropdownMenuItem(
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text('${item.toString()}',style: TextStyle(
//                                                                     height: 1.5,
//                                                                     fontSize: 16.0,
//                                                                     fontFamily: 'Questrial',
//                                                                     fontWeight: FontWeight.w400,
//                                                                     color: Color.fromARGB(255, 112, 126, 148),
//                                                                   )
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               value: item.toString(),
//                                                             );
//                                                           }).toList())
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                               ),
