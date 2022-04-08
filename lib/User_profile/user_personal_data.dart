// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class EditProfilePage extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final profile;
  final List<SeekerDetails> userDetails;
  final String firstName;
  EditProfilePage({this.uName,this.password,this.user_Id,this.profile, this.userDetails,this.firstName });
  @override
  _EditProfilePageState createState() =>
      _EditProfilePageState(uName:uName,password: password, user_Id: user_Id,profile: profile, userDetails: userDetails);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final uName;
  final password;
  final user_Id;
  final profile;
  final List<SeekerDetails> userDetails;
  _EditProfilePageState({this.uName,this.password, this.user_Id,this.profile, this.userDetails});



  TextEditingController dateCtl = TextEditingController();

  String name;
  String Phone;
  String email;
  String city;



  void initState(){
    super.initState();
    print('$user_Id');
    print('$profile');
    print('$uName');
    print('$password');
  }

  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage1(uName: uName,password: password, user_Id: user_Id,profile: profile, userDetails: userDetails,)));
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
                    itemCount: userDetails.length == null ? 0 : userDetails.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 50,),
                          Container(
                           // color: Colors.yellow,
                            width:100,
                            height: 100,
                            child: ClipOval(
                              child: CircleAvatar(
                               backgroundColor: Colors.transparent,
                                child: Image.network(userDetails[index].profilePicture ?? Placeholder(), fit: BoxFit.cover ,width: 100,height: 100,),
                              ),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text('${userDetails[index].firstname ?? ""}' , style: HeadingStyle,),
                          SizedBox(height: 5,),
                          Text('${userDetails[index].jobTitle ?? ""}' , style: subtitleStyle,),
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
                                  Text('${userDetails[index].mobileNumber ?? ""}' , style: TextStyle(
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
                                  Text('${userDetails[index].email ?? ""}' , style: TextStyle(
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
                                  ),),
                                  Text('${userDetails[index].city ?? ""}' , style: TextStyle(
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


class EditProfilePage1 extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final profile;
  final List<SeekerDetails> userDetails;
  final String firstName;
  EditProfilePage1({this.uName,this.password,this.user_Id,this.profile, this.userDetails ,this.firstName});
  @override
  _EditProfilePage1State createState() =>
      _EditProfilePage1State(uName:uName,password: password, user_Id: user_Id,profile: profile, userDetails: userDetails, firstName: firstName);
}

class _EditProfilePage1State extends State<EditProfilePage1> {
  final uName;
  final password;
  final user_Id;
  final String profile;
  final List<SeekerDetails> userDetails;
  final String firstName;
  bool showPassword = false;
  _EditProfilePage1State({this.uName,this.password, this.user_Id,this.profile, this.userDetails,this.firstName ,this.image});
  TextEditingController controller = new TextEditingController();


  BuildContext context;

  GlobalKey<FormState> formKey = GlobalKey();


  String name;
  String Phone;
  String email;
  String city;


  String status = '';

  File tmpFile;
  String errMessage = 'Error Uploading Slip';

  String uploadurl = base_url + "user_update.php";

  Response response;
  String progress;
  Dio dio = Dio();


  String base64Image;

  void initState(){
    super.initState();
    print('$user_Id');
    print('$uName');
    print('$password');
   // print(_date);
  }

  File image;

  Future pickImage(ImageSource source ) async {

    try{
      final image = await ImagePicker.platform.pickImage(source: source);
      if(image == null )return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      print('image is Permamnent : $imagePermanent');
      setState(()=> this.image = imagePermanent);
    } catch (e){
      print('Failed To pickImage : ${e.toString()}');
    }
  }

  File _image;
  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile == null){
        return 'image.jpg';
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
      if(pickedFile == null){
        return 'image.jpg';
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
                      // pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future <File> saveImagePermanently (String imagepath) async{
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1

    final name = basename(imagepath);
    final image = File("${appDocumentsDirectory.path}/$name");
    print('$image');
    return File(imagepath).copy(image.path);

  }

  uploadResume(context) async {

    try {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        var dio = new Dio();
        var formData = FormData.fromMap({
          "id": user_Id,
          "firstname": name,
          "email": email,
          "city": city,
          "mobile_no": Phone,
          "profile_picture": await MultipartFile.fromFile(_image.path,
           filename: basename( _image.path),
          ),
        });
        response = await dio.post(uploadurl,
          data: formData,
          onSendProgress: (int sent, int total) {
            String percentage = (sent / total * 100).toStringAsFixed(2);
            setState(() {
              // progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
              progress = " " " " + percentage + " % uploading";
              //update the progress
            });
          },
        );
        if (response.statusCode == 200) {
          print('image  $_image');
          print(response.data);
            Requests.ProfileLogin(context, uName, password, 'token', false).whenComplete(() =>
                showToast('Profile has been Updated Successfully',
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
            ));
        }
      }
    } catch(e){
      print(e.toString());
    }
  }


  // DateTime _date = DateTime.now();
  // Future<Null> selectDate(BuildContext context) async {
  //    DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: _date,
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2100),
  //   );
  //   if (_date != null && picked != _date) {
  //     setState(() {
  //       _date = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
//    String _formatDate = DateFormat.yMMMd().format(_date);
    return Scaffold(
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
          key:formKey,
          child: Column(
            children: [
              Container(
                  height: SizeConfig.screenHeight,
                  child: ListView.builder(
                      itemCount: userDetails.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                          child: Column(
                            children: [
                              SizedBox(height: 70,),
                              Center(
                                child: Stack(
                                  children: [
                                    _image != null ? ClipOval(
                                      child: Image.file(
                                        _image,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                     : Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 4,
                                              color: Theme.of(context).scaffoldBackgroundColor),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black.withOpacity(0.1),
                                                offset: Offset(0, 10))
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                userDetails[index].profilePicture ?? Placeholder(),
                                              ))),
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
                                              color: Theme.of(context).scaffoldBackgroundColor,
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
                              SizedBox(height: 30,),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                                initialValue:userDetails[index].firstname,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  hintText: 'Name',
                                ),
                                onChanged: (String value){
                                  setState(() {
                                    name = value;
                                  });
                                  print('fisrtname is :$name');
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                                initialValue: '${userDetails[index].mobileNumber}' ,
                                keyboardType: TextInputType.phone,
                                onChanged: (String value){
                                  setState(() {
                                    Phone = value;
                                    print('city: $Phone');
                                  });
                                },

                                decoration: InputDecoration(
                                  //  suffixText: '${userDetails[index].mobileNumber}',
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    hintText: 'Phone',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Questrial',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[300],
                                    )),
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                              initialValue: userDetails[index].email,

                                onChanged: (String value){
                                  setState(() {
                                    email = value;
                                  });
                                  print('email is :$email');
                                },

                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Questrial',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[300],
                                    )),
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                cursorColor: Colors.pinkAccent[200],
                                // controller: cityController,
                               initialValue: userDetails[index].city,

                                onChanged: (String value){
                                  setState(() {
                                    city = value;
                                    print('city: $city');
                                  });
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    hintText: 'Location',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Questrial',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[300],
                                    )),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Container(
                                width:SizeConfig.screenWidth,
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
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'Update',
                                          style:  TextStyle(
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
