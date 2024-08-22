import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/utils/constants.dart';
// import 'package:path/path.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/registration/upload_cv.dart';
import 'package:girlzwhosell/utils/size_config.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:sn_progress_dialog/sn_progress_dialog.dart';
// import 'package:dio/dio.dart';
// import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';



class CVUpdate extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;

  const CVUpdate({Key? key, required this.currentUserDetails}) : super(key: key);

  @override
  State<CVUpdate> createState() =>
      _CVUpdateState(currentUserDetails: currentUserDetails);
}

class _CVUpdateState extends State<CVUpdate> {
  final CurrentUserDetails currentUserDetails;
  ReceivePort _receivePort = ReceivePort();

  String? savedDir;
  int? progress;
  _CVUpdateState({required this.currentUserDetails});

  double prog =0;
  // ProgressDialog? progressD;

  // final dio = Dio();
  // final String _downloadPath =
  // "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg";
  // CancelToken _cancelToken;
  // File _imageFile;
  // String  _destPAth;
  // bool _downloading = false;

  // double _downloadRatio = 0.0;
  // String _downloadIndicator = "0.00%";

  // static downloadingCallback(id, status, progress) {
  //
  //   SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");
  //   sendPort.send([id, status, progress]);
  // }


  bool isExpanded = false;
  int? numLines;
  @override
  void initState() {

    super.initState();

    // getApplicationDocumentsDirectory()
    // .then((tempDir) => {_destPAth  =  tempDir.path+'/file.dmg'});

    // FlutterDownloader.registerCallback(downloadingCallback);
    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");
    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      print(progress);
    });
  }

  FilePickerResult? selectedfile;

  // selectFile() async {
  //   selectedfile =  await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'doc' ,'docx'],
  //   );
  //
  //   setState((){}); //update the UI so that file name is shown
  // }


  @override
  Widget build(BuildContext context) {
    // progressD = ProgressDialog(context: context);
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
          'My CV',
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 20.0,
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                // color: Colors.yellow,
                height: SizeConfig.screenHeight,
                child: ListView.builder(
                    itemCount: currentUserDetails.userDetails!.length,
                    itemBuilder: (context, index) {
                      return currentUserDetails.userDetails![index] != null
                          ? Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 27.5,right: 27.5),
                            child: Image.asset(
                              'assets/images/logo.png',
                              scale: 2.7,
                            ),
                          ),
                          SizedBox(
                            height: 33.5,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20.0),
                                child: Text('Resume',
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1.5,
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomFilePicker2(uName: currentUserDetails.uName,password: currentUserDetails.password,user_id: currentUserDetails.user_Id, userDetails:currentUserDetails.userDetails)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 40.0),
                                  child: Image.asset(
                                      'assets/images/edit.png'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 100,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                              Border.all(color: Colors.grey[300]!),
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Image.asset(
                                      'assets/images/pdfbg.png'),
                                ),
                              ),
                              title:
                              // Text(basename(selectedfile.files.single.path) ?? '${userDetails[index].firstname}.pdf' ),
                              Text(
                                '${currentUserDetails.userDetails![index].firstname}.pdf',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),

                              trailing: InkWell(
                                  onTap: () async {
                                    final status = await Permission.storage.request();
                                    if (status.isGranted) {
                                      if (CVurl != null && CVurl !=  ""
                                          && CVurl != "https://girlzwhosellcareerconextions.com/API/"){

                                        // if(Platform.isAndroid){
                                        //   Fluttertoast.showToast(
                                        //       msg: "Your File is Downloading...",
                                        //       toastLength: Toast.LENGTH_SHORT,
                                        //       gravity: ToastGravity.CENTER,
                                        //       backgroundColor: Colors.blueGrey[300],
                                        //       timeInSecForIosWeb: 3);
                                        //
                                        //   DownloadUserFile(CVurl);
                                        // }else  if (Platform.isIOS || Platform.isMacOS){

                                        openUrl(CVurl!);
                                        // }

                                      }else{
                                        Fluttertoast.showToast(
                                            msg: "Sorry You Didn't Upload CV/Resume. \n Please Upload Your CV/Resume First.\n Thank You.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            backgroundColor: Colors.blueGrey[300],
                                            timeInSecForIosWeb: 3);
                                      }

                                    }
                                    else {
                                      print("Permission deined");
                                    }
                                    // showToast(
                                    //   'DownLOad might be FAiled if you didn\'t upload video',
                                    //   context: context,
                                    //   fullWidth: true,
                                    //   backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
                                    //   animation: StyledToastAnimation.slideFromBottomFade,
                                    //   reverseAnimation: StyledToastAnimation.fade,
                                    //   position: StyledToastPosition.bottom,
                                    //   animDuration: Duration(seconds: 1),
                                    //   duration: Duration(seconds: 3),
                                    //   curve: Curves.elasticOut,
                                    //   reverseCurve: Curves.linear,
                                    // );
                                  },
                                  child: Icon(
                                    Icons.download_outlined,
                                    size: 30,
                                    color: Colors.pinkAccent[200],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('Video Cv',
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  uploadVideoCv(uName: currentUserDetails.uName,password: currentUserDetails.password,user_id: currentUserDetails.user_Id, userDetails:currentUserDetails.userDetails)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 40.0),
                                      child: Image.asset(
                                          'assets/images/edit.png'),
                                    )),
                              ]),
                          SizedBox(height: 20),
                          Container(
                            height: 100,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            // margin: EdgeInsets.only(bottom: 70,),
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                              Border.all(color: Colors.grey[300]!),
                            ),
                            child: ListTile(
                              leading: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                      'assets/images/cvbg.png')),
                              title: Text(
                                '${currentUserDetails.userDetails![index].firstname}.mp4' ,
                                // maxLines: isExpanded ? null : 2,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              //------------------------video
                              trailing: InkWell(
                                onTap: () async {
                                  final status = await Permission.storage.request();
                                  if (status.isGranted) {
                                    if (VisumeUrl != null && VisumeUrl !=  ""
                                        && VisumeUrl != "https://girlzwhosellcareerconextions.com/API/"){

                                      // if(Platform.isAndroid){
                                      //   Fluttertoast.showToast(
                                      //       msg: "Your File is Downloading...",
                                      //       toastLength: Toast.LENGTH_SHORT,
                                      //       gravity: ToastGravity.CENTER,
                                      //       backgroundColor: Colors.blueGrey[300],
                                      //       timeInSecForIosWeb: 3);
                                      //
                                      //   DownloadUserFile(VisumeUrl);
                                      // }else if (Platform.isIOS ||  Platform.isMacOS){

                                      openUrl(VisumeUrl!);
                                      // }


                                    }else{
                                      Fluttertoast.showToast(
                                          msg: "Sorry You Didn't Upload Visume. \n Please Upload Your Visume First.\n Thank You.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: Colors.blueGrey[300],
                                          timeInSecForIosWeb: 3);
                                    }

                                  }
                                  else {
                                    print("Permission deined");
                                  }
                                  // showToast(
                                  //   'DownLOad might be FAiled if you didn\'t upload video',
                                  //   context: context,
                                  //   fullWidth: true,
                                  //   backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
                                  //   animation: StyledToastAnimation.slideFromBottomFade,
                                  //   reverseAnimation: StyledToastAnimation.fade,
                                  //   position: StyledToastPosition.bottom,
                                  //   animDuration: Duration(seconds: 1),
                                  //   duration: Duration(seconds: 3),
                                  //   curve: Curves.elasticOut,
                                  //   reverseCurve: Curves.linear,
                                  // );
                                },
                                child: Icon(
                                  Icons.download_outlined,
                                  size: 30,
                                  color: Colors.pinkAccent[200],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(

                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              // child: Text('bnjdks', style: TextStyle(
                              //   color: Colors.pink
                              // ),
                              // ),
                            ),
                          ),
                        ],
                      )



                          : Container();
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> initializeDownloadDirectory() async {
  //   savedDir = await getDownloadDirectory();
  // }

  // Future<String> getDownloadDirectory() async {
  //   final directory = Platform.isAndroid
  //       ? await getExternalStorageDirectory()
  //       : await getApplicationDocumentsDirectory();
  //
  //   return directory.path;
  // }

  // void downloadImage(String imageUrl) async {
  //   print("hellooooooooo");
  //   // final savedDir = await getDownloadDirectory();
  //   final taskId = await FlutterDownloader.enqueue(
  //     url: imageUrl,
  //     headers: {}, // optional: header send with url (auth token etc)
  //     savedDir: savedDir,
  //     showNotification: true, // show download progress in status bar (for Android)
  //     openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  //   );
  // }
  double? _progress;

  void DownloadUserFile(String url){

    FileDownloader.downloadFile(
        url: url.trim(),
        onProgress: (name, progress) {
          setState(() {
            _progress = progress;

          });
        },
        onDownloadCompleted: (value) {
          print('path  $value ');
          Fluttertoast.showToast(
              msg: "Your File is Downloaded Successfully \n $value.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.blueGrey[300],
              timeInSecForIosWeb: 3);
        });


  }

  void openUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("unable to launch ========= >>>>>>>>>");
      throw 'Could not launch $url';
    }
  }

// void downloadFile(String url)async{
//   var dio  = Dio();
//   Directory directory = await getApplicationDocumentsDirectory();
//   var response = await dio.download(url,
//   "${directory.path}/file.png");
//   print(response.statusCode);
// }s

//=======================  https://www.youtube.com/watch?v=C7KPX8sqlUU

// _downloadFile(
//     String downloadPath,
//     String destPath)async{
//     _cancelToken  = CancelToken();
//     _downloading = true;
//     try{
//       await DioClient.dio.download(downloadPath,destPath,cancelToken:_cancelToken,
//       OnReceiveProgress:(int received, int total){
//         if (total != -1){
//           if(!_cancelToken.isCancelled){
//             setState(() {
//               _downloadRatio = (received/total);
//               if (_downloadRatio == 1){
//                 _downloading = false;
//               }
//               _downloadIndicator =
//               (_downloadRatio*100).toStringAsFixed(2)+ '%';
//             });
//           }
//         }
//       });
//     }on DioError  catch(e){
//       if(CancelToken.isCancel(e)){
//         debugPrint("Request canceled!"+e.message);
//       }
//     } on Exception catch (e){
//       debugPrint(e.toString());
//     }
// }



}


