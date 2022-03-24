import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/registration/upload_cv.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CVUpdate extends StatefulWidget {
  final user_id;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;

  const CVUpdate({Key key, this.user_id, this.userDetails , this.password,this.uName}) : super(key: key);

  @override
  State<CVUpdate> createState() =>
      _CVUpdateState(user_id: user_id, userDetails: userDetails ,password: password,uName: uName);
}

class _CVUpdateState extends State<CVUpdate> {
  final user_id;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;
  int progress;
  ReceivePort _receivePort = ReceivePort();

  _CVUpdateState({this.user_id, this.userDetails , this.password,this.uName});

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");
    ///sending the data
    sendPort.send([id, status, progress]);
  }
  bool isExpanded = false;
   int numLines;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(user_id);
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

    FlutterDownloader.registerCallback(downloadingCallback);
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
        // actions: [
        //   GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>
        //                     CustomFilePicker2(uName: uName,password: password,user_id: user_id, userDetails:userDetails)));
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: 12.0),
        //         child: Image.asset(
        //             'assets/images/edit.png'),
        //       )),
        // ],
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
                    itemCount: userDetails.length,
                    itemBuilder: (context, index) {
                      return userDetails[index] != null
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
                                                        CustomFilePicker2(uName: uName,password: password,user_id: user_id, userDetails:userDetails)));
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
                                    width: SizeConfig.screenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.grey[300]),
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: Image.asset(
                                                'assets/images/pdfbg.png'),
                                          )),
                                      title: Text(
                                          '${userDetails[index].firstname}.pdf',
                                      //  maxLines: isExpanded ? null : 2,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,),
                                      //    subtitle: Text('1 day ago', style: subtitleStyle),
                                      trailing: InkWell(
                                          onTap: () async {
                                            final status = await Permission.storage.request();

                                            if (status.isGranted) {
                                              final externalDir =
                                                  await getExternalStorageDirectory();

                                              //final id =
                                              await FlutterDownloader
                                                  .enqueue(
                                                url:
                                                "${userDetails[index].cV}",
                                                savedDir: externalDir?.path,
                                                fileName: '${userDetails[index].firstname}.pdf',
                                                showNotification: true,
                                                openFileFromNotification: true,
                                              );
                                            } else {
                                              print("Permission deined");
                                            }
                                          },
                                          child: Icon(
                                            Icons.download_outlined,
                                            size: 30,
                                            color: Colors.pinkAccent[200],
                                          )),
                                    )),
                                SizedBox(
                                  height: 50,
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
                                                        uploadVideoCv(uName: uName,password: password,user_id: user_id, userDetails:userDetails)));
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
                                    width: SizeConfig.screenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.grey[300]),
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                              'assets/images/cvbg.png')),
                                      title: Text(
                                          '${userDetails[index].firstname}.mp4' ,
                                       // maxLines: isExpanded ? null : 2,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      //    subtitle: Text('1 day ago', style: subtitleStyle),
                                      trailing: InkWell(
                                          onTap: () async {
                                            final status = await Permission.storage.request();

                                            if (status.isGranted) {
                                              final externalDir =
                                                  await getExternalStorageDirectory();

                                              //final id =
                                              await FlutterDownloader
                                                  .enqueue(
                                                url:
                                                "${userDetails[index].resume}",
                                                savedDir: externalDir?.path,
                                                fileName: "${userDetails[index].firstname}.mp4",
                                                showNotification: true,
                                                openFileFromNotification: true,
                                              );
                                            } else {
                                              print("Permission deined");
                                            }
                                          },
                                          child: Icon(
                                            Icons.download_outlined,
                                            size: 30,
                                            color: Colors.pinkAccent[200],
                                          )),
                                    )),
                              ],
                            )
                          : Container();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
