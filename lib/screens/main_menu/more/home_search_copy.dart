import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/main_menu/all_jobs.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';
import 'package:girlzwhosell/widgets/job_card1.dart';
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
  final cv;
  final resume;
  final String location;
  final String Location;
// PushNotificationMessage notificationInfo;

  HomeSearch(
      {Key key,
      this.uName,
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
      //,this.notificationInfo
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
        resume: resume,
        location: location, Location: Location,
        //    notificationInfo: notificationInfo
      );
}

class _HomeSearchState extends State<HomeSearch> {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  final cv;
  final resume;
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
    this.resume,
    this.location,
    this.Location,
    //  this.notificationInfo
  });
  String Location = '';
  String location = '';
  List<SearchModel> joblist = [];

// //notifications Part
//   StreamSubscription onMsgSubcription;
//   StreamSubscription notificationSubcription;
// //  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   FirebaseMessaging messaging;
//   int totalNotifications = 0;
//   //model
//   PushNotificationMessage _notificationInfo;

  //
  // void registerNotification() async {
  //
  //   messaging = FirebaseMessaging.instance;
  //
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   if ( settings.authorizationStatus == AuthorizationStatus.authorized ) {
  //     print('user granted permission');
  //
  //     //main msg
  //     notificationSubcription =
  //         FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       PushNotificationMessage notification = PushNotificationMessage(
  //         //  image: message.notification.bodyLocKey,
  //         title: message.notification.title ?? "",
  //         body: message.notification.body ?? "",
  //         Datatitle: message.data['title'],
  //         Databody: message.data['body'],
  //       );
  //
  //       setState(() {
  //         totalNotifications++;
  //         _notificationInfo = notification;
  //       });
  //       if (notification != null) {
  //         showSimpleNotification(Text('${_notificationInfo.title ?? ""}'),
  //             // leading: Image.network(_notificationInfo.image),
  //             trailing: NotificationBadge(
  //               totalNotifications: totalNotifications,
  //             ),
  //             subtitle: Text('${_notificationInfo.body ?? " "}'),
  //             background: Colors.cyan.shade700,
  //             duration: Duration(seconds: 3)
  //         );
  //       }
  //     });
  //
  //     ///app is iin bG but opened & user taps on notification
  //     onMsgSubcription = onMsgSubcription =
  //         FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //       final routeFromMsg = message.data['route'];
  //       print('routeFromMsg : $routeFromMsg');
  //     });
  //   } else {
  //     print('permission denied by User');
  //   }
  // }

  @override
  void initState() {
    print('jobDetailslength${jobDetails.length}');
    print('userid${user_Id}');
    print('firstname is: $firstName');
    print('uName on homesearch : $uName');
    print('pass on homesearch : $password');
    // registerNotification();
    super.initState();
  }
  //
  // @override
  // void dispose() {
  //   onMsgSubcription.cancel();
  //   notificationSubcription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //  ScreenUtil.init(height: 890, width: 414, allowFontScaling: true);
    SizeConfig().init(context);
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
                      padding: const EdgeInsets.only(left: 12.0, top: 16),
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
                                                user_Id: user_Id))));
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
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics:
                              const PageScrollPhysics(), // this for snapping
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
                                          jobid: jobId,
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
      ),
    );
  }
}
