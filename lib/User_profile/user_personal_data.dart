import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/edit_profile_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/utils.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;


class EditProfilePage extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final List<SeekerDetails> userDetails;
  EditProfilePage({this.uName,this.password,this.user_Id, this.userDetails });
  @override
  _EditProfilePageState createState() =>
      _EditProfilePageState(uName:uName,password: password, user_Id: user_Id, userDetails: userDetails);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final uName;
  final password;
  final user_Id;
  final List<SeekerDetails> userDetails;
  _EditProfilePageState({this.uName,this.password, this.user_Id, this.userDetails});



  TextEditingController dateCtl = TextEditingController();

  String name;
  String Phone;
  String email;
  String city;



  void initState(){
    super.initState();
    print('$user_Id');
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage1(uName: uName,password: password, user_Id: user_Id,userDetails: userDetails,)));
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
                    itemCount: userDetails.length,
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
                                child: Image.network(userDetails[index].profilePicture ?? Image.asset('assets/images/splashlogo.png'), fit: BoxFit.cover ,width: 100,height: 100,),
                              ),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text('${userDetails[index].firstname ?? ""}' , style: HeadingStyle,),
                          SizedBox(height: 5,),
                          Text('${userDetails[index].jobTitle ?? ""}' , style: subtitleStyle,),
                          SizedBox(height: 40,),
                        //   Container(
                        //     child: ListTile(
                        //       title: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text('D.O.B' , style: TextStyle(
                        //   fontSize: 16,
                        //   fontWeight: FontWeight.w400,
                        //   fontStyle: FontStyle.normal,
                        //   fontFamily: 'Questrial',
                        //   color: Color.fromRGBO(113, 126, 149, 1)
                        // ),),
                        //           Text('${userDetails[index].dob ?? "" }' , style: TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w400,
                        //               fontStyle: FontStyle.normal,
                        //               fontFamily: 'Questrial',
                        //               color: Color.fromRGBO(34, 34, 34, 1)
                        //           ),),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                        //     child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
                        //   ),
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
  final List<SeekerDetails> userDetails;
  EditProfilePage1({this.uName,this.password,this.user_Id, this.userDetails});
  @override
  _EditProfilePage1State createState() =>
      _EditProfilePage1State(uName:uName,password: password, user_Id: user_Id, userDetails: userDetails);
}

class _EditProfilePage1State extends State<EditProfilePage1> {
  final uName;
  final password;
  final user_Id;
  final List<SeekerDetails> userDetails;
  bool showPassword = false;
  _EditProfilePage1State({this.uName,this.password, this.user_Id, this.userDetails,this.image});
  TextEditingController controller = new TextEditingController();


  BuildContext context;

  GlobalKey<FormState> formKey = GlobalKey();


  String name;
  String Phone;
  String email;
  String city;

  File selectedfile;
  File selectedfile2;

  Future<File> file;

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
    print(_date);
  }

  File image;
  Future pickImage(ImageSource source ) async {

    try{
      final image = await ImagePicker.pickImage(source: source);
      if(image == null )return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      print('image is Permamnent : $imagePermanent');
      setState(()=> this.image = imagePermanent);
    } catch (e){
      print('Failed To pickImage : ${e.toString()}');
    }

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
                            /* letterSpacing: 0.0, */
                          )),
                      onTap: () {
                        pickImage(ImageSource.gallery);
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
                      //selectFile();
                      pickImage(ImageSource.camera);
                      // _imgFromCamera();
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
    // if (image == null) return;
    // String base64Image = base64Encode(image.readAsBytesSync());
    // String fileName = image.path.split("/").last;

    FormData formdata = FormData.fromMap({
      "id": user_Id,
      "firstname": name,
      "dob":_date,
      "email": email,
      "city": city,
      "mobile_no": Phone,
      "profile_picture": await MultipartFile.fromFile(
          image.path,
          filename: basename(image.path)
        //show only filename from path
      ),
     // "name":fileName

    });

    response = await dio.post(uploadurl,
      data: formdata,
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
     // print("response of $image");
      print('image  $image');
      print(response.data);
 //     Requests.Login(context, uName, password, false);
    } else {
      utils().showDialogCustom(context, "Upload Failed !",
          response.statusCode == 100
              ? " Please Connect Your Internet Connection  Or \n Server returned failure. Please try to restart the application."
              : response.statusCode, "OK");
    }
  }



  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
     DateTime picked = await showDatePicker(
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

    String _formatDate = DateFormat.yMMMd().format(_date);
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
        // actions: [
        //   Image.asset('assets/images/edit.png')],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: 40,),
            Container(
                height: SizeConfig.screenHeight,
                child: ListView.builder(
                    itemCount: userDetails.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Center(
                              child: Stack(
                                children: [
                                  image != null ? ClipOval(
                                    child: Image.file(
                                      image ,
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
                                              userDetails[index].profilePicture ?? Image.asset('assets/images/splashlogo.png'),
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
                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String value) {
                                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                              },
                            ),
                            SizedBox(height: 20,),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: <Widget>[
                            //     Expanded(
                            //       child: _InputDropdown(
                            //         labelText: "D.O.B",
                            //         valueText: '${userDetails[index].dob ?? ""}',
                            //         onPressed: () {
                            //           selectDate(context);
                            //         },
                            //       ),
                            //     ),
                            //     SizedBox(width: 8.0),
                            //   ],
                            // ),
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
                              //   controller: emailController,
                            initialValue: userDetails[index].email,

                              onChanged: (String value){
                                setState(() {
                                  email = value;
                                });
                                print('email is :$email');
                              },

                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                                email =value;
                                print('email is: $email');

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

                              onSaved: (String value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                                city =value;
                                print('city is $city');
                              },
                              decoration: InputDecoration(
                                //  suffixText: '${userDetails[index].city}',
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  //labelText: 'labelText',
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
                                // color:  Colors.red[100],
                                color: Colors.pinkAccent[200],
                                borderRadius: BorderRadius.circular(5.0),
                                // border: Border.all(color: Theme.of(context).accentColor)),
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
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Column(
        children: [
          TextField(
            // obscureText: isPasswordTextField ? showPassword : false,
            decoration: InputDecoration(
              // suffixIcon: isPasswordTextField
              //     ? IconButton(
              //   onPressed: () {
              //     setState(() {
              //       showPassword = !showPassword;
              //     });
              //   },
              //   icon: Icon(
              //     Icons.remove_red_eye,
              //     color: Colors.grey,
              //   ),
              // )
              //     : null,
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


class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key, this.child, this.labelText, this.valueText, this.onPressed,this.onChanged})
      : super(key: key);

  final String labelText;
  final String valueText;
  final VoidCallback onPressed;
  final VoidCallback onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontFamily: 'Questrial',
              color: Color.fromRGBO(34, 34, 34, 1) )
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Icon(Icons.calendar_today,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
            new Text(valueText),
          ],
        ),
      ),
    );
  }


}