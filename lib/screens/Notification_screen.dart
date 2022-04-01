
import 'dart:async';
import 'dart:convert';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/notification_model.dart';
import 'package:girlzwhosell/utils/constants.dart';


// ignore: must_be_immutable
class NotificationScreen extends StatefulWidget {

  final user_Id;
//  final token1;
  // PushNotificationMessage notificationInfo;
  NotificationScreen({this.user_Id,
    //this.token1 ,
    //  this.notificationInfo
  });
  @override
  _NotificationScreenState createState() => _NotificationScreenState(user_Id: user_Id ,
    //token1: token1
    //,notificationInfo: notificationInfo
  );
}

class _NotificationScreenState extends State<NotificationScreen> {

  final user_Id;
  _NotificationScreenState({this.user_Id});


  PushNotificationMessage notificationInfo;
  List<NotificationsDetails> notificationsDetails;
  bool isloading = false;

  Future<String> loadViewData() async {

    notificationsDetails = await request(context, false);
    return "OK";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadViewData(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            Container();
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
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight,
                      child:notificationsDetails ==null ? Container(
                          child: Center(
                              child: Text('No Notification' ,
                                style: TextStyle(fontFamily: 'Questrial' ,fontWeight: FontWeight.w400),
                              )))
                          : ListView.builder(
                          itemCount: notificationsDetails.length == null ? 0 : notificationsDetails.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 375,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:  Border.all(
                                          color: Color.fromRGBO(238, 242, 248, 1)
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.network('${notificationsDetails[index].logo ?? Placeholder()}'),
                                        ),
                                        title: Text(
                                          '${notificationsDetails[index].notifyTitle ?? " "}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                     subtitle: Text('${notificationsDetails[index].notifyText ?? " "}',
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                         fontFamily: 'Poppins',
                                         fontStyle: FontStyle.normal,
                                         fontWeight: FontWeight.w400,
                                         color: Color.fromRGBO(113, 126, 149, 1),
                                         fontSize: 14.0,
                                         //fontWeight: FontWeight.w700,
                                       ),
                                     ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(

                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          }else {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal:38),
                child: Center(
                  child: isloading ? CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),

                  ) :
                  Text(
                    "Loading ...",
                    style: TextStyle(
                        fontFamily: 'Questrial',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue

                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
  Future<List<NotificationsDetails>> request(BuildContext context, bool showLoading) async {
    String get_key_url =  "https://biitsolutions.co.uk/girlzwhosell/API/fetch_notifications.php";

    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      if (showLoading) showLoadingDialog(context, _keyLoader);

      final http.Response response = await http.post(Uri.parse(get_key_url) , body: {
        'seeker_id' : user_Id
      } );
      print("Url,${get_key_url}");
      print("userid,${user_Id}");
      if (showLoading)
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      if (response.statusCode == 200) {
        NotificationModel resp =
        NotificationModel.fromJson(json.decode(response.body));
        print(response.statusCode);
        print(response.body);

        if (resp.status == "100") {
          showDialogCustom(
              context,
              "Notifications",
              resp.message.length == 0 ? "record not found" : resp.message,
              "OK");
          return [];
        }
        return resp.notificationsDetails;

      }
    } catch (error) {
      Future.delayed(Duration.zero, () => dataSuccessfullyLoaded(context, getTranslated(context, 'Not_Found'),getTranslated(context, 'Data_Not_Found'),getTranslated(context, 'OK')));
      return [];
    }
  }

}
