// ignore_for_file: missing_return

import 'dart:convert';

import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/model/total_notification.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/main_menu/all_jobs.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';
import 'package:girlzwhosell/widgets/job_card1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../http/Requests.dart';
import '../../../model/SavedJobsModel.dart';
import '../../../model/total_saved_jobs.dart';
import '../../../user_preferences/user_pref_manager.dart';
import '../new_job_details_model.dart';
import 'general_search.dart';
import 'package:http/http.dart' as http;
class HomeSearch extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  String nationality;
  final jobId;
  final cv;
  final resume;
  final String location;
  final String Location;
  final String totalNotification;

  HomeSearch(
      {Key key,
      this.uName,
        this.nationality,
      this.password,
      this.user_Id,
      this.firstName,
      this.jobDetails,
      this.favoriteJobs,
      this.userDetails,
      this.jobId,
      this.cv,
      this.resume,
      this.location,
      this.Location
      ,this.totalNotification
      })
      : super(key: key);
  @override
  _HomeSearchState createState() => _HomeSearchState(
        uName: uName,
        password: password,
        user_Id: user_Id,
        firstName: firstName,
        jobDetails: jobDetails,
        favoriteJobs: favoriteJobs,
        jobId: jobId,
        cv: cv,
        nationality: nationality,
        resume: resume,
        location: location,
    Location: Location,
//      totalNotification: totalNotification
      );
}

class _HomeSearchState extends State<HomeSearch> {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  List<JobDetails> jobDetails;
  List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  final cv;
  final resume;
  String nationality;
  //final String totalNotification;
  PushNotificationMessage notificationInfo;

  _HomeSearchState({
    this.uName,
    this.password,
    this.user_Id,
    this.firstName,
    this.jobDetails,
    this.favoriteJobs,
    this.userDetails,
    this.jobId,
    this.cv,
    this.nationality,
    this.resume,
  //  this.totalNotification,
    this.location,
    this.Location,
    //  this.notificationInfo
  });
  String Location = '';
  String location = '';
  List<SearchModel> joblist = [];


  @override
  void initState() {

    SharedPreferencesManager.initialize();
    SharedPreferencesManager.getTotalSavedJobs(int.tryParse(user_Id));


    print('userid${user_Id}');
    print('firstname is: $firstName');
    print('uName on homesearch : $uName');
    print('pass on homesearch : $password');
    //UpdateNotifiction();
    super.initState();
  }

  Future <TotalNotification> TotalNotifiction() async {
    final url = "https://girlzwhosellcareerconextions.com/API/total_notifications.php?seeker_id=$user_Id";
    try{
      final http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200 ){
        print('response is : ${response.body}');

        totalNotification = TotalNotification.fromJson(json.decode(response.body));
        return totalNotification;
      }
    } catch (e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: FutureBuilder(
        future:TotalNotifiction(),
        builder: (context , snapshot){
          if (snapshot.hasData) {
            Container();
            return  Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 8),
                            child: Text(
                              "Let's Find",
                              style: TextStyle(
                                color: Colors.blue[800],
                                height: 1.5,
                                fontSize: 24.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 28.0, top: 25),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  NotificationScreen(
                                                      user_Id: user_Id))));
                                    },
                                    child:
                                 totalNotification.totalCountNotf == "0" ? Image.asset(
                                   'assets/images/notification.png',
                                   scale: 1.0,
                                   color: Colors.black,
                                 ) :   badge.Badge(
                                      position: BadgePosition.topEnd(top: -20 ,end: 10),
                                      // : Colors.red,
                                      badgeContent: Text('${totalNotification.totalCountNotf ?? ''}' , style: TextStyle(color: Colors.white , fontSize: 15),),
                                      child: Image.asset(
                                        'assets/images/notification.png',
                                        scale: 1.0,
                                        color: Colors.black,
                                      ),
                                    )
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 45),
                            child: Text(
                              "Your Dream Job",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.pinkAccent[200],
                                height: 1.5,
                                fontSize: 24.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17.0),
                    InkWell(
                      splashColor: Colors.pinkAccent[200],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobSearchSecond(
                                  uName: uName,
                                  password: password,
                                  user_Id: user_Id,
                                  firstName: firstName,
                                  jobDetails: jobDetails,
                                  favoriteJobs: favoriteJobs,
                                  userDetails: userDetails,
                                  jobId: jobId,
                                  cv: cv,
                                  resume: resume,
                                )));
                      },
                      child: Container(
                        height: 52,
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/search.png',
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Job Title',
                              style: TextStyle(
                                  fontFamily: 'Questrial',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.blue[800],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobSearchSecond(
                                  uName: uName,
                                  password: password,
                                  user_Id: user_Id,
                                  firstName: firstName,
                                  jobDetails: jobDetails,
                                  favoriteJobs: favoriteJobs,
                                  userDetails: userDetails,
                                  jobId: jobId,
                                  cv: cv,
                                  resume: resume,
                                )));
                      },
                      child: Container(
                        height: 52,
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/location.png',
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontFamily: 'Questrial',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 31.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Jobs For You",
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: GestureDetector(
                            onTap: () {


                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AllJobs(
                                        uName: uName,
                                        password: password,
                                        user_Id: user_Id,
                                        firstName: firstName,
                                        jobDetails: jobDetails,
                                        // jobDetails: jobDetails[index],
                                        favoriteJobs: favoriteJobs,
                                        userDetails: userDetails,
                                        jobId: jobId,
                                      )));
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey[300],
                                fontSize: 16.0,
                                //fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.5),
                    jobDetails == null
                        ? Container(
                      child: Center(
                        child: Text(
                          'No Jobs are Available!',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    )
                        : Container(
                      width: SizeConfig.screenWidth,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics:
                          const PageScrollPhysics(), // this for snapping
                          itemCount: jobDetails.length ,
                          itemBuilder: (context, index) => index % 2 == 0 ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(
                                      uName: uName,
                                      password: password,
                                      firstName: firstName,
                                      jobDetails: jobDetails[index],
                                      userDetails: userDetails,
                                      user_Id: user_Id,
                                      appliedStatus:
                                      jobAppliedDetailModel.applied,
                                      jobid: jobDetails[index].id,//c
                                      cv: cv,
                                      resumee: resume,
                                    ),
                                  ),
                                );
                              },
                              child: CompanyCard(
                                jobDetails: jobDetails[index],
                                userId: user_Id,
                              ))
                              : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(
                                      uName: uName,
                                      password: password,
                                      firstName: firstName,
                                      jobDetails: jobDetails[index],
                                      userDetails: userDetails,
                                      user_Id: user_Id,
                                      appliedStatus:
                                      jobAppliedDetailModel.applied,
                                      jobid: jobDetails[index].id,//jobDetails[index].id
                                      cv: cv,
                                      resumee: resume,
                                    ),
                                  ),
                                );
                              },
                              child: CompanyCard2(
                                jobDetails: jobDetails[index],
                                userId: user_Id,
                              ))),
                    ),
                    SizedBox(height: 31.0),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Saved Jobs",
                          style: TextStyle(
                            fontFamily: 'Questrial',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllSavedJobs(
                                      user_Id: user_Id,
                                      firstName: firstName,
                                      uName: uName,
                                      password: password,
                                      cv: cv,
                                      resume: resume,
                                    )));
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey[300],
                              fontSize: 16.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 12.5),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: favoriteJobs == null//Requests.updatefavoriteJobs , favoriteJobs
                            ? Container(
                          child: Center(
                            child: Text(
                              'No Saved Jobs!',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        )
                            : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: favoriteJobs//Requests.updatefavoriteJobs,favoriteJobs
                              .asMap()
                              .entries
                              .map(
                                (item) => Container(
                              padding: EdgeInsets.only(right: 16),
                              child: JobCard1(
                                favoriteJobs: item.value,
                                user_Id: user_Id,
                                uName: uName,
                                password: password,
                                firstName: firstName,
                                jobDetails: jobDetails,
                                userDetails: userDetails,
                                jobId: jobId,
                                cv: cv,
                                resume: resume,
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else {
            return
               /// Container();
              Center(
                child: Text('Loading ...' ,  style: TextStyle(
                    fontFamily: 'Questrial',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent[200]

                ),),);
                //CircularProgressIndicator(color: Colors.pinkAccent[200],));
          }

        },
      ),
    );
  }
  List<New_Job_Details> jobDetailsList;

  Future<List<New_Job_Details>> getalljobDetails()async{
    var request = http.Request('GET', Uri.parse('https://girlzwhosellcareerconextions.com/API/jobs_filtered.php?$user_Id'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("================+++++++++++++++===============================");
      print(await response.stream.bytesToString());
      String responseBody = await response.stream.bytesToString();
      List<dynamic> jsonList = json.decode(responseBody);

      jobDetailsList = jsonList
          .map((json) => New_Job_Details.fromJson(json))
          .toList();

      return jobDetailsList;
      
    }
    else {
      print(response.reasonPhrase);
      return [];
    }

  }




}

