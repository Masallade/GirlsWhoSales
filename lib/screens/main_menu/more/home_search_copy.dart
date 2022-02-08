import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';
import 'package:girlzwhosell/notification_badge/badge_for%20notification.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/main_menu/all_jobs.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';
import 'package:girlzwhosell/widgets/job_card1.dart';
import 'package:overlay_support/overlay_support.dart';
import 'general_search.dart';

class HomeSearch extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  // final cookiee;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;

  final jobId;
 final String location;
 final String Location;
 PushNotificationMessage notificationInfo;

   HomeSearch(
      {Key key,
      this.uName,
      this.password,
      this.user_Id,
      this.firstName,
      this.jobDetails,
      this.favoriteJobs,
      this.userDetails,
      this.jobId ,this.location,this.Location ,this.notificationInfo})
      : super(key: key);
  @override
  _HomeSearchState createState() => _HomeSearchState(
      uName: uName,
      password: password,
      user_Id: user_Id,
      firstName: firstName,
      jobDetails: jobDetails,
      favoriteJobs: favoriteJobs,
      jobId: jobId , location: location ,Location: Location , notificationInfo: notificationInfo);
}

class _HomeSearchState extends State<HomeSearch> {
  final uName;
  final password;
  final user_Id;
  final String firstName;
//  final cookiee;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  PushNotificationMessage notificationInfo;

  _HomeSearchState(
      {this.uName,
      this.password,
      this.user_Id,
      this.firstName,
      this.jobDetails,
      this.favoriteJobs,
      this.userDetails,
      this.jobId ,this.location,this.Location ,this.notificationInfo});
  String Location='';
  String location = '';
  List<SearchModel> joblist = [];

//notifications Part
  StreamSubscription onMsgSubcription;
  StreamSubscription notificationSubcription;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseMessaging messaging;
  int totalNotifications = 0;
  //model
  PushNotificationMessage _notificationInfo;

  void registerNotification() async {

    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('user granted permission');

      //main msg
      notificationSubcription= FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationMessage notification = PushNotificationMessage(
        //  image: message.notification.bodyLocKey,
          title: message.notification.title ?? "",
          body: message.notification.body ?? "",
          Datatitle: message.data['title'],
          Databody: message.data['body'],
        );

        setState(() {
          totalNotifications ++;
          _notificationInfo = notification;
        });
        if(notification !=null){
          showSimpleNotification(
              Text('${_notificationInfo.title ?? ""}'),
             // leading: Image.network(_notificationInfo.image),
              trailing: NotificationBadge(
                totalNotifications: totalNotifications,
              ),
              subtitle: Text('${_notificationInfo.body ?? " "}'),
              background: Colors.cyan.shade700,
              duration: Duration(seconds: 3)
          );
        }
      });
      ///app is iin bG but opened & user taps on notification
      onMsgSubcription= onMsgSubcription= FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        final routeFromMsg = message.data['route'];
        print('routeFromMsg : $routeFromMsg');
      });
    }
    else{
      print('permission denied by User');
    }

  }
  void dispose (){
    onMsgSubcription.cancel();
    notificationSubcription.cancel();
    super.dispose();
  }

  List<Widget> children = [
    CompanyCard(),
    CompanyCard2(),
  ];

  @override
  void initState() {
    print('jobDetailslength${jobDetails.length}');
    print('userid${user_Id}');
    print('firstname is: $firstName');
    print('uName on homesearch : $uName');
    print('pass on homesearch : $password');
    registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 890, width: 414, allowFontScaling: true);
    SizeConfig().init(context);
    CardController controller; //Use this to trigger swap.
    return SafeArea(
      child: Scaffold(
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
                      padding: const EdgeInsets.only(left: 12.0, top: 32),
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
                      padding: const EdgeInsets.only(right: 28.0, top: 50),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            NotificationScreen(
                                                user_Id: user_Id,notificationInfo: _notificationInfo))));
                              },
                              child: Image.asset(
                                'assets/images/notification.png',
                                scale: 1.0,
                                color: Colors.black,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 60),
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
              SizedBox(height: 21.0),
              //     Padding(
              // padding: const EdgeInsets.only(left: 12.0,right: 12),
              // child: Container(
              //   // color: Colors.yellow,
              //   width: SizeConfig.screenWidth,
              //   height: 60.0,
              //   child: GestureDetector(
              //     onTap: (){
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) {
              //             return JobSearchSecond(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId);},
              //         ),
              //       );},
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5.0),
              //         border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6)),
              //       ),
              //       child: ListTile(
              //         leading: Padding(
              //           padding: const EdgeInsets.only(left: 9.0 ,top:8 ,bottom: 9 ),
              //           child: Image.asset('assets/images/search.png' , color: Color.fromRGBO(148, 160, 180, 1)),
              //         ),
              //         title: Text('Job Title',
              //           style: TextStyle(
              //             height: 1.5,
              //             fontSize: 16.0,
              //             fontFamily: 'Questrial',
              //             fontStyle: FontStyle.normal,
              //             fontWeight: FontWeight.w500,
              //               color: Color.fromRGBO(148, 160, 180, 1)
              //             /* letterSpacing: 0.0, */
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              //   ),
              Container(
                height: 52,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  onTap: () async {
                      Future.delayed(Duration(seconds: 7),()=>Navigator.push(context, MaterialPageRoute(builder: (context) => JobSearchSecond(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId, location: location ,Location: Location,))));
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    prefixIcon: Image.asset(
                      'assets/images/search.png',
                      color: Colors.black,
                    ),
                    // suffixIcon: GestureDetector(
                    //   onTap: () {
                    //
                    //     Timer(Duration(milliseconds: 2),()=>Navigator.push(context, MaterialPageRoute(builder: (context) => JobSearchSecond(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId, location: location ,Location: Location,))));
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //     //   return JobSearchSecond(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId, location: location ,Location: Location);
                    //     // }));
                    //   },
                    //  child: Icon(Icons.search),
                    // ),
                    hintText: 'Job Title',
                    hintStyle: TextStyle(
                        fontFamily: 'Questrial',
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                      fontFamily: 'Questrial',
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  onChanged: (value) {
                    setState(() {
                      location = value;
                    });
                    print(location);
                  },
                ),
              ),
              Container(
                height: 52,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  onTap: () async {
                    Future.delayed(Duration(seconds: 7),()=>Navigator.push(context, MaterialPageRoute(builder: (context) => JobSearchSecond(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId, location:location,Location: Location))));
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    prefixIcon: Image.asset(
                      'assets/images/location.png',
                      color: Colors.black,
                    ),
                    // suffixIcon: widget.text.isNotEmpty
                    //     ? GestureDetector(
                    //   child: Icon(Icons.close, color: style.color),
                    //   onTap: () {
                    //     controller.clear();
                    //     widget.onChanged('');
                    //     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>JobSearchSecond()));
                    //     FocusScope.of(context).requestFocus(FocusNode());
                    //   },
                    // )
                    //     : null,
                    hintText: 'Location',
                    hintStyle: TextStyle(
                        fontFamily: 'Questrial',
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                      fontFamily: 'Questrial',
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  onChanged: (value) {
                    setState(() {
                      Location = value;
                    });
                    print(Location);
                  },
                ),
              ),
// buildSearch(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0, right: 12),
              //   child: Container(
              //     // color: Colors.yellow,
              //     width: SizeConfig.screenWidth,
              //     height: 60.0,
              //     child: GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return JobSearchSecond(
              //                   uName: uName,
              //                   password: password,
              //                   user_Id: user_Id,
              //                   firstName: firstName,
              //                   jobDetails: jobDetails,
              //                   favoriteJobs: favoriteJobs,
              //                   userDetails: userDetails,
              //                   jobId: jobId);
              //             },
              //           ),
              //         );
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5.0),
              //           border: Border.all(
              //               color: Colors.blueGrey[300].withOpacity(0.6)),
              //         ),
              //         child: ListTile(
              //           leading: Padding(
              //             padding: const EdgeInsets.only(
              //                 left: 9.0, top: 8, bottom: 9),
              //             child: Image.asset('assets/images/location.png',
              //                 color: Color.fromRGBO(148, 160, 180, 1)),
              //           ),
              //           title: Text(
              //             'Location',
              //             style: TextStyle(
              //                 height: 1.5,
              //                 fontSize: 16.0,
              //                 fontFamily: 'Questrial',
              //                 fontStyle: FontStyle.normal,
              //                 fontWeight: FontWeight.w500,
              //                 color: Color.fromRGBO(148, 160, 180, 1)
              //                 /* letterSpacing: 0.0, */
              //                 ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
              Container(
                width: SizeConfig.screenWidth,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(), // this for snapping
                    itemCount: jobDetails.length,
                    itemBuilder: (context, index) => index % 2 == 0
                        ? GestureDetector(
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
                                    jobid: jobId,
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
                                    jobid: jobId,
                                  ),
                                ),
                              );
                            },
                            child: CompanyCard2(
                              jobDetails: jobDetails[index],
                              userId: user_Id,
                            ))),
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              // //  color: Colors.yellow,
              //   height: MediaQuery.of(context).size.height * 0.5,
              //   child: new TinderSwapCard(
              //     swipeUp: true,
              //     swipeDown: true,
              //     orientation: AmassOrientation.BOTTOM,
              //     totalNum: jobDetails.length,
              //     // totalNum: welcomeImages.length,
              //     stackNum: 3,
              //     swipeEdge: 4.0,
              //     maxWidth: MediaQuery.of(context).size.width * 0.9,
              //     maxHeight: MediaQuery.of(context).size.width * 0.9,
              //     minWidth: MediaQuery.of(context).size.width * 0.8,
              //     minHeight: MediaQuery.of(context).size.width * 0.8,
              //     cardBuilder: (context, index) => GestureDetector(
              //         onTap: (){
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => JobDetail(uName:uName,password: password, firstName: firstName, jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
              //             ),);
              //           },
              //         child: AllJobCard(jobDetails: jobDetails[index], userId:user_Id)),
              //     cardController: controller = CardController(),
              //     swipeUpdateCallback:
              //         (DragUpdateDetails details, Alignment align) {
              //       /// Get swiping card's alignment
              //       if (align.x < 0) {
              //         //Card is LEFT swiping
              //       } else if (align.x > 0) {
              //         //Card is RIGHT swiping
              //       }
              //     },
              //     swipeCompleteCallback:
              //         (CardSwipeOrientation orientation, int index) {
              //       /// Get orientation & index of swiped card!
              //           ///
              //     },
              //   ),
              // ),
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
                              builder: (context) => AllSavedJobs(
                                    user_Id: user_Id,
                                    firstName: firstName,
                                    uName: uName,
                                    password: password,
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
                  child: favoriteJobs == null
                      ? Container(
                          child: Center(
                            child: Text(
                              'No Saved Jobs !',
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
                          children: favoriteJobs
                              .asMap()
                              .entries
                              .map(
                                (item) => Container(
                                  // margin: EdgeInsets.symmetric(horizontal: kSpacingUnit).copyWith(
                                  //   top: item.key == 0 ? kSpacingUnit * 1 : 0,
                                  //   bottom: kSpacingUnit * 2,
                                  // ),
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
      ),
    );
  }

  // Future<JobAppliedDetailModel> alreadyapplied() async {
  //   final url = "https://biitsolutions.co.uk/girlzwhosell/API/applied_job.php";
  //   try {
  //     final response = await http.post(Uri.parse(url), body: {
  //       "user_id": user_Id,
  //       "job_id": jobDetails[0].id,
  //     });
  //     if (response.statusCode == 200) {
  //       print("Response is: ${response.body}");
  //       print("Status Code is: ${response.statusCode}");
  //       jobAppliedDetailModel =
  //           JobAppliedDetailModel.fromJson(json.decode(response.body));
  //       return jobAppliedDetailModel;
  //     }
  //   } catch (e) {
  //     print("Error in exception::: ${e.toString()}");
  //   }
  // }
  // Widget buildSearch() => SearchWidgetHome(
  //   text: location,
  //   hintText: 'Job Title',
  //   onChanged: searchData,
  // );
  // Widget buildSearch2() => SearchWidgetHome(
  //   text: location,
  //   hintText: 'Location',
  //   onChanged: searchData,
  // );
  //
  // Future searchData(String query) async{
  //   final search = await Requests.getSearch(query);
  //   if( !mounted ) return;
  //   setState(() {
  //     this.location =query;
  //     this.joblist = search;
  //   });
  //
  // }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_tindercard/flutter_tindercard.dart';
// import 'package:girlzwhosell/model/login_model.dart';
// import 'package:girlzwhosell/new_widgets/company_card.dart';
// import 'package:girlzwhosell/new_widgets/company_card2.dart';
// import 'package:girlzwhosell/screens/Notification_screen.dart';
// import 'package:girlzwhosell/screens/all_saved_jobs.dart';
// import 'package:girlzwhosell/screens/main_menu/all_jobs.dart';
// import 'package:girlzwhosell/utils/constants.dart';
// import 'package:girlzwhosell/utils/size_config.dart';
// import 'package:girlzwhosell/views/job_detail.dart';
// import 'package:girlzwhosell/widgets/job_card1.dart';
// import 'general_search.dart';
//
//
// class HomeSearch extends StatefulWidget {
//   final uName;
//   final password;
//   final user_Id;
//   final String firstName;
//   // final cookiee;
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//   final List<SeekerDetails> userDetails;
//
//   final jobId;
//
//   const HomeSearch({Key key,this.uName,this.password,this.user_Id, this.firstName,this.jobDetails, this.favoriteJobs, this.userDetails,this.jobId}) : super(key: key);
//   @override
//   _HomeSearchState createState() => _HomeSearchState(uName:uName,password:password,user_Id: user_Id , firstName: firstName, jobDetails: jobDetails , favoriteJobs: favoriteJobs , jobId: jobId);
// }
//
// class _HomeSearchState extends State<HomeSearch> {
//   final uName;
//   final password;
//   final user_Id;
//   final String firstName;
// //  final cookiee;
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//   final List<SeekerDetails> userDetails;
//   final jobId;
//
//
//   _HomeSearchState({this.uName,this.password,this.user_Id,this.firstName,this.jobDetails, this.favoriteJobs, this.userDetails,this.jobId});
//
//
//   List<Widget> children = [
//     CompanyCard(),
//     CompanyCard2(),
//   ];
//
//
//
//
//   @override
//   void initState() {
//     print('jobDetailslength${jobDetails.length}');
//     print('userid${user_Id}');
//     //print('cookie${cookiee}');
//     // print('jobid ${jobId}');
//     print('firstname is: $firstName');
//     print('uName on homesearch : $uName');
//     print('pass on homesearch : $password');
//     super.initState();
//   }
//   // Future<bool> _exitApp(BuildContext context) {
//   //   return showDialog(
//   //     builder: (context) => AlertDialog(
//   //       title: Text('Do you want to exit this application?'),
//   //       actions: <Widget>[
//   //         ElevatedButton(
//   //           onPressed: () {
//   //             print("you choose no");
//   //             Navigator.of(context).pop(false);
//   //           },
//   //           child: Text('No',style: TextStyle(
//   //               color: Colors.white,
//   //               fontSize: 20,
//   //               fontWeight: FontWeight.bold
//   //           ),),
//   //           style: ElevatedButton.styleFrom(
//   //             shape: RoundedRectangleBorder(
//   //               borderRadius: BorderRadius.circular(10),
//   //             ),
//   //             primary: Colors.blue[800],
//   //
//   //           ),
//   //         ),
//   //         ElevatedButton(
//   //           onPressed: () {
//   //             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
//   //           },
//   //           child: Text('Yes',
//   //             style: TextStyle(
//   //                 color: Colors.white,
//   //                 fontSize: 20,
//   //                 fontWeight: FontWeight.bold
//   //             ),),
//   //           style: ElevatedButton.styleFrom(
//   //             shape: RoundedRectangleBorder(
//   //               borderRadius: BorderRadius.circular(10),
//   //             ),
//   //             primary: Colors.blue[800],
//   //           ),
//   //         )],
//   //     ), context: context,
//   //   ) ??
//   //       false;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, height: 890, width: 414, allowFontScaling: true);
//     SizeConfig().init(context);
//     CardController controller; //Use this to trigger swap.
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 child:Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 12.0 ,top: 32),
//                       child: Text("Let's Find" , style: TextStyle(
//                         color: Colors.blue[800],
//                         height: 1.5,
//                         fontSize: 24.0,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 28.0,top: 50),
//                       child: Align(
//                           alignment: Alignment.centerRight,
//                           child: GestureDetector(
//                               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: ((context)=>NotificationScreen(user_Id: user_Id))));
//                               },
//                               child: Image.asset('assets/images/notification.png',scale: 1.0,color: Colors.black,))),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 12.0 ,top: 60),
//                       child: Text("Your Dream Job" ,
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           color: Colors.pinkAccent[200],
//                           height: 1.5,
//                           fontSize: 24.0,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ) ,
//               ),
//               SizedBox(height: 21.0),
//               Padding(
//                 padding: const EdgeInsets.only(left: 12.0,right: 12),
//                 child: Container(
//                   // color: Colors.yellow,
//                   width: SizeConfig.screenWidth,
//                   height: 60.0,
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return JobSearchSecond(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId);},
//                         ),
//                       );},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.0),
//                         border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6)),
//                       ),
//                       child: ListTile(
//                         leading: Padding(
//                           padding: const EdgeInsets.only(left: 9.0 ,top:8 ,bottom: 9 ),
//                           child: Image.asset('assets/images/search.png' , color: Color.fromRGBO(148, 160, 180, 1)),
//                         ),
//                         title: Text('Job Title',
//                           style: TextStyle(
//                               height: 1.5,
//                               fontSize: 16.0,
//                               fontFamily: 'Questrial',
//                               fontStyle: FontStyle.normal,
//                               fontWeight: FontWeight.w500,
//                               color: Color.fromRGBO(148, 160, 180, 1)
//                             /* letterSpacing: 0.0, */
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Padding(
//                 padding: const EdgeInsets.only(left: 12.0,right: 12),
//                 child: Container(
//                   // color: Colors.yellow,
//                   width: SizeConfig.screenWidth,
//                   height: 60.0,
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return JobSearchSecond(uName: uName,password: password,user_Id: user_Id, firstName: firstName,jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId);
//                           },
//                         ),
//                       );},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.0),
//                         border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6)),
//                       ),
//                       child: ListTile(
//                         leading: Padding(
//                           padding: const EdgeInsets.only(left: 9.0 ,top:8 ,bottom: 9 ),
//                           child: Image.asset('assets/images/location.png' , color: Color.fromRGBO(148, 160, 180, 1)),
//                         ),
//                         title: Text('Location',
//                           style: TextStyle(
//                               height: 1.5,
//                               fontSize: 16.0,
//                               fontFamily: 'Questrial',
//                               fontStyle: FontStyle.normal,
//                               fontWeight: FontWeight.w500,
//                               color: Color.fromRGBO(148, 160, 180, 1)
//                             /* letterSpacing: 0.0, */
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 31.0),
//               Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0),
//                     child: Text(
//                       "Jobs For You",
//                       style:TextStyle(
//                         fontFamily: 'Questrial',
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                         fontSize: 20.0,
//                         //fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 12.0),
//                     child: GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>AllJobs(uName: uName,password: password, user_Id: user_Id,firstName:firstName,jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId,)));
//                       },
//                       child: Text('See All' , style: TextStyle(
//                         fontFamily: 'Questrial',
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.blueGrey[300],
//                         fontSize: 16.0,
//                         //fontWeight: FontWeight.w700,
//                       ),),
//                     ),
//                   ),
//
//                 ],
//               ),
//               SizedBox(height: 25.5),
//               Container(
//                 width: SizeConfig.screenWidth,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     physics: const PageScrollPhysics(), // this for snapping
//                     itemCount: jobDetails.length,
//                     itemBuilder: (context , index)=> index%2 == 0 ? GestureDetector(
//                         onTap: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => JobDetail(uName:uName,password: password, firstName: firstName, jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
//                             ),);
//                         },
//                         child : CompanyCard(jobDetails: jobDetails[index],userId: user_Id,))
//                         : GestureDetector(
//                         onTap: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => JobDetail(uName:uName,password: password, firstName: firstName, jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
//                             ),);
//                         },
//                         child: CompanyCard2(jobDetails: jobDetails[index],userId: user_Id,))
//                 ),
//               ),
//               // Container(
//               //   alignment: Alignment.centerLeft,
//               // //  color: Colors.yellow,
//               //   height: MediaQuery.of(context).size.height * 0.5,
//               //   child: new TinderSwapCard(
//               //     swipeUp: true,
//               //     swipeDown: true,
//               //     orientation: AmassOrientation.BOTTOM,
//               //     totalNum: jobDetails.length,
//               //     // totalNum: welcomeImages.length,
//               //     stackNum: 3,
//               //     swipeEdge: 4.0,
//               //     maxWidth: MediaQuery.of(context).size.width * 0.9,
//               //     maxHeight: MediaQuery.of(context).size.width * 0.9,
//               //     minWidth: MediaQuery.of(context).size.width * 0.8,
//               //     minHeight: MediaQuery.of(context).size.width * 0.8,
//               //     cardBuilder: (context, index) => GestureDetector(
//               //         onTap: (){
//               //           Navigator.push(
//               //             context,
//               //             MaterialPageRoute(
//               //               builder: (context) => JobDetail(uName:uName,password: password, firstName: firstName, jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
//               //             ),);
//               //           },
//               //         child: AllJobCard(jobDetails: jobDetails[index], userId:user_Id)),
//               //     cardController: controller = CardController(),
//               //     swipeUpdateCallback:
//               //         (DragUpdateDetails details, Alignment align) {
//               //       /// Get swiping card's alignment
//               //       if (align.x < 0) {
//               //         //Card is LEFT swiping
//               //       } else if (align.x > 0) {
//               //         //Card is RIGHT swiping
//               //       }
//               //     },
//               //     swipeCompleteCallback:
//               //         (CardSwipeOrientation orientation, int index) {
//               //       /// Get orientation & index of swiped card!
//               //           ///
//               //     },
//               //   ),
//               // ),
//               SizedBox(height: 31.0),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children:[ Padding(
//                     padding: const EdgeInsets.only(left: 12.0),
//                     child: Text(
//                       "Saved Jobs",
//                       style:TextStyle(
//                         fontFamily: 'Questrial',
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                         fontSize: 20.0,
//                         //fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 12.0),
//                       child: GestureDetector(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>AllSavedJobs( user_Id: user_Id, firstName:firstName ,uName: uName,password: password,)));
//
//                         },
//                         child: Text(
//                           "See All",
//                           style:TextStyle(
//                             fontFamily: 'Questrial',
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.blueGrey[300],
//                             fontSize: 16.0,
//                             //fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ]),
//               SizedBox(height: 12.5),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: favoriteJobs == null ? Container(
//                     child:Center(
//                       child:Text('No Saved Jobs !' , style:
//                       TextStyle(
//                           fontSize: 16 ,
//                           fontFamily: 'Questrial',
//                           fontWeight: FontWeight.w400,
//                           fontStyle: FontStyle.normal
//                       ),),
//                     ) ,
//                   ): Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: favoriteJobs.asMap().entries.map(
//                           (item) => Container(
//                         padding: EdgeInsets.only(right: 16),
//                         child: JobCard1(favoriteJobs: item.value, user_Id: user_Id,uName: uName,password: password,firstName: firstName,jobDetails: jobDetails,userDetails: userDetails,jobId: jobId,),
//                       ),
//                     ).toList(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
