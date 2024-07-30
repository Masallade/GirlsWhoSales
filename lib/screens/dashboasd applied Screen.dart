import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/screens/track_application_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;

// ignore: must_be_immutable
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
        backgroundColor: Colors.white,
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
                height: SizeConfig.screenHeight *0.9,
                child:appliedJobDetails ==null ? Container(
                  child: Center(
                    child: Text('No Applied Jobs' ,
                      style: TextStyle(fontFamily: 'Questrial' ,fontWeight: FontWeight.w400),
                    )))
                    : ListView.builder(
                    itemCount: appliedJobDetails.length == null ? 0 : appliedJobDetails.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> TrackApplication(
                                  appliedJobDetails:appliedJobDetails[index])));
                            },
                            child: Container(
                              height: 200,
                              width: SizeConfig.screenWidth,
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
                                    child:Image.network('${appliedJobDetails[index].companyLogo ?? Placeholder()}'),
                                  ),
                                  title: FittedBox(
                                    child: Text(
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
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                          ),
                          SizedBox(height: 10,),
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
   // ignore: missing_return
   Future<List<AppliedJobDetails>> request(BuildContext context, bool showLoading) async {
    String get_key_url =  "https://girlzwhosellcareerconextions.com/API/fetch_applied_jobs.php?user_id=${user_Id}";

    // http.Response response;
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      if (showLoading) showLoadingDialog(context, _keyLoader);

      final http.Response response = await http.get(Uri.parse(get_key_url));
      print("Url,${get_key_url}");
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


}
