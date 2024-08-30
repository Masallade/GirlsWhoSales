// ignore_for_file: missing_return
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/dawood/data/already_applied_job_details_version.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_container_button.dart';
import 'package:girlzwhosell/dawood/presentation/job_details/widgets/job_heading_header.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/check_saved_job.dart';
import 'package:girlzwhosell/dawood/domain/job.dart';
import 'package:girlzwhosell/model/job_apply_detail_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';
import 'package:girlzwhosell/user_preferences/user_pref_manager.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/views/RequirementTab.dart';
import 'package:girlzwhosell/views/company_tab.dart';
import 'package:girlzwhosell/views/description_tab.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:favorite_button/favorite_button.dart';



class JobDetail extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;
  final Job? data;
  final int? appliedStatus;
  final int index;
  // final uName;
  // final password;
  // final List<SeekerDetails>? userDetails;
  // final user_Id;
  // final firstName;
  // final total_applied;
  // final total_saved;
  // final List<FavoriteJobs>? favoriteJobs;
  // final cv;
  // final resumee;

  const JobDetail(
      {Key? key,
        required this.currentUserDetails,
        this.data,
        this.appliedStatus,
        required this.index,
      // this.uName,
      // this.password,
      // this.userDetails,
      // this.user_Id,
      // this.firstName,
      // this.total_applied,
      // this.total_saved,
      // this.favoriteJobs,
      // this.cv,
      // this.resumee
  })
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String Unsavejob = base_url + 'unsave_job.php';

  @override
  State<JobDetail> createState() => _JobDetailState(
    this.data,
    this.appliedStatus,
    currentUserDetails: currentUserDetails,
      index: index
      // this.uName,
      // this.password,
      // this.user_Id,
      // this.firstName,
      // this.cv,
      // this.resumee
      // this.total_applied,
      // this.total_saved,
      // this.userDetails,
      // this.favoriteJobs,

      );
}

class _JobDetailState extends State<JobDetail> {
  // final uName;
  // final password;
  // final user_Id;
  // final String? firstName;
  // final total_applied;
  // final total_saved;
  // String? cv;
  // String? resumee;
  // final List<FavoriteJobs>? favoriteJobs;
  // final List<SeekerDetails>? userDetails;
  final CurrentUserDetails currentUserDetails;
  final Job? data;
  final int? appliedStatus;
  final int index;

  _JobDetailState(
      this.data,
      this.appliedStatus,
      {required this.currentUserDetails,
        required this.index,}


    // this.uName,
    // this.password,
    // this.userDetails,
    // this.user_Id,
    // this.firstName,
    // this.total_applied,
    // this.total_saved,
    // this.favoriteJobs,

    // this.cv,
    // this.resumee

  );





  String errMessage = 'Error Uploading Slip';
  String status = '';
  var result;
  var Result;
  bool? IsButton;
  late bool isLiked;
  bool isapplied = false;
  int? resp;
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String removefavjob = base_url + 'unsave_job.php';






  @override
  void initState() {


    super.initState();
    print("userid: ${currentUserDetails.user_Id}");
    // print("jobid: $jobid");
    print('firstName : ${currentUserDetails.firstName}');

    setState(() {
      print("AppliedStatus: ${appliedStatus}");
    });
  }

  bool getJobStatus(){
    if(SharedPreferencesManager.getUserPref("${currentUserDetails.user_Id}_${currentUserDetails.jobId}") == false){
      return false;
    }

    else
      print("true");
    return true;
  }

  Future<bool> ShowsavedJobs(BuildContext context) {
    return showDialog(
          builder: (context) => SimpleDialog(
            elevation: 2.0,
            //   backgroundColor: Colors.pinkAccent.withOpacity(0.9),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Do you want to',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.blue[800],
                      height: 1.5,
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Track Your Saved Job',
                      style: TextStyle(
                        color: Colors.pinkAccent[200],
                        height: 1.5,
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  Image.asset(
                    'assets/images/check.gif',
                    scale: 1.0,
                  ),
                  InkWell(
                    onTap: () {
                      Requests.Login(
                          context,
                          currentUserDetails.uName,
                          currentUserDetails.password, 'token1',
                          false);
                    },
                    child: Container(
                      height: 52,
                      width: 120,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'Saved Job',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          context: context,
        ).then((value) => value as bool) ??
        false as Future<bool>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
              alreadySavedJob().then((value) async {
                if (value.status == 200) {
                  print('apapapapapapapapapapapapapapapap');
                  showToast(
                    'This is normal toast with animation',
                    context: context,
                    animation: StyledToastAnimation.scale,
                  );
                  showToast(
                    "You've Already Saved \n this Job",
                    context: context,
                    fullWidth: true,
                    backgroundColor: Colors.pinkAccent[200],
                    animation: StyledToastAnimation.slideFromBottomFade,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.left,
                    animDuration: Duration(seconds: 2),
                    duration: Duration(seconds: 4),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.linear,
                  );
                }
                if (value.status == 100) {
                  savejob().whenComplete(() => ShowsavedJobs(context));
                }
              }
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: FavoriteButton(
                isFavorite: getJobStatus(),//getLikeStatus()
                valueChanged: (newIsLiked) {

                  print('debuging 1');
                  isLiked = newIsLiked;
                  print('Is Favorite : $isLiked');
                  if (getJobStatus() == true) {//getLikeStatus()
                    IsButton == false;
                    isLiked = false;
                    Unsavejob();

                  } else {
                    isLiked = true;
                    savejob();
                  }

                  setState(() {
                    SharedPreferencesManager.setUserPref("${currentUserDetails.user_Id}_${currentUserDetails.jobId}",isLiked);
                    Requests.updatefavoriteJob(context,currentUserDetails.user_Id.toString());
                  });

                },
              ),
              // child: Icon(Icons.save_alt,//old code tariq
              // color: Colors.pink,),
            ),
          ),
        ],

        title: Text('${currentUserDetails.jobDetails![index].companyName ?? " "}',),),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: 10.0),
            JobHeadingHeader(jobDetails: currentUserDetails.jobDetails![index],),
            TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              tabs: [
                Tab(text: AppString.description),
                Tab(text: AppString.requirements),
                Tab(text: AppString.companyInfo),
              ],
            ),
            Flexible(
              //  fit: FlexFit.loose,
              child: TabBarView(
                children: [
                  DescriptionTab(jobDetails: currentUserDetails.jobDetails![index]),
                  RequirementsTab(jobDetails: currentUserDetails.jobDetails![index]),
                  CompanyTab(jobDetails: currentUserDetails.jobDetails![index]),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: customContainerButton(appliedStatus == 1 ? "Already Applied" : "Apply", () async {
        alreadyappliedJobDetailsVersion(userID:currentUserDetails.user_Id,jobDetailsID: currentUserDetails.jobDetails![index].id).then((value) async {
          if (value.status == 200) {
            showToast(
              'This is normal toast with animation',
              context: context,
              animation: StyledToastAnimation.scale,
            );
            showToast(
              "You've Already Applied \n For this Job",
              context: context,
              fullWidth: true,
              backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
              animation: StyledToastAnimation.slideFromBottomFade,
              reverseAnimation: StyledToastAnimation.fade,
              position: StyledToastPosition.left,
              animDuration: Duration(seconds: 2),
              duration: Duration(seconds: 4),
              curve: Curves.elasticOut,
              reverseCurve: Curves.linear,
            );
          }
          if (value.status == 100) {
            print("nhi nhi nhi  value.status == 100");
            // final snackBar = SnackBar(content: Text('Email Sent!!!!'));
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobApply(
                        uName:currentUserDetails.uName,
                        password: currentUserDetails.password,
                        jobDetails: currentUserDetails.jobDetails![index],
                        userDetails: currentUserDetails.userDetails,
                        user_Id: currentUserDetails.user_Id,
                        firstName: currentUserDetails.firstName,
                        cv: currentUserDetails.cv,
                        resumee: currentUserDetails.resumee)));
          }
        });
      },),
    );
  }



  Future<CheckSaved> alreadySavedJob() async {
    final url =
        "https://girlzwhosellcareerconextions.com/API/check_saved_job.php";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "user_id": currentUserDetails.user_Id,
        "job_id": currentUserDetails.jobDetails![index].id,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print('${currentUserDetails.jobDetails![index].id}');
        print("Status Code of already saved: ${response.statusCode}");
        checkSaved = CheckSaved.fromJson(json.decode(response.body));
        return checkSaved;
      }
      else{
        print('status code is 100');
      }
    } catch (e) {
      print("Error in exception and status code is ::: ${e.toString()}");
    }
    return checkSaved;
  }

  /////////
  Future savejob() async {
    var res = await http.post(Uri.parse(uploadsavejob), body: {
      "user_id": currentUserDetails.user_Id,
      "job_id": currentUserDetails.jobDetails![index].id,
    });
    if (res.statusCode == 200) {
      print("==================Response values==================");
      print(res.body);

      showToast(
        'Added To Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
        animation: StyledToastAnimation.slideFromLeftFade,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.top,
        animDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );

      setState(() {
        //  isapplied = true;
        isLiked = true;
      });
    }
  }

  Future Unsavejob() async {
    var res = await http.post(Uri.parse(removefavjob), body: {
      "seeker_id": currentUserDetails.user_Id,
      "job_id": currentUserDetails.jobDetails![index].id,
    });
    if (res.statusCode == 200) {

      print("==================Response values==================");
      print(res.body);

      showToast(
        'Removed From Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
        animation: StyledToastAnimation.slideFromBottomFade,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
        animDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );

      setState(() {
        //isapplied = false;
        isLiked = false;
      });
    }
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  getCurrentDate() {
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}

class JobDetailOne extends StatefulWidget {
  final uName;
  final password;
  final Job? data;
  final SearchModel? joblist;
  // final  JobDetails jobDetails;
  final List<SeekerDetails>? userDetails;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final int? appliedStatus;
  final List<FavoriteJobs>? favoriteJobs;
  final String? jobid;
  final cv;
  final resumee;
  const JobDetailOne(
      {Key? key,
      this.uName,
      this.password,
      this.data,
      this.joblist,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.favoriteJobs,
      this.appliedStatus,
      this.jobid,
      this.cv,
      this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String Unsavejob = base_url + 'unsave_job.php';

  @override
  State<JobDetailOne> createState() => _JobDetailOneState(
      this.uName,
      this.password,
      this.data,
      this.joblist,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.jobid,
      this.favoriteJobs,
      this.appliedStatus,
      this.cv,
      this.resumee);
}

class _JobDetailOneState extends State<JobDetailOne> {
  final uName;
  final password;
  final user_Id;
  final String? firstName;
  final total_applied;
  final total_saved;
  final String? jobid;
  final List<FavoriteJobs>? favoriteJobs;

  String errMessage = 'Error Uploading Slip';
  String status = '';
  final Job? data;
  final SearchModel? joblist;
  // final JobDetails jobDetails;
  final List<SeekerDetails>? userDetails;

  var result;
  var Result;

  bool? IsButton;
  late bool isLiked;

  final int? appliedStatus;
  bool isapplied = false;
  int? resp;
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String removefavjob = base_url + 'unsave_job.php';

  String? cv;
  String? resumee;
  // SharedPreferences prefs;
  @override
  void initState() {
    super.initState();

    getJobStatus();
    setState(() {
      print("job status:==============>>>>>>>>>>>>>>>>>>>>> ${jobid}");
    });
  }
  bool getJobStatus(){
    if(SharedPreferencesManager.getUserPref("${user_Id}_${jobid}") == false)
      return false;
    else
      return true;
  }



  _JobDetailOneState(
      this.uName,
      this.password,
      this.data,
      this.joblist,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.jobid,
      this.favoriteJobs,
      this.appliedStatus,
      this.cv,
      this.resumee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [

          GestureDetector(//old code
            onTap: () {
              // if(isLiked == true){
              //   isLiked = false;
              // } else{
              //   isLiked = true;
              // }
              // if(isLiked == true){
              //   IsButton = true;
              //   savejob();
              // }else{
              //   Unsavejob();
              // }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              // child: Icon(Icons.save_alt,//old code tariq
              // color: Colors.pink,),
                child: FavoriteButton(
                isFavorite: getJobStatus(),//getLikeStatus()
                valueChanged: (newIsLiked) {
                  // isLiked = newIsLiked;
                  print('Is Favorite : $isLiked');
                  if (getJobStatus() == true) {
                    IsButton == false;
                    isLiked = false;
                    Unsavejob();

                  } else {
                    isLiked = true;
                    savejob();
                  }

                  setState(() {
                    SharedPreferencesManager.setUserPref("${user_Id}_${jobid}",isLiked);
                    //added for update lists
                    Requests.updatefavoriteJob(context,user_Id.toString());
                  });

                },
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            //  color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: FittedBox(
          child: Text(
            '${joblist!.companyName ?? " "}',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              //SizedBox(height: 10.0),
              Container(
                constraints: BoxConstraints(maxHeight: 290.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 70.0,
                        height: 70.0,
                        child: Image.network(
                            '${joblist!.companyLogo == null ? Placeholder() : joblist!.companyLogo}')),
                    SizedBox(height: 8.0),
                    FittedBox(
                      child: Text(
                        '${joblist!.title ?? " "}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0,
                          //fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: Text(
                        '${joblist!.companyName ?? " "} ' +
                            '\- ${joblist!.location ?? " "}',
                        style: TextStyle(
                          fontFamily: 'Questrial',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey[300],
                          fontSize: 16.0,
                          //fontWeight: FontWeight.w700,
                        ),
                        // style: kTitleStyle,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 10.0),
                            child: FittedBox(
                              child: Text(
                                '${joblist!.jobType ?? " "}',
                                style: TextStyle(
                                  fontFamily: 'Questrial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(1, 82, 174, 1),
                                  fontSize: 16.0,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 10.0),
                            child: FittedBox(
                              child: Text(
                                '${joblist!.type ?? " "}',
                                style: TextStyle(
                                  fontFamily: 'Questrial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue[800],
                                  fontSize: 16.0,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FittedBox(
                      child: FittedBox(
                        child: Text(
                          '\$ ${joblist!.minSalary ?? " "} ' +
                              '\- ${joblist!.maxSalary ?? " "}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 24.0,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20,),
                    Expanded(
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.blueGrey,
                          indicatorColor: Colors.pinkAccent[200],
                          indicatorWeight: 3,
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          // indicator: BoxDecoration(
                          //   color: Colors.blue[800],
                          //   borderRadius: BorderRadius.circular(12.0),
                          // ),
                          tabs: [
                            Tab(text: "Description"),
                            Tab(text: "Requirements"),
                            Tab(text: "Company Info"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                //  fit: FlexFit.loose,
                child: TabBarView(
                  children: [
                    DescriptionTabFour(jobList: joblist),
                    RequirementsTabFour(jobList: joblist),
                    CompanyTabFour(jobList: joblist),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: GestureDetector(
            onTap: () async {
              alreadyapplied().then((value) async {
                if (value.status == 200) {
                  showToast(
                    'This is normal toast with animation',
                    context: context,
                    animation: StyledToastAnimation.scale,
                  );
                  showToast(
                    "You've Alreay Applied \n For this Job",
                    context: context,
                    fullWidth: true,
                    backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
                    animation: StyledToastAnimation.slideFromBottomFade,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.bottom,
                    animDuration: Duration(seconds: 2),
                    duration: Duration(seconds: 4),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.linear,
                  );
                }
                if (value.status == 100) {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchApply(
                              uName: uName,
                              password: password,
                              joblist: joblist,
                              userDetails: userDetails,
                              user_Id: user_Id,
                              firstName: firstName,
                              cv: cv,
                              resumee: resumee)));
                }
              });
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.pinkAccent[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  //     ignore: unrelated_type_equality_checks
                  // appliedStatus == 1 ? "Already Applied" :"Apply",
                  "Apply",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<JobAppliedDetailModel> alreadyapplied() async {
    final url = "https://girlzwhosellcareerconextions.com/API/applied_job.php";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "user_id": user_Id,
        "job_id": joblist!.id,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print('${joblist!.id}');
        print("Status Code is: ${response.statusCode}");
        jobAppliedDetailModel =
            JobAppliedDetailModel.fromJson(json.decode(response.body));
        return jobAppliedDetailModel;
      }
    } catch (e) {
      print("Error in exception::: ${e.toString()}");
    }
    return jobAppliedDetailModel;
  }

  /////////
  Future savejob() async {
    var res = await http.post(Uri.parse(uploadsavejob), body: {
      "user_id": user_Id,
      "job_id": joblist!.id,
    });
    if (res.statusCode == 200) {
      print("==================Response values==================");
      print(res.body);

      showToast(
        'Added To Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
        animation: StyledToastAnimation.slideFromLeftFade,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.top,
        animDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );

      setState(() {
        //  isapplied = true;
        isLiked = true;
      });
    }
  }

  Future Unsavejob() async {
    var res = await http.post(Uri.parse(removefavjob), body: {
      "seeker_id": user_Id,
      "job_id": joblist!.id,
    });
    if (res.statusCode == 200) {
      print("==================Response values==================");
      print(res.body);
      showToast(
        'Removed From Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
        animation: StyledToastAnimation.slideFromBottomFade,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
        animDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );

      setState(() {
        //isapplied = false;
        isLiked = false;
      });
    }
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  getCurrentDate() {
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }


}
