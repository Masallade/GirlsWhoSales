import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/model/utils.dart';
import 'package:girlzwhosell/screens/applied_success_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class JobApply extends StatefulWidget {
  final JobDetails jobDetails;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final cv;
  final resumee;
  const JobApply(
      {Key key,
      this.jobDetails,
      this.uName,
      this.password,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_saved,
      this.total_applied,
      this.cv,
      this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';

  @override
  _JobApplyState createState() => _JobApplyState(
      uName: uName,
      password: password,
      jobDetails: jobDetails,
      userDetails: userDetails,
      user_Id: user_Id,
      firstName: firstName,
      total_applied: total_applied,
      total_saved: total_saved,
      cv: cv,
      resumee: resumee);
}

class _JobApplyState extends State<JobApply> {
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  bool isLiked;
  final JobDetails jobDetails;
  final List<SeekerDetails> userDetails;

  var result;
  var Result;
  String cv;
  String resumee;

  _JobApplyState(
      {this.uName,
      this.password,
      this.jobDetails,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.cv,
      this.resumee});

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
  String uploadurl = base_url + "apply_job.php";
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    print("APPlyScreenname: $uName");
    print("APPlyScreenpass: $password");
    print("APPlyScreenuserid: $user_Id");
    print('APPlyScreenfirstName : $firstName');
    print('video Link : $cv');
  }

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
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              )),
                      onTap: () {
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
                            color: Colors.blueGrey[300]
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
    selectedfile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    setState(() {}); //update the UI so that file name is shown
  }

  uploadResume(context) async {
    // String fileName = selectedfile.files.single.path.split('/').last;
    // String fileName2 = _image.path.split('/').last;
    FormData formdata = FormData.fromMap({
      "user_id": user_Id,
      "job_id": jobDetails.id,
      "emp_id": jobDetails.employerId,
      "pdf_cv": '',
      // await MultipartFile.fromFile(selectedfile.files.single.path,
      //     filename: fileName
      //     //show only filename from path
      //     ),
      "video_cv": '',
      // await MultipartFile.fromFile(_image.path, filename: fileName2
      //     //show only filename from path
      //     ),
      "applied_date": getCurrentDate(),
    });

    response = await dio.post(
      uploadurl,
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
      print("response of Jobapply");
      print(response.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobApplied(
                  uName: this.uName,
                  password: this.password,
                  user_Id: user_Id,
                  jobDetails: jobDetails,
                  firstName: firstName,
                  total_applied: total_applied,
                  total_saved: total_saved)));
      // uploadurl();
      //print response from server
    } else {
      utils().showDialogCustom(
          context,
          "Upload Failed !",
          response.statusCode == 100
              ? " Please Connect Your Internet Connection  Or \n Server returned failure. Please try to restart the application."
              : response.statusCode,
          "OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            //  color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Apply Job',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 33,
              ),
              Container(
                  width: 90.0,
                  height: 90.0,
                  child: Image.network('${jobDetails.companyLogo}')),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('You Will Applying to ',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18.0,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 112, 126, 148),
                          )),
                    ),
                    Text('${jobDetails.companyName ?? ""}',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[800],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('as ',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 112, 126, 148),
                        )),
                    Text('${jobDetails.title != null ? jobDetails.title : ''}',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.pinkAccent[200],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    height: 500,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text('Resume',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ]),
                          //  SizedBox(height: 20),
                          Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(20),
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey[300]),
                              ),
                              child: ListTile(
                                leading: Container(
                                    height: 50,
                                    width: 50,
                                    child:
                                        Image.asset('assets/images/pdfbg.png')),
                                title: Text('${widget.resumee}'),
                                // subtitle: Text('1 day ago', style: subtitleStyle),
                              )),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text('Video Cv',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ]),
                          // SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[300]),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: SizeConfig.screenWidth,
                                  child: Image.asset('assets/images/cvbg.png'),
                                ),
                                Text('${widget.cv}'),
                                // Text('1 day ago', style: subtitleStyle),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              showImage(),
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 12.0),
              //       child: Text('*' ,textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 30),),
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
              //   child: Container(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 //  color: Colors.blue,
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   selectFile();
              //                 },
              //                 child: ListTile(
              //                   leading: Image.asset('assets/images/cvIcon.png'),
              //                   title: selectedfile == null
              //                       ? Text(
              //                     'Upload Cv/Resume',
              //                     style: TextStyle(
              //                         height: 1.5,
              //                         fontSize: 17.0,
              //                         fontFamily: 'Questrial',
              //                         fontWeight: FontWeight.w400,
              //                         color: Colors.blueGrey[400]
              //                       /* letterSpacing: 0.0, */
              //                     ),
              //                   )
              //                       : Text(basename(selectedfile.files.single.path)),
              //                   trailing: selectedfile != null
              //                       ? Icon(
              //                     Icons.check,
              //                     color: Colors.green,
              //                   )
              //                       : null,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20,
              //           ),
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   _showPicker(context);
              //                 },
              //                 child: ListTile(
              //                     leading: Image.asset('assets/images/cvIcon.png'),
              //                     title: _image == null
              //                         ? Text(
              //                       'Upload Visume!',
              //                       style: TextStyle(
              //                           height: 1.5,
              //                           fontSize: 17.0,
              //                           fontFamily: 'Questrial',
              //                           fontWeight: FontWeight.w400,
              //                           color: Colors.blueGrey[300]
              //                         /* letterSpacing: 0.0, */
              //                       ),
              //                     )
              //                         : Text(basename(_image.path),
              //                     ),
              //                     trailing: _image != null
              //                         ? Icon(
              //                       Icons.check,
              //                       color: Colors.green,
              //                     )
              //                         : null),
              //               ),
              //             ),
              //           )
              //         ],
              //       )),
              // ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        uploadResume(context);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  progress != null
                      ? Text(progress,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 17.0,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              ))
                      : Text(''),
                ],
              ),
            ]),
      ),
    );
  }

  applynow() {
    http.post(Uri.parse(JobApply.uploadEndPoint), body: {
      "user_id": user_Id,
      "job_id": jobDetails.id,
      "emp_id": jobDetails.employerId,
      "cover_letter": "123456",
      // "pdf_cv":cv,
      // "video_cv": resumee,
      "applied_date": getCurrentDate(),
    }).then((result) {
      Result = result.statusCode;
      print('Appliedresult$Result');
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (result.statusCode == 200) {
        // Fluttertoast.showToast(
        //     msg: "Job Applied Successfully",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.SNACKBAR,
        //     timeInSecForIosWeb: 1).then((value) =>
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApplied(uName: this.uName,password: this.password, user_Id: user_Id,jobDetails: jobDetails,firstName: firstName,total_applied:total_applied,total_saved: total_saved,)));
      }
    }).catchError((error) {
      setStatus(error);
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  getCurrentDate() {
    ///Call Your Current Date
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}

class SearchApply extends StatefulWidget {
  final SearchModel joblist;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final cv;
  final resumee;
  const SearchApply(
      {Key key,
      this.joblist,
      this.uName,
      this.password,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_saved,
      this.total_applied,
      this.cv,
      this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';

  @override
  _SearchApplyState createState() => _SearchApplyState(
      uName: uName,
      password: password,
      joblist: joblist,
      userDetails: userDetails,
      user_Id: user_Id,
      firstName: firstName,
      total_applied: total_applied,
      total_saved: total_saved,
      cv: cv,
      resumee: resumee);
}

class _SearchApplyState extends State<SearchApply> {
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  bool isLiked;
  final SearchModel joblist;
  final List<SeekerDetails> userDetails;

  var result;
  var Result;
  String cv;
  String resumee;

  _SearchApplyState(
      {this.uName,
      this.password,
      this.joblist,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.cv,
      this.resumee});

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
  String uploadurl = base_url + "apply_job.php";

  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    print("APPlyScreenname: $uName");
    print("APPlyScreenpass: $password");
    print("APPlyScreenuserid: $user_Id");
    print('APPlyScreenfirstName : $firstName');
    print('cv : $cv');
    print('resume : $resumee');
  }

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
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              )),
                      onTap: () {
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
                            color: Colors.blueGrey[300]
                            /* letterSpacing: 0.0, */
                            )),
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
        });
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
    selectedfile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    setState(() {}); //update the UI so that file name is shown
  }

  Future uploadResume(context) async {
   // String fileName = selectedfile.files.single.path.split('/').last;
    //String fileName2 = _image.path.split('/').last;
    FormData formdata = FormData.fromMap({
      "user_id": user_Id,
      "job_id": joblist.id,
      "emp_id": joblist.employerId,
      "pdf_cv": '',
      // await MultipartFile.fromFile(selectedfile.files.single.path,
      //     filename: fileName
      //     //show only filename from path
      //     ),
      "video_cv": '',
    //   await MultipartFile.fromFile(
    //     _image.path,
    //     filename: fileName2,
    //     //show only filename from path
    //   ),
      "applied_date": getCurrentDate(),
     });

    response = await dio.post(
      uploadurl,
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
      print("response of Jobapply");
      print(response.toString());
    //  print('${selectedfile.files.single.path}');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobApplied(
                  uName: this.uName,
                  password: this.password,
                  user_Id: user_Id,
                  firstName: firstName))); // uploadurl();
      //print response from server
    } else {
      utils().showDialogCustom(
          context,
          "Upload Failed !",
          response.statusCode == 100
              ? " Please Connect Your Internet Connection  Or \n Server returned failure. Please try to restart the application."
              : response.statusCode,
          "OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            //  color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Apply Job',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 33,
              ),
              Container(
                  width: 90.0,
                  height: 90.0,
                  child: Image.network('${joblist.companyLogo}')),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('You Will Applying to ',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18.0,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 112, 126, 148),
                          )),
                    ),
                    Text('${joblist.companyName ?? ""}',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[800],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('as ',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 112, 126, 148),
                        )),
                    Text('${joblist.title != null ? joblist.title : ''}',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.pinkAccent[200],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    height: 500,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text('Resume',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                                // //InkWell(
                                //    //  onTap: (){
                                //    //    // showModalBottomSheet<void>(
                                //    //    //     shape: RoundedRectangleBorder(
                                //    //    //       borderRadius: BorderRadius.vertical(
                                //    //    //         top: Radius.circular(30),
                                //    //    //       ),
                                //    //    //     ),
                                //    //    //     // context and builder are
                                //    //    //     // required properties in this widget
                                //    //    //     context: context,
                                //    //    //     builder: (BuildContext context) {
                                //    //    //
                                //    //    //       // we set up a container inside which
                                //    //    //       // we create center column and display text
                                //    //    //       return Container(
                                //    //    //         decoration: BoxDecoration(
                                //    //    //           borderRadius: BorderRadius.only( topLeft: Radius.circular(30), topRight: Radius.circular(30),),
                                //    //    //         ),
                                //    //    //         height: 250,
                                //    //    //         child: Center(
                                //    //    //           child: Column(
                                //    //    //             mainAxisAlignment: MainAxisAlignment.center,
                                //    //    //             children: <Widget>[
                                //    //    //               Align(
                                //    //    //                   alignment:Alignment.centerLeft,
                                //    //    //                   child: Padding(
                                //    //    //                     padding: const EdgeInsets.only(left:20.0),
                                //    //    //                     child: Text('Resume' , style: HeadingStyle,),
                                //    //    //                   )),
                                //    //    //               Padding(
                                //    //    //                 padding: const EdgeInsets.only( top:30,left:20,right:20),
                                //    //    //                 child: selectedfile == null
                                //    //    //                     ?  DottedBorder(
                                //    //    //                   strokeWidth: 1.0,
                                //    //    //                   color: Colors.grey[300],
                                //    //    //                   // padding: EdgeInsets.all(4),
                                //    //    //                   dashPattern: [9, 5],
                                //    //    //                   child: GestureDetector(
                                //    //    //                     onTap: () {
                                //    //    //                       selectFile();
                                //    //    //                     },
                                //    //    //                     child: ListTile(
                                //    //    //                       leading: Image.asset('assets/images/cvIcon.png'),
                                //    //    //                       title: Text(
                                //    //    //                         'Upload Cv/Resume',
                                //    //    //                         style: TextStyle(
                                //    //    //                             height: 1.5,
                                //    //    //                             fontSize: 17.0,
                                //    //    //                             fontFamily: 'Questrial',
                                //    //    //                             fontWeight: FontWeight.w400,
                                //    //    //                             color: Colors.blueGrey[400]
                                //    //    //                           /* letterSpacing: 0.0, */
                                //    //    //                         ),
                                //    //    //                       ),
                                //    //    //                       trailing: selectedfile != null
                                //    //    //                           ? Icon(
                                //    //    //                         Icons.check,
                                //    //    //                         color: Colors.green,
                                //    //    //                       )
                                //    //    //                           : null,
                                //    //    //                     ),
                                //    //    //                   ),
                                //    //    //                 ): Text(basename(selectedfile.path) ,
                                //    //    //                 ) ),
                                //    //    //             ],
                                //    //    //           ),
                                //    //    //         ),
                                //    //    //       );
                                //    //    //     });
                                //    //    //  _imgFromGallery();
                                //    // //   Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadResume(uName:uName,password: password, user_id: user_Id,joblist: joblist,firstName: firstName,)));
                                //    //  },
                                //      Padding(
                                //       padding: const EdgeInsets.only(right: 12.0),
                                //       child: selectedfile == null ? Image.asset('assets/images/edit.png') : FittedBox(
                                //         child: Text(basename(selectedfile.path),
                                //     ),
                                //       )
                                // //),
                                //      )
                              ]),
                          //  SizedBox(height: 20),
                          Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(20),
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey[300]),
                              ),
                              child: ListTile(
                                leading: Container(
                                    height: 50,
                                    width: 50,
                                    child:
                                        Image.asset('assets/images/pdfbg.png')),
                                title: Text('${widget.cv}'),
                                // subtitle: Text('1 day ago', style: subtitleStyle),
                              )),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text('Video Cv',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                                // InkWell(
                                //     onTap: (){
                                //       showModalBottomSheet<void>(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.vertical(
                                //               top: Radius.circular(30),
                                //             ),
                                //           ),
                                //           // context and builder are
                                //           // required properties in this widget
                                //           context: context,
                                //           builder: (BuildContext context) {
                                //
                                //             // we set up a container inside which
                                //             // we create center column and display text
                                //             return Container(
                                //               decoration: BoxDecoration(
                                //                 borderRadius: BorderRadius.only( topLeft: Radius.circular(30), topRight: Radius.circular(30),),
                                //               ),
                                //               height: 250,
                                //               child: Center(
                                //                 child: Column(
                                //                   mainAxisAlignment: MainAxisAlignment.center,
                                //                   children: <Widget>[
                                //                     Align(
                                //                         alignment:Alignment.centerLeft,
                                //                         child: Padding(
                                //                           padding: const EdgeInsets.only(left:20.0),
                                //                           child: Text('Video Cv' , style: HeadingStyle,),
                                //                         )),
                                //                     Padding(
                                //                       padding: const EdgeInsets.only( top:30,left:20,right:20),
                                //                       child: DottedBorder(
                                //                         strokeWidth: 1.0,
                                //                         color: Colors.grey[300],
                                //                         // padding: EdgeInsets.all(4),
                                //                         dashPattern: [9, 5],
                                //                         child: Container(
                                //                           height: 70,
                                //                           width: SizeConfig.screenWidth,
                                //                           decoration: BoxDecoration(
                                //                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                //                           ),
                                //                           child: GestureDetector(
                                //                             onTap: () {
                                //                               _showPicker(context);
                                //                             },
                                //                             child: ListTile(
                                //                                 leading: Image.asset('assets/images/cvIcon.png'),
                                //                                 title: selectedfile2 == null
                                //                                     ? Text(
                                //                                   'Upload Visume!',
                                //                                   style: TextStyle(
                                //                                       height: 1.5,
                                //                                       fontSize: 17.0,
                                //                                       fontFamily: 'Questrial',
                                //                                       fontWeight: FontWeight.w400,
                                //                                       color: Colors.blueGrey[300]
                                //                                     /* letterSpacing: 0.0, */
                                //                                   ),
                                //                                 )
                                //                                     : Text(basename(selectedfile2.path),
                                //                                 ),
                                //                                 trailing: selectedfile2 != null
                                //                                     ? Icon(
                                //                                   Icons.check,
                                //                                   color: Colors.green,
                                //                                 )
                                //                                     : null),
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             );
                                //           });
                                //       //  _imgFromGallery();
                                //       ///  Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCV()));
                                //     },
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(right: 12.0),
                                //       child: Image.asset('assets/images/edit.png'),
                                //     )),
                              ]),
                          // SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[300]),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: SizeConfig.screenWidth,
                                  child: Image.asset('assets/images/cvbg.png'),
                                ),
                                Text('${widget.resumee}'),
                                // Text('1 day ago', style: subtitleStyle),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              showImage(),
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 12.0),
              //       child: Text('*' ,textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 30),),
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
              //   child: Container(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 //  color: Colors.blue,
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   selectFile();
              //                 },
              //                 child: ListTile(
              //                   leading: Image.asset('assets/images/cvIcon.png'),
              //                   title: selectedfile == null
              //                       ? Text(
              //                     'Upload Cv/Resume',
              //                     style: TextStyle(
              //                         height: 1.5,
              //                         fontSize: 17.0,
              //                         fontFamily: 'Questrial',
              //                         fontWeight: FontWeight.w400,
              //                         color: Colors.blueGrey[400]
              //                       /* letterSpacing: 0.0, */
              //                     ),
              //                   )
              //                       : Text(basename(selectedfile.files.single.path)),
              //                   trailing: selectedfile != null
              //                       ? Icon(
              //                     Icons.check,
              //                     color: Colors.green,
              //                   )
              //                       : null,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20,
              //           ),
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   _showPicker(context);
              //                 },
              //                 child: ListTile(
              //                     leading: Image.asset('assets/images/cvIcon.png'),
              //                     title: _image == null
              //                         ? Text(
              //                       'Upload Visume!',
              //                       style: TextStyle(
              //                           height: 1.5,
              //                           fontSize: 17.0,
              //                           fontFamily: 'Questrial',
              //                           fontWeight: FontWeight.w400,
              //                           color: Colors.blueGrey[300]
              //                         /* letterSpacing: 0.0, */
              //                       ),
              //                     )
              //                         : Text(basename(_image.path),
              //                     ),
              //                     trailing: _image != null
              //                         ? Icon(
              //                       Icons.check,
              //                       color: Colors.green,
              //                     )
              //                         : null),
              //               ),
              //             ),
              //           )
              //         ],
              //       )),
              // ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        uploadResume(context);
                        // applynow();
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  progress != null
                      ? Text(progress,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 17.0,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              ))
                      : Text(''),
                ],
              ),
            ]),
      ),
    );
  }

  applynow() {
    http.post(Uri.parse(JobApply.uploadEndPoint), body: {
      "user_id": user_Id,
      "job_id": joblist.id,
      "emp_id": joblist.employerId,
      "cover_letter": "123456",
      // "pdf_cv":cv,
      // "video_cv": resumee,
      "applied_date": getCurrentDate(),
    }).then((result) {
      Result = result.statusCode;
      print('Appliedresult$Result');
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (result.statusCode == 200) {
        // Fluttertoast.showToast(
        //     msg: "Job Applied Successfully",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.SNACKBAR,
        //     timeInSecForIosWeb: 1).then((value) =>
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApplied(uName: this.uName,password: this.password, user_Id: user_Id,jobDetails: jobDetails,firstName: firstName,total_applied:total_applied,total_saved: total_saved,)));
      }
    }).catchError((error) {
      setStatus(error);
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  getCurrentDate() {
    ///Call Your Current Date
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}

class SavedJobApply extends StatefulWidget {
  final FavoriteJobs favoriteJobs;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final cv;
  final resumee;
  const SavedJobApply(
      {Key key,
      this.favoriteJobs,
      this.uName,
      this.password,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_saved,
      this.total_applied,
      this.cv,
      this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';

  static final String uploadsavejob = base_url + 'saved_jobs.php';

  static final String alreayApplied = base_url + 'applied_job.php';

  @override
  _SavedJobApplyState createState() => _SavedJobApplyState(
      uName: uName,
      password: password,
      favoriteJobs: favoriteJobs,
      userDetails: userDetails,
      user_Id: user_Id,
      firstName: firstName,
      total_applied: total_applied,
      total_saved: total_saved,
      cv: cv,
      resumee: resumee);
}

class _SavedJobApplyState extends State<SavedJobApply> {
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  bool isLiked;
  final FavoriteJobs favoriteJobs;
  final List<SeekerDetails> userDetails;

  var result;
  var Result;
  final cv;
  final resumee;

  _SavedJobApplyState(
      {this.uName,
      this.password,
      this.favoriteJobs,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.cv,
      this.resumee});

  File _image;
  final picker = ImagePicker();
  FilePickerResult selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Slip';
  String uploadurl = base_url + "apply_job.php";
  @override
  void initState() {
    super.initState();
    print("name: $uName");
    setState(() {
      print('jobid : ${favoriteJobs.jobId}');
      print('empid : ${favoriteJobs.employerId}');
    });

    print("pass: $password");
    print("userid: $user_Id");
    print('firstName : $firstName');
  }

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
                            // color: Colors.blueGrey[300]
                            /* letterSpacing: 0.0, */
                          )),
                      onTap: () {
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
                          //  color: Colors.blueGrey[300]
                          /* letterSpacing: 0.0, */
                        )),
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
        });
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
    selectedfile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    setState(() {}); //update the UI so that file name is shown
  }

  uploadResume(context) async {
    FormData formdata = FormData.fromMap({
      "user_id": user_Id,
      "job_id": favoriteJobs.jobId,
      "emp_id": favoriteJobs.employerId,
      "cover_letter": "123456",
      "video_cv": '',
      // await MultipartFile.fromFile(_image.path,
      //     filename: basename(_image.path)
      //     //show only filename from path
      //     ),
      "pdf_cv": '',
      // await MultipartFile.fromFile(selectedfile?.files.single.path,
      //     filename: basename(selectedfile?.files.single.path)
      //     //show only filename from path
      //     ),
      "applied_date": getCurrentDate(),
    });

    response = await dio.post(
      uploadurl,
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
      print("response of Registration");
      print(response.toString());
      print("jobid");
      print('${favoriteJobs.jobId}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SavedJobApplied(
                    uName: this.uName,
                    password: this.password,
                    user_Id: user_Id,
                    favoriteJobs: favoriteJobs,
                    firstName: firstName,
                    total_applied: total_applied,
                    total_saved: total_saved,
                  ))); // uploadurl();
      //print response from server
    } else {
      utils().showDialogCustom(
          context,
          "Upload Failed !",
          response.statusCode == 100
              ? " Please Connect Your Internet Connection  Or \n Server returned failure. Please try to restart the application."
              : response.statusCode,
          "OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            //  color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Apply Job',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 90.0,
                  height: 90.0,
                  child: Image.network('${favoriteJobs.companyLogo ?? ""}')),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('You Will Applying to ',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18.0,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 112, 126, 148),
                          )),
                    ),
                    Text(
                        '${favoriteJobs.companyName != null ? favoriteJobs.companyName : ''}',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[800],
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('as ',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18.0,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 126, 148),
                      )),
                  Text(
                      '${favoriteJobs.title != null ? favoriteJobs.title : ''}',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Colors.pinkAccent[200],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    height: 500,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 24),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Resume',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                ]),
                          ),
                          //  SizedBox(height: 20),
                          Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(20),
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey[300]),
                              ),
                              child: ListTile(
                                leading: Container(
                                    height: 50,
                                    width: 50,
                                    child:
                                        Image.asset('assets/images/pdfbg.png')),
                                title: Text('${widget.resumee}'),
                                //   subtitle: Text('1 day ago', style: subtitleStyle),
                              )),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Video Cv',
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1.5,
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    )),
                              ]),
                          // SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[300]),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: SizeConfig.screenWidth,
                                  child: Image.asset('assets/images/cvbg.png'),
                                ),
                                Text('${widget.cv}'),
                                //  Text('1 day ago', style: subtitleStyle),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              showImage(),
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 12.0),
              //       child: Text('*' ,textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 30),),
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
              //   child: Container(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 //  color: Colors.blue,
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   selectFile();
              //                 },
              //                 child: ListTile(
              //                   leading: Image.asset('assets/images/cvIcon.png'),
              //                   title: selectedfile == null
              //                       ? Text(
              //                     'Upload Cv/Resume',
              //                     style: TextStyle(
              //                         height: 1.5,
              //                         fontSize: 17.0,
              //                         fontFamily: 'Questrial',
              //                         fontWeight: FontWeight.w400,
              //                         color: Colors.blueGrey[400]
              //                       /* letterSpacing: 0.0, */
              //                     ),
              //                   )
              //                       : Text(basename(selectedfile.files.single.path)),
              //                   trailing: selectedfile != null
              //                       ? Icon(
              //                     Icons.check,
              //                     color: Colors.green,
              //                   )
              //                       : null,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20,
              //           ),
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   _showPicker(context);
              //                 },
              //                 child: ListTile(
              //                     leading: Image.asset('assets/images/cvIcon.png'),
              //                     title: _image == null
              //                         ? Text(
              //                       'Upload Visume!',
              //                       style: TextStyle(
              //                           height: 1.5,
              //                           fontSize: 17.0,
              //                           fontFamily: 'Questrial',
              //                           fontWeight: FontWeight.w400,
              //                           color: Colors.blueGrey[300]
              //                         /* letterSpacing: 0.0, */
              //                       ),
              //                     )
              //                         : Text(basename(_image.path),
              //                     ),
              //                     trailing: _image != null
              //                         ? Icon(
              //                       Icons.check,
              //                       color: Colors.green,
              //                     )
              //                         : null),
              //               ),
              //             ),
              //           )
              //         ],
              //       )),
              // ),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                    // margin: EdgeInsets.only(bottom: 25.0),
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        uploadResume(context);
                        // applynow();
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  progress != null
                      ? Text(progress,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 17.0,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              ))
                      : Text(''),
                ],
              ),
            ]),
      ),
    );
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  getCurrentDate() {
    ///Call Your Current Date
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}

////for See All Jobs Details For the job
class SavedJobApply1 extends StatefulWidget {
  final SavedJobs favoriteJobs;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final cv;
  final resumee;
  const SavedJobApply1(
      {Key key,
      this.favoriteJobs,
      this.uName,
      this.password,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_saved,
      this.total_applied,
      this.cv,
      this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';

  static final String uploadsavejob = base_url + 'saved_jobs.php';

  static final String alreayApplied = base_url + 'applied_job.php';

  @override
  _SavedJobApply1State createState() => _SavedJobApply1State(
      uName: uName,
      password: password,
      favoriteJobs: favoriteJobs,
      userDetails: userDetails,
      user_Id: user_Id,
      firstName: firstName,
      total_applied: total_applied,
      total_saved: total_saved,
      cv: cv,
      resumee: resumee);
}

class _SavedJobApply1State extends State<SavedJobApply1> {
  final uName;
  final password;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  bool isLiked;
  final SavedJobs favoriteJobs;
  final List<SeekerDetails> userDetails;

  var result;
  var Result;
  String cv;
  String resumee;

  _SavedJobApply1State(
      {this.uName,
      this.password,
      this.favoriteJobs,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.cv,
      this.resumee});

  File _image;
  final picker = ImagePicker();
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
  String uploadurl = base_url + "apply_job.php";
  @override
  void initState() {
    super.initState();
    print("name: $uName");
    setState(() {
      print('jobid : ${favoriteJobs.jobId}');
      print('empid : ${favoriteJobs.employerId}');
    });

    print("pass: $password");
    print("userid: $user_Id");
    print('firstName : $firstName');
  }

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
    setState(() {
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
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              )),
                      onTap: () {
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
                            color: Colors.blueGrey[300]
                            /* letterSpacing: 0.0, */
                            )),
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
        });
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
    selectedfile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    setState(() {}); //update the UI so that file name is shown
  }

  uploadResume(context) async {
  //  String fileName = selectedfile.files.single.path.split('/').last;
    //String fileName2 = _image.path.split('/').last;
    FormData formdata = FormData.fromMap({
      "user_id": user_Id,
      "job_id": favoriteJobs.jobId,
      "emp_id": favoriteJobs.employerId,
      "cover_letter": "123456",
      "video_cv":'',
      // await MultipartFile.fromFile(_image.path, filename: fileName
      //     //show only filename from path
      //     ),
      "pdf_cv": '',
      // await MultipartFile.fromFile(selectedfile.files.single.path,
      //     filename: fileName2
      //     //show only filename from path
      //     ),
      "applied_date": getCurrentDate(),
    });

    response = await dio.post(
      uploadurl,
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
      print("response of Registration");
      print(response.toString());
      print("jobid");
      print('${favoriteJobs.jobId}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SavedJobApplied1(
                    uName: this.uName,
                    password: this.password,
                    user_Id: user_Id,
                    favoriteJobs: favoriteJobs,
                    firstName: firstName,
                    total_applied: total_applied,
                    total_saved: total_saved,
                  ))); // uploadurl();
      //print response from server
    } else {
      utils().showDialogCustom(
          context,
          "Upload Failed !",
          response.statusCode == 100
              ? " Please Connect Your Internet Connection  Or \n Server returned failure. Please try to restart the application."
              : response.statusCode,
          "OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            //  color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Apply Job',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 90.0,
                  height: 90.0,
                  child: Image.network('${favoriteJobs.companyLogo ?? ""}')),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('You Will Applying to ',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18.0,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 112, 126, 148),
                          )),
                    ),
                    Text(
                        '${favoriteJobs.companyName != null ? favoriteJobs.companyName : ''}',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.blue[800],
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('as ',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24.0,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 126, 148),
                      )),
                  Text(
                      '${favoriteJobs.title != null ? favoriteJobs.title : ''}',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.pinkAccent[200],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    height: 500,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 24),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Resume',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                ]),
                          ),
                          //  SizedBox(height: 20),
                          Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(20),
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey[300]),
                              ),
                              child: ListTile(
                                leading: Container(
                                    height: 50,
                                    width: 50,
                                    child:
                                        Image.asset('assets/images/pdfbg.png')),
                                title: Text('${widget.cv ?? ''}'),
                              )
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Video Cv',
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1.5,
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    )),
                              ]),
                          // SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[300]),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: SizeConfig.screenWidth,
                                  child: Image.asset('assets/images/cvbg.png'),
                                ),
                                Text('${widget.resumee ?? ''}'),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              showImage(),
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 12.0),
              //       child: Text('*' ,textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 30),),
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
              //   child: Container(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 //  color: Colors.blue,
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   selectFile();
              //                 },
              //                 child: ListTile(
              //                   leading: Image.asset('assets/images/cvIcon.png'),
              //                   title: selectedfile == null
              //                       ? Text(
              //                     'Upload Cv/Resume',
              //                     style: TextStyle(
              //                         height: 1.5,
              //                         fontSize: 17.0,
              //                         fontFamily: 'Questrial',
              //                         fontWeight: FontWeight.w400,
              //                         color: Colors.blueGrey[400]
              //                       /* letterSpacing: 0.0, */
              //                     ),
              //                   )
              //                       : Text(basename(selectedfile.files.single.path)),
              //                   trailing: selectedfile != null
              //                       ? Icon(
              //                     Icons.check,
              //                     color: Colors.green,
              //                   )
              //                       : null,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20,
              //           ),
              //           DottedBorder(
              //             strokeWidth: 1.0,
              //             color: Colors.grey[300],
              //             // padding: EdgeInsets.all(4),
              //             dashPattern: [9, 5],
              //             child: Container(
              //               height: 70,
              //               width: SizeConfig.screenWidth,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //               ),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   _showPicker(context);
              //                 },
              //                 child: ListTile(
              //                     leading: Image.asset('assets/images/cvIcon.png'),
              //                     title: _image == null
              //                         ? Text(
              //                       'Upload Visume!',
              //                       style: TextStyle(
              //                           height: 1.5,
              //                           fontSize: 17.0,
              //                           fontFamily: 'Questrial',
              //                           fontWeight: FontWeight.w400,
              //                           color: Colors.blueGrey[300]
              //                         /* letterSpacing: 0.0, */
              //                       ),
              //                     )
              //                         : Text(basename(_image.path),
              //                     ),
              //                     trailing: _image != null
              //                         ? Icon(
              //                       Icons.check,
              //                       color: Colors.green,
              //                     )
              //                         : null),
              //               ),
              //             ),
              //           )
              //         ],
              //       )),
              // ),
              // SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        uploadResume(context);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  progress != null
                      ? Text(progress,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 17.0,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey[300]
                              /* letterSpacing: 0.0, */
                              ))
                      : Text(''),
                ],
              ),
            ]),
      ),
    );
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  getCurrentDate() {
    ///Call Your Current Date
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}
