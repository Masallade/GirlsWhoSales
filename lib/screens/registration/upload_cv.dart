import 'dart:convert';
import 'dart:io';
import 'package:girlzwhosell/model/sign_up_user_model.dart';
import 'package:girlzwhosell/screens/intro_pages/register_success_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';




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


  File selectedfile;
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


  _imgFromCamera()async {
    selectedfile2 = await ImagePicker.pickVideo(source: ImageSource.camera, maxDuration: const Duration(seconds: 60));
    setState((){});
  }

  _imgFromGallery() async{
    selectedfile2 = await ImagePicker.pickVideo(source: ImageSource.gallery);


    setState((){});
    // setState(() async {
    //   selectedfile = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    // });
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
  selectFile() async {
    selectedfile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf','mp4','doc','docx'],
      //allowed extension to choose
    );
    setState((){}); //update the UI so that file name is shown
  }
  selectFile1() async {
    selectedfile2 = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
      //allowed extension to choose
    );
    setState((){}); //update the UI so that file name is shown
  }

  Future<RegistrationModel> UploadUser() async{
    final url = "https://biitsolutions.co.uk/girlzwhosell/API//signup.php";
    try{
      final response = await http.post(Uri.parse(url) , body: {
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
        "cv": await basename(selectedfile2.path),
          //show only filename from path
        "resume": await basename(selectedfile.path)
          //show only filename from path
      });
      if(response.statusCode == 200){
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        registrationModel = RegistrationModel.fromJson(json.decode(response.body));
        return registrationModel;
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }


  uploadResume(context) async {
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
          selectedfile2.path,
          filename: basename(selectedfile2.path)
        //show only filename from path
      ),
      "resume": await MultipartFile.fromFile(
          selectedfile.path,
          filename: basename(selectedfile.path)
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
      print(response.toString());
      print(response.data);
      print("name : $firstName");
      print("lastname : $firstName2");
      print("email : $email");
      print("pass : $email2");
      print("phone : $phonenno");
      print("Categoreis : $Button");
      print("JobTitle : $jobtype");
      print("experience : $ExperiencenDetail");

      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));

      //print response from server
    }else{
      print("Error during connection to server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 30.0,),
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
                      Text("Progress: 0%" , style: TextStyle(
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
                            child: selectedfile == null ? DottedBorder(
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
                                    leading:selectedfile == null ?  Image.asset('assets/images/cvIcon.png') : Image.asset('assets/images/pdfbg.png' ,width: 40,height: 40,),
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
                                    ):Text(basename(selectedfile.path) ),
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
                                  title: Text(basename(selectedfile.path) ),
                                trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                            child:selectedfile2 == null ? DottedBorder(
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
                                    selectFile1();
                                    _showPicker(context);
                                  },
                                  child: ListTile(
                                      leading:selectedfile2 == null?  Image.asset('assets/images/cvIcon.png'):Image.asset('assets/images/camera.png' ,width: 40,height: 40,),
                                      title: selectedfile2 == null ? Text(
                                        'Upload Visume!',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize: 17.0,
                                            fontFamily: 'Questrial',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey[300]
                                          /* letterSpacing: 0.0, */
                                        ),
                                      ):Text(basename(selectedfile2.path) ),
                                      trailing:selectedfile2 != null ? Icon(
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
                                title: Text(basename(selectedfile2.path) ),
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
                        onPressed:() {
                          uploadResume(context);
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
  CustomFilePicker2({this.jobtype,this.ExperiencenDetail,this.firstName,this.firstName2,this.email,this.email2 ,this.phonenno ,this.Button});

  @override
  State<StatefulWidget> createState() {
    return _CustomFilePicker2(jobtype: jobtype,ExperiencenDetail: ExperiencenDetail,firstName: firstName,firstName2: firstName2,email: email,email2: email2,phonenno: phonenno,Button: Button);
  }
}

class _CustomFilePicker2 extends State<CustomFilePicker2>{


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


  _CustomFilePicker2({this.jobtype,this.ExperiencenDetail,this.firstName,this.firstName2,this.email,this.email2 ,this.phonenno ,this.Button});


  File selectedfile;
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

  _imgFromCamera()async {
    selectedfile2 = await ImagePicker.pickVideo(source: ImageSource.camera, maxDuration: const Duration(seconds: 60));
    setState((){});
  }

  _imgFromGallery() async{
    selectedfile2 = await ImagePicker.pickVideo(source: ImageSource.gallery);
    setState((){});
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
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
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
  selectFile() async {
    selectedfile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'mp4', 'doc', 'docx'],
      //allowed extension to choose
    );

    setState((){}); //update the UI so that file name is shown
  }

  uploadResume(context) async {

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
          selectedfile2.path,
          filename: basename(selectedfile2.path)
        //show only filename from path
      ),
      "resume": await MultipartFile.fromFile(
          selectedfile.path,
          filename: basename(selectedfile.path)
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
      print(response.toString());
      print(response.data);
      print("name : $firstName");
      print("lastname : $firstName2");
      print("email : $email");
      print("pass : $email2");
      print("phone : $phonenno");
      print("Categoreis : $Button");
      print("JobTitle : $jobtype");
      print("experience : $ExperiencenDetail");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));

      //print response from server
    }else{
      print("Error during connection to server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 30.0,),
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
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: LinearProgressIndicator(
            //     minHeight: 10.0,
            //     backgroundColor: Colors.grey[300],
            //     valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
            //     value: 1.0,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 280.0),
            //   child: Text(
            //     '100%',
            //     textAlign: TextAlign.end,
            //     style: TextStyle(
            //         color: Colors.blueGrey[300],
            //         fontFamily: 'Poppins',
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Text("Let's Upload Your Resume Or Visume! " ,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Sell Yourself by uploading a visume! Let the \n"
                  " world know of your superpowers!" ,
                style: TextStyle(
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[300]),
              ),
            ),
            Container(
                child:Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    //show file name here
                    child:progress == null?
                    Text("Progress: 0%"):
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
                                ) : Text(basename(selectedfile.path) ),
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DottedBorder(
                          strokeWidth: 1.0,
                          color: Colors.grey[300],
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
                                //selectFile();
                                _showPicker(context);
                              },
                              child: ListTile(
                                  leading: Image.asset('assets/images/cvIcon.png'),
                                  title: selectedfile2 == null
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
                                      : Text(basename(selectedfile2.path),
                                  ),
                                  trailing: selectedfile2 != null
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
                  SizedBox(height: 30,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        child: Column(
                          children: [
                            RaisedButton.icon(
                              onPressed: () {
                                uploadResume(context);
                              },
                              icon: Icon(Icons.folder_open),
                              label: Text(
                                "Upload Files & Finish ",
                                style: TextStyle(fontFamily: 'poppins', fontSize: 17),
                              ),
                              color: Colors.pinkAccent[200],
                              colorBrightness: Brightness.dark,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // progress != null
                            //     ? Text(progress,
                            //     style: TextStyle(
                            //         height: 1.5,
                            //         fontSize: 17.0,
                            //         fontFamily: 'Questrial',
                            //         fontWeight: FontWeight.w400,
                            //         color: Colors.blueGrey[300]
                            //       /* letterSpacing: 0.0, */
                            //     ))
                            //     : Text(''),
                          ],
                        )),
                  ),

                ],)
            ),
            // Container(
            //   padding: EdgeInsets.all(30.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //
            //       GestureDetector(
            //         onTap: () {
            //           _showPicker(context);
            //         },
            //         child: OutlineButton.icon(
            //
            //           //onPressed: chooseImage,
            //           splashColor: Colors.green,
            //           borderSide: BorderSide(
            //             color: Colors.red[200],
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30.0),
            //           ),
            //           icon: const Icon(
            //             Icons.insert_drive_file_outlined,
            //             size: 18.0,
            //             color: Colors.red,
            //
            //           ),
            //           label:  Text('Add Slip',
            //             style: TextStyle(color: Colors.red[200],fontWeight: FontWeight.bold, fontSize: 14),),
            //         ),
            //       ),
            //
            //
            //       SizedBox(height: 10.0),
            //       showImage(),
            //       SizedBox(height: 10.0),
            //       GestureDetector(
            //         onTap: () {
            //
            //         },
            //         child: OutlineButton.icon(
            //
            //           //onPressed: chooseImage,
            //           color: Colors.green,
            //           // splashColor: Colors.red,
            //           borderSide: BorderSide(
            //             color: Colors.red[200],
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //           ),
            //           icon: const Icon(
            //             Icons.upload_file,
            //             size: 20.0,
            //             color: Colors.red,
            //           ),
            //           label:  Text('Upload Slip',
            //             style: TextStyle(color: Colors.red[200],fontWeight: FontWeight.bold, fontSize: 16),
            //           ),
            //         ),
            //
            //
            //
            //
            //       ),
            //       // Text(
            //       //   status,
            //       //   textAlign: TextAlign.center,
            //       //   style: TextStyle(
            //       //     color: Colors.green,
            //       //     fontWeight: FontWeight.w500,
            //       //     fontSize: 20.0,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],

        ),
      ),
      //     floatingActionButton: Padding(
      // padding: const EdgeInsets.only(bottom: 12.0),
      // child: floatingActionButtonNext(
      //
      // context, MaterialPageRoute(builder: (context) => SuccessPage())),
      //
      // ),
    );
  }
}