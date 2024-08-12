import 'dart:convert';
import 'dart:io';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/extension_for_login.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/sign_up_user_model.dart';
import 'package:girlzwhosell/screens/intro_pages/register_success_screen.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:girlzwhosell/utils/willscope.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../model/files_upload_model.dart';
import '../../model/get_user_data_link.dart';



// ignore: must_be_immutable
class CustomFilePicker extends StatefulWidget{
  String? city;
  String? firstName;
  String? nationality;
  String? firstName2;
  String? email;
  String? phonenno;
  String? email2;
  String? Password;
  String? cv;
  String? ExperiencenDetail;
  String? resume;
  String? title;
  String? phone;
  String? location;
  String? jobtype;
  String? Button;
  String? industry;
  String? jobtypes;
  String? joblevel;
  String? Month;
  final String? userId;

  CustomFilePicker({this.jobtype,this.ExperiencenDetail,this.firstName, this.nationality, this.firstName2,this.email, this.city, this.email2 ,this.phonenno ,this.Button , this.jobtypes,this.joblevel,this.industry ,this.Month,this.userId});

  @override
  State<StatefulWidget> createState() {
    return _CustomFilePicker(jobtype: jobtype,ExperiencenDetail: ExperiencenDetail,firstName: firstName, nationality: nationality, city: city, firstName2: firstName2,email: email,email2: email2,phonenno: phonenno,Button: Button ,jobtypes: jobtypes , joblevel: joblevel ,industry: industry ,Month: Month ,userId: userId);
  }
}

class _CustomFilePicker extends State<CustomFilePicker>{

  int currentStep = 1;
  int totalStep = 2;

  String? firstName;
  String? nationality;
  String? firstName2;
  String? email;
  String? phonenno;
  String? email2;
  String? Password;
  String? cv;
  String? ExperiencenDetail;
  String? resume;
  String? title;
  String? phone;
  String? location;
  String? jobtype;
  String? Button;
  String? industry;
  String? jobtypes;
  String? joblevel;
  String? Month;
  String? city;
  final String? userId;

  _CustomFilePicker({this.jobtype, this.city, this.ExperiencenDetail,this.firstName,this.nationality, this.firstName2,this.email,this.email2 ,this.phonenno ,this.Button,this.jobtypes ,this.joblevel,this.industry, this.Month, this.userId});

  // late ProgressDialog progressD;

  FilePickerResult? selectedfile;
  File? selectedfile2;
  late Response response;
  String? progress;
  Dio dio = new Dio();
  Future<File>? file;
  String status = '';
  String? base64Image;
  File? tmpFile;
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
  late File _image;
  final picker = ImagePicker();


  Future<String?> _imgFromCamera() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);

      if (pickedFile == null) {
        print("File not uploaded");
       return 'video.mp4';
      }
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }
  Future<String?> _imgFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

      if (pickedFile == null) {
        print("File not uploaded  ========>>>>>>>>>");
        return 'video.mp4';
      }
    setState(() {
      if (pickedFile != null) {
        print("File  uploaded  ========>>>>>>>>>+++++++++++++++++++");
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  selectFile() async {
    selectedfile =  await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','doc' ,'docx'],
    );
    // if (selectedfile != null) {
    //   print("File  uploaded sseecond ========>>>>>>>>>+++++++++++++++++++");
    //    //update the UI so that file name is shown
    //   // Access the file properties
    //   // ...
    // } else {
    //   print("File is not  uploaded second  ========>>>>>>>>>+++++++++++++++++++");
    //   // Handle the case when no file is selected
    //   // ...
    // }
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
          base64Image = base64Encode(snapshot.data!.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data!,
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
  Future  <RegistrationModel?> uploadResume(context) async {
    FormData formdata = FormData.fromMap({
      "user_id": userId,
      "firstname": firstName,
      "lastname": firstName2,
      "email": email,
      "password": email2,
      "category": Button,
      "job_title": jobtype,
      "city": city,
      "experience": ExperiencenDetail,
      // "experience": ExperiencenDetail,
      // "education_level": Month,
      "expected_salary": "",
      "job_type":jobtypes,
      "job_level": joblevel,
      "job_industry":industry,
      "phone": phonenno,
      "cv": await MultipartFile.fromFile(//_image == null ? "video.mp4" :  cut from this line
          _image.path,
          filename: basename(_image.path)
        //show only filename from path
      ),
       "resume": await MultipartFile.fromFile(//selectedfile != null && selectedfile.files.isNotEmpty ?
          selectedfile!.files.single.path!,
          filename: basename(selectedfile!.files.single.path!)
        //show only filename from path
      ),// ): null
      // "nationality" : basename(selectedfile.files.single.path),
    });

    try {
    response = await dio.post(uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent / total * 100).toStringAsFixed(2);
        setState(() {
          progress = "Step ${currentStep/totalStep} " + percentage +//"$sent" + " Bytes of " "$total Bytes - " +
              " % uploaded";
          //update the progress
          if(percentage == "100.00" || percentage == "100" && !kuserFileUploaded){
            currentStep ++;
            totalStep ++;
            uploadResume(context);
          }
        });
      },);


    if (response.statusCode == 200  && !kuserFileUploaded) {
      kuserFileUploaded = true;
      print(response.data);
      print("=================Upload User Data=================");

      registrationModel =
          RegistrationModel.fromJson(json.decode(response.data));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RegisterSuccessScreen()));
      return registrationModel;
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));

      //print response from server
    } else {
      print("Error during connection to server.");
      }
    } catch(error){
    print("Error during file upload: $error");
    }
  }
  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
      builder: (context) => AlertDialog(
        elevation: 2.0,
        //   backgroundColor: Colors.pinkAccent.withOpacity(0.9),
        title: Text('Do you want to Log Out this application?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              print("you choose no");
              Navigator.of(context).pop(false);
            },
            child: Text(
              'No',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue[800],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
            },
            child: Text(
              'Yes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue[800],
            ),
          )
        ],
      ),
      context: context,
    ).then((value) => value as bool) ??
        false as Future<bool>;
  }

  @override
  Widget build(BuildContext context) {
    // progressD = ProgressDialog(context: context);

    return WillPopScope(
      onWillPop: ()=>_exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
           _exitApp(context);
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                  child: LinearProgressIndicator(
                    minHeight: 10.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800]),
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
                  height: 10,
                ),
                Text(_text,
                  style:HeadingStyle),
                SizedBox(
                  height: 10,
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
                              child: selectedcvFile == null ? DottedBorder(
                                strokeWidth: 1.0,
                                color: Colors.blueGrey[300]!.withOpacity(0.6),
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
                                      pickUserCV();
                                      //tariq you comment this
                                      // selectFile();
                                      // _doSomething();
                                    },
                                    child: ListTile(
                                      leading:selectedcvFile == null ?  Image.asset('assets/images/cvIcon.png') :
                                      Image.asset('assets/images/pdfbg.png' ,width: 40,height: 40,),
                                      title:selectedcvFile == null ? Text(
                                        'Upload Cv/Resume',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize: 17.0,
                                            fontFamily: 'Questrial',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey[400]
                                          /* letterSpacing: 0.0, */
                                        ),
                                      ):Text(basename(selectedcvFile!.files.single.path!) ),
                                      trailing: selectedcvFile != null ? Icon(
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
                                    title: Text(basename(selectedcvFile!.files.single.path!) ),
                                  trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                              child:selectedVisumefile == null ? DottedBorder( //_image
                                strokeWidth: 1.0,
                                color: Colors.blueGrey[300]!.withOpacity(0.6),
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
                                      pickUserVisume();
                                     //  selectFile1();
                                     //tariq you comment this
                                     //  _showPicker(context);
                                    },
                                    child: ListTile(
                                        leading:selectedVisumefile == null?  Image.asset('assets/images/cvIcon.png')//_image
                                            : Image.asset('assets/images/camera.png' ,width: 40,height: 40,),
                                        title: selectedVisumefile == null ? Text(//_image
                                          'Upload Visume!',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontSize: 17.0,
                                              fontFamily: 'Questrial',
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey[300]
                                            /* letterSpacing: 0.0, */
                                          ),
                                        ):Text(basename(selectedVisumefile!.files.single.path!) ),
                                        trailing:selectedVisumefile != null ? Icon(
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
                                  title: Text(basename(selectedVisumefile!.files.single.path!) ),
                                  trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize:
                              Size(SizeConfig.screenWidth!, 60.0),
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
                            // progressD.show(
                            //     max: 100,
                            //     msg: 'Uploading Files...',
                            //     progressType: ProgressType.valuable,
                            //     backgroundColor: Colors.blueGrey[300]!,//Color(0xff212121)
                            //     progressValueColor: Color(0xff3550B4),
                            //     progressBgColor: Colors.white70,
                            //     msgColor: Colors.white,
                            //     valueColor: Colors.white);
                            uploadUserData(selectedCVFilePath,selectedVisumeFilePath,context);
                            uploadResume(context);//tariq you comment this
                            },
                        ),
                      ),

                    ],)
                ),
              ],

            ),
          ),
      ),
    );
  }

  //======================== tariq new code of file upload is here ========================//
  final cvpicker = FilePicker.platform;
  final visumepicker = FilePicker.platform;
  String? selectedCVFilePath;
  String? selectedVisumeFilePath;
  FilePickerResult? selectedcvFile;
  FilePickerResult? selectedVisumefile;
  late Files_Upload_Model files_upload_model;

  Future<String?> pickUserVisume() async {
    selectedVisumefile = await visumepicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'avi', 'mov']// Add more video file extensions if needed
    );//FilePicker.platform.pickFiles()

    if (selectedVisumefile != null && selectedVisumefile!.files.isNotEmpty) {
      final file = selectedVisumefile!.files.single;
      selectedVisumeFilePath = file.path;
      setState(() {});
      return selectedVisumeFilePath;
    }

    return null;
  }

  Future<String?> pickUserCV() async {
    selectedcvFile = await cvpicker.pickFiles();//FilePicker.platform.pickFiles()

    if (selectedcvFile != null && selectedcvFile!.files.isNotEmpty) {
      final file = selectedcvFile!.files.single;
      selectedCVFilePath = file.path;
      setState(() {});
      return selectedCVFilePath;
    }

    return null;
  }

  Future<void> uploadUserData(String? cvPath, String? resumePath,context) async {
    // if (cvPath != null) {
      var headers = {'Cookie': 'session=da9df2f965aaa1d3c0dc17232c36844faff5c830'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://girlzwhosellcareerconextions.com/API/upload_cvs.php'),
      );

      request.fields['user_id'] = userId!;

      if(cvPath != null){
        request.files.add(
          await http.MultipartFile.fromPath('cv', cvPath),
        );
      }
      if(resumePath !=  null){
        request.files.add(
          await http.MultipartFile.fromPath('resume', resumePath),
        );
      }

      request.headers.addAll(headers);

      try {
        final response = await request.send();
        if (response.statusCode == 200) {

          // print(await response.stream.bytesToString());
          String jsonbody = await response.stream.bytesToString();
          files_upload_model = Files_Upload_Model.fromJson(jsonDecode(jsonbody));

          print("message isssssssss  ${files_upload_model.message}");

          if (files_upload_model.message == "Successful Upload"){
            // progressD.close();
            getUserDataLink();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterSuccessScreen()));
            // pd.update(msg: "Uploaded Successfully");
            print('Files is uploaded Successfully');
          }else
          //   if(files_upload_model.message == "Please Upload CV"){
          //   progressD.close();
          //   Fluttertoast.showToast(
          //       msg: "You must have to Pick CV/Resume.",
          //       toastLength: Toast.LENGTH_SHORT,
          //       gravity: ToastGravity.CENTER,
          //       timeInSecForIosWeb: 3);
          //   // pd.update(msg: "you have to pick Resume File");
          //   print("you have to pick Resume File");
          // }else
          {
            // progressD.close();
            Fluttertoast.showToast(
                msg: "File is not uploaded. Please Try Again!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3);
            // pd.update(msg: "File is not uploaded");
            print('File is not uploaded');
          }

        } else {
          print(response.reasonPhrase);
        }
      } catch (e) {
        print('Error: $e');
      }
    // }else{
    //   progressD.close();
    //
    //   Fluttertoast.showToast(
    //       msg: "You must have to Pick CV/Resume.",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 3);
    // }
  }
//======================== tariq new code of file upload is here ========================//
  Future<void> getUserDataLink() async {
    var request = http.Request('GET', Uri.parse('https://girlzwhosellcareerconextions.com/API/cvs_links.php?seeker_id=${userId}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(responseString);

      GetUserDataLink userDataLink = GetUserDataLink.fromJson(jsonMap);

      // Access resume and cV strings
      if (userDataLink.seekerDetails != null && userDataLink.seekerDetails!.isNotEmpty) {

        setState(() {
          VisumeUrl = userDataLink.seekerDetails![0].resume;
          CVurl = userDataLink.seekerDetails![0].cV;
          // isSelected = true;
        });


        // Use the resumeString and cvString as needed
        print('Resume: $VisumeUrl');
        print('CV: $CVurl');
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}





class CustomFilePicker2 extends StatefulWidget{

  final uName;
  final password;
 final user_id;
  final List<SeekerDetails>? userDetails;

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
  final List<SeekerDetails>? userDetails;


  _CustomFilePicker2({this.uName,this.password ,this.user_id ,this.userDetails});


  FilePickerResult? selectedfile;
  late Response response;
  String? progress;
  Dio dio = new Dio();
  Future<File>? file;
  String? base64Image;
  File? tmpFile;
  String uploadurl = base_url + "user_update.php";

  FilePickerResult? selectedcvFile;
  final cvpicker = FilePicker.platform;
  String? selectedCVFilePath;
  // late ProgressDialog progressD;
  late Files_Upload_Model files_upload_model;
  String? selectedVisumeFilePath;

  String? userId;

  @override
  void initState() {
    userId = user_id;
  }

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
          base64Image = base64Encode(snapshot.data!.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data!,
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
          selectedfile!.files.single.path!,
          filename: basename(selectedfile!.files.single.path!)
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
      print('ddd' + "$selectedfile");
      print(user_id);

      Requests.ProfileLogin(context, uName, password, 'token', false);
      showToast('Your Resume/ CV Has Been Updated',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
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
  Future<String?> pickUserCV() async {
    selectedcvFile = await cvpicker.pickFiles();//FilePicker.platform.pickFiles()

    if (selectedcvFile != null && selectedcvFile!.files.isNotEmpty) {
      final file = selectedcvFile!.files.single;
      selectedCVFilePath = file.path;
      setState(() {});
      return selectedCVFilePath;
    }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    // progressD = ProgressDialog(context: context);
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
                child: Text("Let's Update Your\n CV/Resume! " ,
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
                        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                        child: selectedcvFile == null ? DottedBorder(
                          strokeWidth: 1.0,
                          color: Colors.blueGrey[300]!.withOpacity(0.6),
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
                                pickUserCV();
                                //tariq you comment this
                                // selectFile();
                                // _doSomething();
                              },
                              child: ListTile(
                                leading:selectedcvFile == null ?  Image.asset('assets/images/cvIcon.png') :
                                Image.asset('assets/images/pdfbg.png' ,width: 40,height: 40,),
                                title:selectedcvFile == null ? Text(
                                  'Upload Cv/Resume',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 17.0,
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueGrey[400]
                                    /* letterSpacing: 0.0, */
                                  ),
                                ):Text(basename(selectedcvFile!.files.single.path!) ),
                                trailing: selectedcvFile != null ? Icon(
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
                            title: Text(basename(selectedcvFile!.files.single.path!) ),
                            trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: DottedBorder(
                      //     strokeWidth: 1.0,
                      //     color: Colors.grey[300],
                      //     // padding: EdgeInsets.all(4),
                      //     dashPattern: [9, 5],
                      //     child: Container(
                      //       height: 70,
                      //       width: SizeConfig.screenWidth,
                      //       decoration: BoxDecoration(
                      //         //  color: Colors.blue,
                      //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      //       ),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           selectFile();
                      //           print( "rg " + "$selectedfile");
                      //         },
                      //         child: ListTile(
                      //           leading: Image.asset('assets/images/cvIcon.png'),
                      //           title: selectedfile == null
                      //               ? Text(
                      //             'Upload Cv/Resume',
                      //             style: TextStyle(
                      //                 height: 1.5,
                      //                 fontSize: 17.0,
                      //                 fontFamily: 'Questrial',
                      //                 fontWeight: FontWeight.w400,
                      //                 color: Colors.blueGrey[400]
                      //               /* letterSpacing: 0.0, */
                      //             ),
                      //           ) : Text(basename(selectedfile.files.single.path) ),
                      //           trailing: selectedfile != null
                      //               ? Icon(
                      //             Icons.check,
                      //             color: Colors.green,
                      //           )
                      //               : null,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
              Size(SizeConfig.screenWidth!, 60.0),
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
          onPressed:() async{
              // progressD.show(
              //     max: 100,
              //     msg: 'Uploading Files...',
              //     progressType: ProgressType.valuable,
              //     backgroundColor: Colors.blueGrey[300]!,//Color(0xff212121)
              //     progressValueColor: Color(0xff3550B4),
              //     progressBgColor: Colors.white70,
              //     msgColor: Colors.white,
              //     valueColor: Colors.white);
              selectedVisumeFilePath ==  null;
              uploadUserCVData(selectedCVFilePath,selectedVisumeFilePath,context);
              // uploadResume(context);//tariq you comment this
            // uploadResume(context);
          },
        ),
      ),
    );
  }
  Future<void> uploadUserCVData(String? cvPath, String? resumePath,context) async {
    // if (cvPath != null) {
      var headers = {'Cookie': 'session=da9df2f965aaa1d3c0dc17232c36844faff5c830'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://girlzwhosellcareerconextions.com/API/upload_cvs.php'),
      );

      request.fields['user_id'] = userId!;
      if(cvPath != null){
        request.files.add(
          await http.MultipartFile.fromPath('cv', cvPath),
        );
      }

      if(resumePath !=  null){
        request.files.add(
          await http.MultipartFile.fromPath('resume', resumePath),
        );
      }

      request.headers.addAll(headers);

      try {
        final response = await request.send();
        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          String jsonbody = await response.stream.bytesToString();
          files_upload_model = Files_Upload_Model.fromJson(jsonDecode(jsonbody));

          print("message isssssssss  ${files_upload_model.message}");

          if (files_upload_model.message == "Successful Upload"){
            // progressD.close();
            getUserDataLink();
            Fluttertoast.showToast(
                msg: "File uploaded Successfully!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3);
          }else
          //   if(files_upload_model.message == "Please Upload CV"){
          //   progressD.close();
          //   Fluttertoast.showToast(
          //       msg: "You must have to Pick CV/Resume.",
          //       toastLength: Toast.LENGTH_SHORT,
          //       gravity: ToastGravity.CENTER,
          //       timeInSecForIosWeb: 3);
          //   // pd.update(msg: "you have to pick Resume File");
          //   print("you have to pick Resume File");
          // } else
          {
            // progressD.close();
            Fluttertoast.showToast(
                msg: "File is not uploaded. Please Try Again!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3);
            // pd.update(msg: "File is not uploaded");
            print('File is not uploaded');
          }

        } else {
          print(response.reasonPhrase);
        }
      } catch (e) {
        print('Error: $e');
      }
    // }else{
    //   progressD.close();
    //
    //   Fluttertoast.showToast(
    //       msg: "You must have to Pick CV/Resume.",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 3);
    // }
  }
  Future<void> getUserDataLink() async {
    var request = http.Request('GET', Uri.parse('https://girlzwhosellcareerconextions.com/API/cvs_links.php?seeker_id=${userId}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(responseString);

      GetUserDataLink userDataLink = GetUserDataLink.fromJson(jsonMap);

      // Access resume and cV strings
      if (userDataLink.seekerDetails != null && userDataLink.seekerDetails!.isNotEmpty) {

        setState(() {
          VisumeUrl = userDataLink.seekerDetails![0].resume;
          CVurl = userDataLink.seekerDetails![0].cV;
          // isSelected = true;
        });


        // Use the resumeString and cvString as needed
        print('Resume: $VisumeUrl');
        print('CV: $CVurl');
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}





class uploadVideoCv extends StatefulWidget{

  final uName;
  final password;
  final user_id;
  final List<SeekerDetails>? userDetails;

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
  final List<SeekerDetails>? userDetails;

  _uploadVideoCv({this.uName,this.password ,this.user_id ,this.userDetails});

  late Response response;
  String? progress;
  Dio dio = new Dio();
  Future<File>? file;
  String? base64Image;
  File? tmpFile;

  String uploadurl = base_url + "user_update.php";

  File? _image;
  final picker = ImagePicker();

  FilePickerResult? selectedcvFile;
  final cvpicker = FilePicker.platform;
  String? selectedCVFilePath;
  // late ProgressDialog progressD;
  late Files_Upload_Model files_upload_model;
  String? selectedVisumeFilePath;
  FilePickerResult? selectedVisumefile;
  final visumepicker = FilePicker.platform;

  String? userId;

  @override
  void initState() {
    userId = user_id;
  }



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

  uploadResume(context) async {

    FormData formdata = FormData.fromMap({
      "id": user_id,
      "cv": await MultipartFile.fromFile(
          _image!.path,
          filename: basename(_image!.path)
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
        backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
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
    // progressD = ProgressDialog(context: context);
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
                child: Text("Let's Update Your\n Visume! " ,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                        child:selectedVisumefile == null ? DottedBorder( //_image
                          strokeWidth: 1.0,
                          color: Colors.blueGrey[300]!.withOpacity(0.6),
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
                                pickUserVisume();
                                //  selectFile1();
                                //tariq you comment this
                                //  _showPicker(context);
                              },
                              child: ListTile(
                                  leading:selectedVisumefile == null?  Image.asset('assets/images/cvIcon.png')//_image
                                      : Image.asset('assets/images/camera.png' ,width: 40,height: 40,),
                                  title: selectedVisumefile == null ? Text(//_image
                                    'Upload Visume!',
                                    style: TextStyle(
                                        height: 1.5,
                                        fontSize: 17.0,
                                        fontFamily: 'Questrial',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey[300]
                                      /* letterSpacing: 0.0, */
                                    ),
                                  ):Text(basename(selectedVisumefile!.files.single.path!) ),
                                  trailing:selectedVisumefile != null ? Icon(
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
                            title: Text(basename(selectedVisumefile!.files.single.path!) ),
                            trailing: Icon(Icons.check ,  color: Color.fromRGBO(117, 162, 66, 1)),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: DottedBorder(
                      //     strokeWidth: 1.0,
                      //     color: Colors.grey[300],
                      //     dashPattern: [9, 5],
                      //     child: Container(
                      //       height: 60,
                      //       width: SizeConfig.screenWidth,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      //       ),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           _showPicker(context);
                      //         },
                      //         child: ListTile(
                      //             leading: Image.asset('assets/images/cvIcon.png'),
                      //             title: _image == null
                      //                 ? Text(
                      //               'Upload Visume!',
                      //               style: TextStyle(
                      //                   height: 1.5,
                      //                   fontSize: 17.0,
                      //                   fontFamily: 'Questrial',
                      //                   fontWeight: FontWeight.w400,
                      //                   color: Colors.blueGrey[300]
                      //                 /* letterSpacing: 0.0, */
                      //               ),
                      //             )
                      //                 : Text(basename(_image.path),
                      //             ),
                      //             trailing: _image != null
                      //                 ? Icon(
                      //               Icons.check,
                      //               color: Colors.green,
                      //             )
                      //                 : null),
                      //       ),
                      //     ),
                      //   ),
                      // )
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
              Size(SizeConfig.screenWidth!, 60.0),
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
          onPressed:() async{
            // progressD.show(
            //     max: 100,
            //     msg: 'Uploading Files...',
            //     progressType: ProgressType.valuable,
            //     backgroundColor: Colors.blueGrey[300]!,//Color(0xff212121)
            //     progressValueColor: Color(0xff3550B4),
            //     progressBgColor: Colors.white70,
            //     msgColor: Colors.white,
            //     valueColor: Colors.white);
            selectedCVFilePath == null;
            uploadUserVisumeData(selectedCVFilePath,selectedVisumeFilePath,context);
            // uploadResume(context);//tariq you comment this
          },

        ),
      ),
    );
  }

  Future<String?> pickUserVisume() async {
    selectedVisumefile = await visumepicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'avi', 'mov']// Add more video file extensions if needed
    );//FilePicker.platform.pickFiles()

    if (selectedVisumefile != null && selectedVisumefile!.files.isNotEmpty) {
      final file = selectedVisumefile!.files.single;
      selectedVisumeFilePath = file.path;
      setState(() {});
      return selectedVisumeFilePath;
    }

    return null;
  }
  Future<void> uploadUserVisumeData(String? cvPath, String? resumePath,context) async {
    // if (cvPath != null) {
      var headers = {'Cookie': 'session=da9df2f965aaa1d3c0dc17232c36844faff5c830'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://girlzwhosellcareerconextions.com/API/upload_cvs.php'),
      );

      request.fields['user_id'] = userId!;

      if (cvPath != null){
        request.files.add(
          await http.MultipartFile.fromPath('cv', cvPath),
        );
      }

      if(resumePath !=  null){
        request.files.add(
          await http.MultipartFile.fromPath('resume', resumePath),
        );
      }

      request.headers.addAll(headers);

      try {
        final response = await request.send();
        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          String jsonbody = await response.stream.bytesToString();
          files_upload_model = Files_Upload_Model.fromJson(jsonDecode(jsonbody));

          if (files_upload_model.message == "Successful Upload"){
            getUserDataLink();
            // progressD.close();
            Fluttertoast.showToast(
                msg: "File is Updated Successfully!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3);
          }else
          //   if(files_upload_model.message == "Please Upload CV"){
          //   progressD.close();
          //   Fluttertoast.showToast(
          //       msg: "You must have to Pick CV/Resume.",
          //       toastLength: Toast.LENGTH_SHORT,
          //       gravity: ToastGravity.CENTER,
          //       timeInSecForIosWeb: 3);
          //   // pd.update(msg: "you have to pick Resume File");
          //   print("you have to pick Resume File");
          // }else
          {
            // progressD.close();
            Fluttertoast.showToast(
                msg: "File is not uploaded. Please Try Again!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3);
            // pd.update(msg: "File is not uploaded");
            print('File is not uploaded');
          }

        } else {
          print(response.reasonPhrase);
        }
      } catch (e) {
        print('Error: $e');
      }
    // }else{
    //   progressD.close();
    //
    //   Fluttertoast.showToast(
    //       msg: "You must have to Pick CV/Resume.",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 3);
    // }
  }

  Future<void> getUserDataLink() async {
    var request = http.Request('GET', Uri.parse('https://girlzwhosellcareerconextions.com/API/cvs_links.php?seeker_id=${user_id}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(responseString);

      GetUserDataLink userDataLink = GetUserDataLink.fromJson(jsonMap);

      // Access resume and cV strings
      if (userDataLink.seekerDetails != null && userDataLink.seekerDetails!.isNotEmpty) {

        setState(() {
          VisumeUrl = userDataLink.seekerDetails![0].resume;
          CVurl = userDataLink.seekerDetails![0].cV;
          // isSelected = true;
        });


        // Use the resumeString and cvString as needed
        print('Resume: $VisumeUrl');
        print('CV: $CVurl');
      }
    } else {
      print(response.reasonPhrase);
    }
  }


}

