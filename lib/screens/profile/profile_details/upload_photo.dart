import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';


class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(
        context,
        titleText: Strings.personalDetails,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    container1,
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'For any Help',
                            style: TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),
                          Text(
                            'Call at 163457',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget get container1 {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 80,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white10,
            child: Icon(
              Icons.person,
              color: Colors.orangeAccent,
              size: 110,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          'No Photo is Uploaded Yet',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      Text(
        'Upload JPG,GIF, PNG or BMP',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          ' Max Size of Photo is 3 MB',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
      DottedBorder(
        padding: EdgeInsets.all(10),
        dashPattern: [9, 5],
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Upload Photo',
                style: TextStyle(fontSize: 15),
              ),
              IconButton(
                  icon: Icon(
                    Icons.cloud_upload,
                    size: 30,
                  ),
                  onPressed: null)
            ],
          ),
        ),
      ),
    ],
  );
}
