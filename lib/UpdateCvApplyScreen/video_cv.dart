// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';


class VideoCv extends StatefulWidget{

  final uName;
  final password;
  final user_id;
  bool isLiked;
  final SearchModel joblist;
  final firstName;

  VideoCv({this.uName,this.password ,this.user_id,this.joblist, this.firstName});

  @override
  State<StatefulWidget> createState() {
    return _VideoCv(uName: uName,password: password ,user_id: user_id ,joblist: joblist ,firstName: firstName);
  }
}

class _VideoCv extends State<VideoCv>{



  final uName;
  final password;
  final user_id;
  bool isLiked;
  final SearchModel joblist;
  final firstName;

  _VideoCv({this.uName,this.password ,this.user_id,this.joblist, this.firstName});



  File _image;
  final picker = ImagePicker();
  Response response;
  String progress;
  Dio dio = new Dio();
  Future<File> file;
  String base64Image;
  File tmpFile;

  String uploadurl = base_url + "apply_job.php";

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
      "video_cv": await MultipartFile.fromFile(
          _image == null ? null : _image.path,
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
                            height: 60,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                //   selectFile();
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
            'Change Video CV',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,),
          ),
          onPressed:() {

            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                SearchApply(uName: uName,
                  password: password,
                  joblist: joblist,
                  user_Id: user_id,
                  firstName:firstName,

                )));
            // _upload(file1,user_id);
        //    uploadResume(context);
          },
        ),
      ),
    );
  }
}