import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:path/path.dart';

class UploadResume extends StatefulWidget{

  final uName;
  final password;
  final user_id;
  final SearchModel joblist;
  final firstName;
  UploadResume({this.uName,this.password ,this.user_id ,this.joblist ,this.firstName});

  @override
  State<StatefulWidget> createState() {
    return _UploadResume(uName: uName,password: password ,user_id: user_id , joblist: joblist);
  }
}

class _UploadResume extends State<UploadResume>{



  final uName;
  final password;
  final user_id;
  bool isLiked;
  final SearchModel joblist;
  final firstName;
  _UploadResume({this.uName,this.password ,this.user_id,this.joblist, this.firstName});


  FilePickerResult selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();
  Future<File> file;
  String base64Image;
  File tmpFile;
  String uploadurl = base_url + "apply_job.php";

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
    selectedfile =  await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc' ,'docx'],
    );

    setState((){}); //update the UI so that file name is shown
  }

  uploadResume(context) async {

    FormData formdata = FormData.fromMap({
      "user_id": user_id,
      "pdf_cv": await MultipartFile.fromFile(
          selectedfile == null ? null : selectedfile.files.single.path,
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
          SearchApply(uName: uName,
              password: password,
              joblist: joblist,
              user_Id: user_id,
            firstName:firstName,
          )));
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
                child: Text("Let's Change Your\n Resume/Visume! " ,
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
                "Change Your Cv/ Resume \n"
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
            'Change Resume',
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