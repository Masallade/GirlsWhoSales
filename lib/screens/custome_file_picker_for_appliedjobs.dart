import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/utils.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';


class SelectCV extends StatefulWidget {
  final user_Id;
  String firstName;
  String cv;
  String resumee;

  final JobDetails jobDetails;
  SelectCV({this.user_Id,this.firstName,this.cv,this.resumee ,this.jobDetails});

  @override
  State<StatefulWidget> createState() {return _SelectCV( user_Id: user_Id,firstName: firstName,cv: cv,resumee: resumee,jobDetails: jobDetails);
  }
}

class _SelectCV extends State<SelectCV> {

  final user_Id;
  String firstName;
  String cv;
  String resumee;
  final JobDetails jobDetails;
  _SelectCV({this.user_Id,this.firstName,this.cv,this.resumee,this.jobDetails});
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
  String uploadurl = base_url + "apply_job.php";

  _imgFromCamera() async {
    selectedfile2 = await ImagePicker.pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(seconds: 60));
    setState(() {});

//return selectedfile;
    // setState(() async{
    //   selectedfile = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    // });
  }

  _imgFromGallery() async {
    selectedfile2 = await ImagePicker.pickVideo(source: ImageSource.gallery);

    setState(() {});

    ///return selectedfile;
    // setState(() async {
    //   selectedfile = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    // });
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
    selectedfile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'mp4', 'doc', 'docx'],
      //allowed extension to choose
    );

    //for file_pocker plugin version 2 or 2+
    /*
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'mp4'],
      //allowed extension to choose
    );

    if (result != null) {
      //if there is selected file
      selectedfile = File(result.files.single.path);
    } */

    setState(() {}); //update the UI so that file name is shown
  }

  uploadResume(context) async {
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    FormData formdata = FormData.fromMap({

      "cv": await MultipartFile.fromFile(selectedfile.path,
          filename: basename(selectedfile.path)
        //show only filename from path
      ),
      "resume": await MultipartFile.fromFile(selectedfile2.path,
          filename: basename(selectedfile2.path)
        //show only filename from path
      ),
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
      print("response of Registration");
      print(response.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApply(user_Id: user_Id,)));
      // uploadurl();
      //print response from server
    } else {
      utils().showDialogCustom(context, "Upload Failed !",
          response.statusCode == 100
              ? " Please Connect Your Internet Connection  Or \n Server returned failure. Please try to restart the application."
              : response.statusCode, "OK");
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
      ) ,
      body: Column(
        children: [
          //  BackgroundWidget(size: size),
          //  BackButtonPop(),
          Image.asset(
            'assets/images/logo.png',
            scale: 2.7,
          ),
          //SizedBox(height: 70.0,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  minHeight: 10.0,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                  value: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 280.0),
                  child: Text(
                    '100%',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.blueGrey[300],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Text("Let's crush this!",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: HeadingStyle),
          //Spacer(),
          SizedBox(
            height: 30,
          ),
          Text(
              'Sell yourself by uploading a visume! Let the \n world know of your superpowers!',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: subtitleStyle),

          showImage(),
          //SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
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
                    SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
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
                                  : Text(
                                basename(selectedfile2.path),
                              ),
                              trailing: selectedfile2 != null
                                  ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                                  : null),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          //SizedBox(height: 20,),
          //if selectedfile is null then show empty container
          //if file is selected then show upload button
          // selectedfile == null
          //     ? Container()
          //     :
          //   if file is selected then show upload button
          //     selectedfile == null
          // ? showDialog(
          //       context: context,
          //       builder: (context) => new AlertDialog(
          //         title: new Text('Registration Got Failed' , style: TextStyle(fontSize: 20 , color: Colors.pinkAccent[200] , fontWeight: FontWeight.w600),),
          //         content: new Text('Try Again'),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(5.0))
          //         ),
          //         backgroundColor: Colors.grey,
          //         actions: <Widget>[
          //           new FlatButton(
          //               child: Container(
          //                   margin: EdgeInsets.symmetric(vertical: 5),
          //                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //
          //                   decoration: BoxDecoration(
          //                     color: Colors.black,
          //                     borderRadius: BorderRadius.circular(18),
          //                   ),
          //                   child: new Text(
          //                     'No', style: TextStyle(color: Colors.white),)
          //               ),
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               }
          //           ),
          //           //SizedBox(height: 10),
          //           new FlatButton(
          //             child: Container(
          //                 margin: EdgeInsets.symmetric(vertical: 10),
          //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //
          //                 decoration: BoxDecoration(
          //                   color: Colors.black,
          //                   borderRadius: BorderRadius.circular(18),
          //                 ),
          //                 child: new Text(
          //                   'Yes', style: TextStyle(color: Colors.white),)
          //             ),
          //             onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage())),
          //           ),
          //         ],
          //       ),
          //      ):
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
                )),
          ),
        ],
      ),
    );
  }
}