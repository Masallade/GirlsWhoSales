import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashbordAppliedJobs extends StatefulWidget {
  final user_Id;
   fetchAppliedJobsModel fetchJobs;
   List<AppliedJobDetails> appliedJobDetails;
  DashbordAppliedJobs({this.user_Id,this.fetchJobs,this.appliedJobDetails});
  @override
  _DashbordAppliedJobsState createState() => _DashbordAppliedJobsState(user_Id: user_Id ,appliedJobDetails: appliedJobDetails);
}

class _DashbordAppliedJobsState extends State<DashbordAppliedJobs> {

   final user_Id;
  _DashbordAppliedJobsState({this.user_Id,this.fetchJobs, this.appliedJobDetails});

    fetchAppliedJobsModel fetchJobs;
    List<AppliedJobDetails> appliedJobDetails;

    String st;
   Color checkStatus(String st) {
     Color a;
     Color b;
     if (st == "Hired")
       a = Colors.pinkAccent[200];
     else if(st == "Applied"){
       b=Colors.blue[800];
     }
     }
   bool changeColor = false;

  void initState(){
    super.initState();
    print('$user_Id');
  //  appiedDashboadJobs();
  }

  bool isloading = false;

  Future<String> loadViewData() async {

    appliedJobDetails = await request(context, false);
    return "OK";
  }



  @override
  Widget build(BuildContext context) {
    final color = changeColor ? Colors.pinkAccent[200] : Colors.blue;
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
            'Applications',
            style: TextStyle(
              color: Colors.black,
              height: 1.5,
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: SizeConfig.screenHeight,
                child:appliedJobDetails ==null ? Container(child: Center(child: Text('No Applied Jobs' ,style: TextStyle(fontFamily: 'Questrial' ,fontWeight: FontWeight.w400),),),) : ListView.builder(
                    itemCount: appliedJobDetails.length == null ? 0 : appliedJobDetails.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20 , left: 12 ,right: 10),
                            child: Container(
                           //   padding: EdgeInsets.only(top: 20),
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:  Border.all(
                                  // left: BorderSide(
                                  //     color: Colors.pinkAccent[200],
                                  //     width: 5)
                                    color: Color.fromRGBO(238, 242, 248, 1)
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    child: appliedJobDetails == null ? null : Image.network(
                                        '${appliedJobDetails[index].companyLogo}'),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        '${appliedJobDetails[index].title ?? " "}',
                                         style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          //fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     if (isLiked == true) {
                                      //       IsButton = true;
                                      //       savejob();
                                      //     } else {
                                      //       Unsavejob();
                                      //     }
                                      //   },
                                      //   child: FavoriteButton(
                                      //     isFavorite: false,
                                      //     valueChanged: (isLiked) {
                                      //       print('Is Favorite : $isLiked');
                                      //       if (isLiked) {
                                      //         savejob();
                                      //       } else {
                                      //         Unsavejob();
                                      //       }
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  subtitle: Container(
                                    width:60,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Experince: ${appliedJobDetails[index].experience ?? ""}',
                                            style: TextStyle(
                                              fontFamily: 'Questrial',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                         // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$${appliedJobDetails[index].minSalary  ?? " "}' '-\$${appliedJobDetails[index].maxSalary ?? " "}',
                                              style: TextStyle(
                                                fontFamily: 'Questrial',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 14.0,
                                                //fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(width: 22,),

                                            Container(
                                              height: 40,
                                              width: 77,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(52, 150, 224, 0.15),
                                                  borderRadius: BorderRadius
                                                      .circular(12.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 10.0),
                                                child: Text(
                                                   '${appliedJobDetails[index].msg ?? " "}', style: TextStyle(
                                                    color:color), textAlign: TextAlign.center,
                                                //   'Applied'
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      );
    }else {
      return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:38),
            child: Center(
              child: isloading?CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),

              ):Text(
                "Searching...",
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
   Future<List<AppliedJobDetails>> request(BuildContext context, bool showLoading) async {
    String get_key_url =  "https://biitsolutions.co.uk/girlzwhosell/API/fetch_applied_jobs.php?user_id=${user_Id}";

    // http.Response response;
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      if (showLoading) showLoadingDialog(context, _keyLoader);

      final http.Response response = await http.get(get_key_url);
      print("email,${get_key_url}");
      if (showLoading)
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();


      if (response.statusCode == 200) {
        fetchAppliedJobsModel resp =
        fetchAppliedJobsModel.fromJson(json.decode(response.body));
        print(response.statusCode);
        print(response.body);

        if (resp.status == 100) {
          showDialogCustom(
              context,
              "Failed",
              resp.message.length == 0 ? "record not found" : resp.message,
              "OK");
          return [];
        }
        return resp.appliedJobDetails;

      }
    } catch (error) {
      Future.delayed(Duration.zero, () => dataSuccessfullyLoaded(context, getTranslated(context, 'Not_Found'),getTranslated(context, 'Data_Not_Found'),getTranslated(context, 'OK')));
      return [];
    }
  }

  // Future savejob() async {
  //   // http.post(Uri.parse(JobDetail.uploadsavejob), body: {
  //   //   "user_id": uid,
  //   //   "job_id": jobid,
  //   // }).then((result) async {
  //   //   setStatus(result.statusCode == 200 ? result.body : errMessage);
  //   //   Result = result.statusCode;
  //   //   print('SaveResultbody $Result');
  //   //   if (result.statusCode == 200) {
  //   //     // print("==================SharedPrefrence values==================");
  //   //     //
  //   //     // final prefs = await SharedPreferences.getInstance();
  //   //     //
  //   //     // prefs.setString("user_id", user_Id);
  //   //     // prefs.setString("job_id", jobDetails.id);
  //   //     //
  //   //     //
  //   //     // final UID = await prefs.getString("user_id");
  //   //     // final JobId = await prefs.getString("job_id");
  //   //     //
  //   //     // print('StorgeUid $UID');
  //   //     // print('pass $JobId');
  //   //     print('Value From SharedPrefrnece To Maintain the state Of Favourtie Button');
  //   //
  //   //     print('uid:$uid');
  //   //     print('uid:$jobid');
  //   //     Fluttertoast.showToast(
  //   //         msg: "Added To favourite",
  //   //         toastLength: Toast.LENGTH_LONG,
  //   //         gravity: ToastGravity.TOP_RIGHT,
  //   //         timeInSecForIosWeb: 1);
  //   //     setState(() {
  //   //       isapplied = true;
  //   //     });
  //   //   }
  //   // }).catchError((error) {
  //   //   setStatus(error);
  //   // });
  //   String uid;
  //   String Jid;
  //   var res = await http.post(
  //       uploadsavejob , body: {
  //     "user_id": user_Id,
  //     "job_id": fetchJobs.appliedJobDetails[0].jobId,
  //   });
  //   if(res.statusCode == 200 ) {
  //     // SharedPreferences prefs = await SharedPreferences.getInstance();
  //     print("==================SharedPrefrence values==================");
  //
  //     final prefs = await SharedPreferences.getInstance();
  //
  //     prefs.setString('user_Id', user_Id);
  //     prefs.setString('job_Id', fetchJobs.appliedJobDetails[0].jobId);
  //     prefs.setBool('stateOfButton', true);
  //
  //     uid = await prefs.getString('user_Id');
  //     Jid = await prefs.getString('job_Id');
  //     IsButton = prefs.getBool('stateOfButton');
  //
  //     print('userid is :$uid');
  //     print('jobid is : $Jid');
  //     print('IsButton : $IsButton');
  //
  //     print("==================Response values==================");
  //     print(res.body);
  //
  //     Fluttertoast.showToast(
  //       msg: 'Added To Favourite',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP_RIGHT,
  //     );
  //
  //     setState(() {
  //       //  isapplied = true;
  //       isLiked = true;
  //     });
  //   }
  //
  // }
  //
  // Future Unsavejob() async {
  //   // http.post(Uri.parse(JobDetail.uploadsavejob), body: {
  //   //   "user_id": uid,
  //   //   "job_id": jobid,
  //   // }).then((result) async {
  //   //   setStatus(result.statusCode == 200 ? result.body : errMessage);
  //   //   Result = result.statusCode;
  //   //   print('SaveResultbody $Result');
  //   //   if (result.statusCode == 200) {
  //   //     // print("==================SharedPrefrence values==================");
  //   //     //
  //   //     // final prefs = await SharedPreferences.getInstance();
  //   //     //
  //   //     // prefs.setString("user_id", user_Id);
  //   //     // prefs.setString("job_id", jobDetails.id);
  //   //     //
  //   //     //
  //   //     // final UID = await prefs.getString("user_id");
  //   //     // final JobId = await prefs.getString("job_id");
  //   //     //
  //   //     // print('StorgeUid $UID');
  //   //     // print('pass $JobId');
  //   //     print('Value From SharedPrefrnece To Maintain the state Of Favourtie Button');
  //   //
  //   //     print('uid:$uid');
  //   //     print('uid:$jobid');
  //   //     Fluttertoast.showToast(
  //   //         msg: "Added To favourite",
  //   //         toastLength: Toast.LENGTH_LONG,
  //   //         gravity: ToastGravity.TOP_RIGHT,
  //   //         timeInSecForIosWeb: 1);
  //   //     setState(() {
  //   //       isapplied = true;
  //   //     });
  //   //   }
  //   // }).catchError((error) {
  //   //   setStatus(error);
  //   // });
  //   String uid;
  //   String Jid;
  //   var res = await http.post(
  //       removefavjob, body: {
  //     "seeker_id": user_Id,
  //     "job_id": fetchJobs.appliedJobDetails[0].jobId,
  //   });
  //   if(res.statusCode == 200 ) {
  //     // SharedPreferences prefs = await SharedPreferences.getInstance();
  //     print("==================SharedPrefrence values==================");
  //
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setString('user_Id', user_Id);
  //     prefs.setString('job_Id', fetchJobs.appliedJobDetails[0].jobId);
  //     uid = await prefs.getString('user_Id');
  //     Jid = await prefs.getString('job_Id');
  //     print('userid is :$uid');
  //     print('jobid is : $Jid');
  //
  //     print("==================Response values==================");
  //     print(res.body);
  //
  //
  //     Fluttertoast.showToast(
  //       msg: 'Remove From Favourite',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP_RIGHT,
  //     );
  //
  //     setState(() {
  //       //isapplied = false;
  //       isLiked = false;
  //     });
  //   }
  //
  // }

}
