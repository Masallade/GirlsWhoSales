import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:dio/dio.dart';
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
  //final cv;
  // final resume;

  const CVUpdate({Key key, this.user_id, this.userDetails}) : super(key: key);

  @override
  State<CVUpdate> createState() =>
      _CVUpdateState(user_id: user_id, userDetails: userDetails);
}

class _CVUpdateState extends State<CVUpdate> {
  final user_id;
  final List<SeekerDetails> userDetails;
  int progress = 0;
  ReceivePort _receivePort = ReceivePort();

  _CVUpdateState({this.user_id, this.userDetails});

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort.send([id, status, progress]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                                  height: 50,
                                ),
                                Text(
                                  "$progress",
                                  style: TextStyle(fontSize: 40),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Resume',
                                          style: TextStyle(
                                            color: Colors.black,
                                            height: 1.5,
                                            fontSize: 20.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomFilePicker2()));
                                          },
                                          child: Image.asset(
                                              'assets/images/edit.png')),
                                    ]),
                                SizedBox(height: 20),
                                Container(
                                    height: 140,
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
                                          child: Image.asset(
                                              'assets/images/pdfbg.png')),
                                      title: Text(
                                          '${userDetails[index].resume.trim()}'),
                                      //    subtitle: Text('1 day ago', style: subtitleStyle),
                                      trailing: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.download_outlined,
                                            size: 30,
                                          )),
                                    )),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Video Cv',
                                          style: TextStyle(
                                            color: Colors.black,
                                            height: 1.5,
                                            fontSize: 20.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Image.asset('assets/images/edit.png'),
                                    ]),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey[300]),
                                  ),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            final status = await Permission.storage.request();

                                            if (status.isGranted) {
                                              final externalDir =
                                                  await getExternalStorageDirectory();

                                              final id = await FlutterDownloader
                                                  .enqueue(
                                                url:
                                                    "${userDetails[index].cV}",
                                                savedDir: externalDir.path,
                                                fileName: "download.mp4",
                                                showNotification: true,
                                                openFileFromNotification: true,
                                              );
                                            } else {
                                              print("Permission deined");
                                            }
                                          },
                                          child: Text('Download')),
                                      Container(
                                        height: 150,
                                        width: SizeConfig.screenWidth,
                                        child: Image.asset(
                                            'assets/images/cvbg.png'),
                                      ),
                                      Text('${userDetails[index].cV}'),
                                      //Text('1 day ago', style: subtitleStyle),
                                    ],
                                  ),
                                )
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
//
//   Future openFile(String url, String fileName) async {
//   final file =  await downloadFile(url, fileName);
//     if(file == null ) return ;
//     print('Path : ${file.path}');
//     OpenFile.open(file.path);
//   }
//
//
//   Future <File> downloadFile(String url, String name) async {
//     final appStorage = await getApplicationDocumentsDirectory();
//     final file = File('${appStorage.path}/$name');
//     try {
//       final response = await Dio().get(
//           url,
//           options: Options(
//             responseType: ResponseType.bytes,
//             followRedirects: false,
//             receiveTimeout: 0,
//           )
//       );
//       final raf = file.openSync(mode: FileMode.write);
//       raf.writeFromSync(response.data);
//       await raf.close();
//       return file;
//     } catch (e) {
//
// return null;
//     }
//   }
}
