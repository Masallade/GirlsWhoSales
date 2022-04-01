import 'dart:convert';
import 'dart:io';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/sign_up_user_model.dart';
import 'package:girlzwhosell/screens/intro_pages/register_success_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';




// ignore: must_be_immutable
class CustomFilePicker extends StatefulWidget{

  String firstName;
  String firstName2;
  String email;
  String phonenno;
  String email2;
  String Password;
  String cv;
  String ExperiencenDetail;
  String resume;
  String title;
  String phone;
  String location;
  String jobtype;
  String Button;
  CustomFilePicker({this.jobtype,this.ExperiencenDetail,this.firstName,this.firstName2,this.email,this.email2 ,this.phonenno ,this.Button});

  @override
  State<StatefulWidget> createState() {
    return _CustomFilePicker(jobtype: jobtype,ExperiencenDetail: ExperiencenDetail,firstName: firstName,firstName2: firstName2,email: email,email2: email2,phonenno: phonenno,Button: Button);
  }
}

class _CustomFilePicker extends State<CustomFilePicker>{


  String firstName;
  String firstName2;
  String email;
  String phonenno;
  String email2;
  String Password;
  String cv;
  String ExperiencenDetail;
  String resume;
  String title;
  String phone;
  String location;
  String jobtype;
  String Button;


  _CustomFilePicker({this.jobtype,this.ExperiencenDetail,this.firstName,this.firstName2,this.email,this.email2 ,this.phonenno ,this.Button});


  FilePickerResult selectedfile;
  File selectedfile2;
  Response response;
  String progress;
  Dio dio = new Dio();
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Slip';
  String uploadurl = base_url +"signup.php";
  GlobalKey<FormState> formKey = GlobalKey();

  String _text = "Let's Crush this!";
  String _text2 = "Sell Yourself by uploading a visume! Let the \n"
      " world know of your superpowers!";

  void _doSomething() {
    setState(() {
      _text = 'Just a few steps!';
      _text2 = 'Please answer the following questions to \n finish the registration process';
      // isSelected = true;
    });
  }
  File _image;
  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    //File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }
  Future _imgFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    //File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  selectFile() async {
    selectedfile =  await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc' ,'docx'],
    );

    setState((){}); //update the UI so that file name is shown
  }



  void  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library , color: Colors.pinkAccent),
                      title: new Text('Gallery' , style: TextStyle(fontFamily: 'Questrial' ,fontWeight: FontWeight.w400),),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera ,color: Colors.pinkAccent),
                    title: new Text('Camera' ,style: TextStyle(fontFamily: 'Questrial' ,fontWeight: FontWeight.w400),),
                    onTap: () {
                      //selectFile();
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

//////////////////

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.cover,
            ),
          );
        } else if (null != snapshot.error) {
          return Text(
            'Error Picking Slip',
            textAlign: TextAlign.center,
          );
        } else {
          return Text(
            '',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }




  // ignore: missing_return
  Future  <RegistrationModel> uploadResume() async {
    FormData formdata = FormData.fromMap({
      "firstname": firstName,
      "email": email,
      "password": email2,
      "category": Button,
      "job_title": jobtype,
      "city": "",
      "experience": ExperiencenDetail,
      "expected_salary": "",
      "lastname": firstName2,
      "phone": phonenno,
       "cv": await MultipartFile.fromFile(
          _image.path,
          filename: basename(_image.path)
        //show only filename from path
      ),
       "resume": await MultipartFile.fromFile(
          selectedfile.files.single.path,
          filename: basename(selectedfile.files.single.path)
        //show only filename from path
      ),
    });

    response = await dio.post(uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent/total*100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
          //update the progress
        });
      },);


    if(response.statusCode == 200){
   //   print(response.toString());
      print(response.data);
      print("name : $firstName");
      print("lastname : $firstName2");
      print("email : $email");
      print("pass : $email2");
      print("phone : $phonenno");
      print("Categoreis : $Button");
      print("JobTitle : $jobtype");
      print("experience : $ExperiencenDetail");
      registrationModel = RegistrationModel.fromJson(json.decode(response.data));
      return registrationModel;
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));

      //print response from server
    }else{
      print("Error during connection to server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
        ),
      ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 27.5,right: 27.5),
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 2.7,
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                child: LinearProgressIndicator(
                  minHeight: 10.0,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                  value: 1.0,
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 295.0 ,right: 12.0),
                child: Text(
                  '100%',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Text(_text,
                style:HeadingStyle),
              SizedBox(
                height: 20,
              ),
              Align(
               alignment: Alignment.center,
                  child: Text(_text2,
                  style: subtitleStyle,
                ),
              ),



              Container(
                  child:Column(
                     children: <Widget>[

                    Container(
                      margin: EdgeInsets.all(20),
                      //show file name here
                      child:progress == null?
                      Text(" " , style: TextStyle(
                        height: 1.5,
                        fontSize: 16.0,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,

                        /* letterSpacing: 0.0, */
                      ),):
                      Text(basename("Progress: $progress"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 16.0,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,

                          /* letterSpacing: 0.0, */
                        ),),
                      //show progress status here
                    ),
                    showImage(),
                    //SizedBox(height: 10.0),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                            child: selectedfile2 == null ? DottedBorder(
                              strokeWidth: 1.0,
                              color: Colors.blueGrey[300].withOpacity(0.6),
                              // padding: EdgeInsets.all(4),
                              dashPattern: [9, 5],
                              child: Container(
                                height: 60,
                                width: SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                  //  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    selectFile();
                                    _doSomething();
                                  },
                                  child: ListTile(
                                    leading:selectedfile == null ?  Image.asset('assets/images/cvIcon.png') :
                                    Image.asset('assets/images/pdfbg.png' ,width: 40,height: 40,),
                                    title:selectedfile == null ? Text(
                                      'Upload Cv/Resume',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 17.0,
                                          fontFamily: 'Questrial',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blueGrey[400]
                                        /* letterSpacing: 0.0, */
                                      ),
                                    ):Text(basename(selectedfile.files.single.path) ),
                                    trailing: selectedfile != null ? Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ): null,
                                  ),
                                ),
                              ),
                            ) : Container(
                              padding: EdgeInsets.all(8),
                              width: SizeConfig.screenWidth,
                              height: 72,
                              color:Color.fromRGBO(238, 242, 248, 1),
                              child:ListTile(
                                  leading: Image.asset('assets/images/pdfbg.png' ,width: 40,height: 40,),
                                  title: Text(basename(selectedfile.files.single.path) ),
                                trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                            child:_image == null ? DottedBorder(
                              strokeWidth: 1.0,
                              color: Colors.blueGrey[300].withOpacity(0.6),
                              // padding: EdgeInsets.all(4),
                              dashPattern: [9, 5],
                              child: Container(
                                height: 60,
                                width: SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                   //  selectFile1();
                                    _showPicker(context);
                                  },
                                  child: ListTile(
                                      leading:_image == null?  Image.asset('assets/images/cvIcon.png')
                                          : Image.asset('assets/images/camera.png' ,width: 40,height: 40,),
                                      title: _image == null ? Text(
                                        'Upload Visume!',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize: 17.0,
                                            fontFamily: 'Questrial',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey[300]
                                          /* letterSpacing: 0.0, */
                                        ),
                                      ):Text(basename(_image.path) ),
                                      trailing:_image != null ? Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ):null
                                  ),
                                ),
                              ),
                            ): Container(
                              padding: EdgeInsets.all(8),
                              width: SizeConfig.screenWidth,
                              height: 72,
                              color:Color.fromRGBO(238, 242, 248, 1),
                              child:ListTile(
                                leading: Image.asset('assets/images/camera.png' ,width: 40,height: 40,),
                                title: Text(basename(_image.path) ),
                                trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 28,),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                            Size(SizeConfig.screenWidth, 60.0),
                            primary: Color.fromARGB(255, 255, 65, 129),
                            //onSurface:  Colors.pinkAccent[200],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5.0))),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,),
                        ),
                        onPressed:() async{
                          uploadResume().then((value) {
                            if(value.status == 100){
                              final snackBar = SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Email Already Exist'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            if(value.status == 200){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));
                            }
                          });
                          },
                      ),
                    ),

                  ],)
              ),
            ],

          ),
        ),
    );
  }
}





class CustomFilePicker2 extends StatefulWidget{

  final uName;
  final password;
 final user_id;
  final List<SeekerDetails> userDetails;

  CustomFilePicker2({this.uName,this.password ,this.user_id ,this.userDetails});

  @override
  State<StatefulWidget> createState() {
    return _CustomFilePicker2(uName: uName,password: password ,user_id: user_id);
  }
}

class _CustomFilePicker2 extends State<CustomFilePicker2>{



  final uName;
  final password;
  final user_id;
  final List<SeekerDetails> userDetails;

  _CustomFilePicker2({this.uName,this.password ,this.user_id ,this.userDetails});


  FilePickerResult selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();
  Future<File> file;
  String base64Image;
  File tmpFile;
  String uploadurl = base_url + "user_update.php";




  selectFile() async {
    selectedfile =  await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc' ,'docx'],
    );

    setState((){}); //update the UI so that file name is shown
  }


  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.cover,
            ),
          );
        } else if (null != snapshot.error) {
          return Text(
            'Error Picking Slip',
            textAlign: TextAlign.center,
          );
        } else {
          return Text(
            '',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }


  uploadResume(context) async {

    FormData formdata = FormData.fromMap({
      "id": user_id,
      "cv": await MultipartFile.fromFile(
          selectedfile.files.single.path,
          filename: basename(selectedfile.files.single.path)
        //show only filename from path
      ),
    });

    response = await dio.post(uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent/total*100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
          //update the progress
        });
      },);


    if(response.statusCode == 200){
      print(formdata);
      print(response.toString());
      print(selectedfile);
      print(user_id);

      Requests.ProfileLogin(context, uName, password, 'token', false);
      showToast('Your Resume/ CV Has Been Updated',
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
      //print response from server
    }else{
      print("Error during connection to server.");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon( Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 2.7,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Let's Update Your\n Resume/Visume! " ,
                  style: HeadingStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                   "Update Your Cv/ Resume \n"
                   "World Should know of your superpowers!" ,
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                child:Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child:progress == null?
                    Text(""):
                    Text(basename("Progress: $progress"),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),),
                    //show progress status here
                  ),
                  showImage(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DottedBorder(
                          strokeWidth: 1.0,
                          color: Colors.grey[300],
                          // padding: EdgeInsets.all(4),
                          dashPattern: [9, 5],
                          child: Container(
                            height: 70,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              //  color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                selectFile();
                              },
                              child: ListTile(
                                leading: Image.asset('assets/images/cvIcon.png'),
                                title: selectedfile == null
                                    ? Text(
                                  'Upload Cv/Resume',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 17.0,
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueGrey[400]
                                    /* letterSpacing: 0.0, */
                                  ),
                                ) : Text(basename(selectedfile.files.single.path) ),
                                trailing: selectedfile != null
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],)
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize:
              Size(SizeConfig.screenWidth, 60.0),
              primary: Color.fromARGB(255, 255, 65, 129),
              //onSurface:  Colors.pinkAccent[200],
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(5.0))),
          child: Text(
            'Update',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,),
          ),
          onPressed:() {
            uploadResume(context);
          },
        ),
      ),
    );
  }
}





class uploadVideoCv extends StatefulWidget{

  final uName;
  final password;
  final user_id;
  final List<SeekerDetails> userDetails;

  uploadVideoCv({this.uName,this.password ,this.user_id ,this.userDetails});

  @override
  State<StatefulWidget> createState() {
    return _uploadVideoCv(uName: uName,password: password ,user_id: user_id);
  }
}

class _uploadVideoCv extends State<uploadVideoCv>{



  final uName;
  final password;
  final user_id;
  final List<SeekerDetails> userDetails;

  _uploadVideoCv({this.uName,this.password ,this.user_id ,this.userDetails});


  Response response;
  String progress;
  Dio dio = new Dio();
  Future<File> file;
  String base64Image;
  File tmpFile;

  String uploadurl = base_url + "user_update.php";

  File _image;
  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }


  Future _imgFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }


  void  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library , color: Colors.pinkAccent),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera , color: Colors.pinkAccent[200],),
                    title: new Text('Camera'),
                    onTap: () {
                      //selectFile();
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
//////////////////
  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.cover,
            ),
          );
        } else if (null != snapshot.error) {
          return Text(
            'Error Picking Slip',
            textAlign: TextAlign.center,
          );
        } else {
          return Text(
            '',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }



  uploadResume(context) async {

    FormData formdata = FormData.fromMap({
      "id": user_id,
      "resume": await MultipartFile.fromFile(
          _image.path,
          filename: basename(_image.path)
        //show only filename from path
      ),
    });

    response = await dio.post(uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent/total*100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
          //update the progress
        });
      },);


    if(response.statusCode == 200){
      print(formdata);
      print(response.toString());
      print(_image);
      print(user_id);

      Requests.ProfileLogin(context, uName, password,'', false);
      showToast('Your Video Cv Has Been Updated',
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
      //print response from server
    }else{
      print("Error during connection to server.");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon( Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 2.7,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Let's Update Your\n Resume/Visume! " ,
                  style: HeadingStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Update Your Visume Or Video Cv"
                    "World Should know of your superpowers!" ,
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                child:Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child:progress == null
                        ? Text(""):
                    Text(basename("Progress: $progress"),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),),
                    //show progress status here
                  ),
                  showImage(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DottedBorder(
                          strokeWidth: 1.0,
                          color: Colors.grey[300],
                          dashPattern: [9, 5],
                          child: Container(
                            height: 60,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: ListTile(
                                  leading: Image.asset('assets/images/cvIcon.png'),
                                  title: _image == null
                                      ? Text(
                                    'Upload Visume!',
                                    style: TextStyle(
                                        height: 1.5,
                                        fontSize: 17.0,
                                        fontFamily: 'Questrial',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey[300]
                                      /* letterSpacing: 0.0, */
                                    ),
                                  )
                                      : Text(basename(_image.path),
                                  ),
                                  trailing: _image != null
                                      ? Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                      : null),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],)
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize:
              Size(SizeConfig.screenWidth, 60.0),
              primary: Color.fromARGB(255, 255, 65, 129),
              //onSurface:  Colors.pinkAccent[200],
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(5.0))),
          child: Text(
            'Update',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,),
          ),
          onPressed:() {
            // _upload(file1,user_id);
            uploadResume(context);
          },
        ),
      ),
    );
  }
}