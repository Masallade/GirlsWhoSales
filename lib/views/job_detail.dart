import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/model/check_saved_job.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/job_apply_detail_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/views/RequirementTab.dart';
import 'package:girlzwhosell/views/company_tab.dart';
import 'package:girlzwhosell/views/description_tab.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:favorite_button/favorite_button.dart';


class JobDetail extends StatefulWidget {

final uName;
final password;
  final Job data;
  final  JobDetails jobDetails;
  final List<SeekerDetails> userDetails;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final int  appliedStatus;
  final List<FavoriteJobs> favoriteJobs;
  final String jobid;
 final cv;
  final resumee;
  const JobDetail(
      {Key key,
     this.uName,this.password, this.data,
      this.jobDetails,
        this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.favoriteJobs , this.appliedStatus , this.jobid ,this.cv,this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String Unsavejob = base_url + 'unsave_job.php';

  @override
  State<JobDetail> createState() => _JobDetailState(
     this.uName,this.password, this.data,
      this.jobDetails,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.jobid,
      this.favoriteJobs, this.appliedStatus ,this.cv,this.resumee);
}

class _JobDetailState extends State<JobDetail> {

  final uName;
  final password;
  final user_Id;
  final String firstName;
  final total_applied;
  final total_saved;
  final String jobid;
  final List<FavoriteJobs> favoriteJobs;

  String errMessage = 'Error Uploading Slip';
  String status = '';
  final Job data;
  final JobDetails jobDetails;
  final List<SeekerDetails> userDetails;

  var result;
  var Result;

  bool IsButton;
  bool isLiked;

  final int appliedStatus;
  bool isapplied = false;
  int resp;
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String removefavjob = base_url + 'unsave_job.php';


  String cv;
  String resumee;

  @override
  void initState() {
    super.initState();
    print("userid: $user_Id");
  // print("jobid: $jobid");
    print('firstName : $firstName');

    setState(() {
      print("AppliedStatus: ${appliedStatus}");
    });
  }

  _JobDetailState(this.uName, this.password, this.data, this.jobDetails,
      this.userDetails, this.user_Id, this.firstName,
      this.total_applied, this.total_saved, this.jobid, this.favoriteJobs,
      this.appliedStatus, this.cv, this.resumee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              if(isLiked == true){
                IsButton = true;
                savejob();
              }else{
                Unsavejob();
              }
            },
           child: Padding(
             padding: const EdgeInsets.only(right: 20.0),
             child: FavoriteButton(
               isFavorite: false,
               valueChanged: (isLiked) {
                print('Is Favorite : $isLiked');
                 if(isLiked) {
                   savejob();
                 }else{
                   Unsavejob();
                 }
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
        title: Text(
          '${jobDetails.companyName ?? " "}',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
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
                            '${jobDetails.companyLogo == null ? '' : jobDetails
                                .companyLogo }')),
                    SizedBox(height: 8.0),
                    Text(
                      '${jobDetails.title ?? " "}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${jobDetails.companyName ?? " "} ' +
                          '\- ${jobDetails.location ?? " "}',
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
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 15, left: 10.0),
                            child: Text(
                              '${jobDetails.jobType ?? " "}',style: TextStyle(
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 15, left: 10.0),
                            child: Text(
                              '${jobDetails.type ?? " "}',
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
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$ ${jobDetails.minSalary ?? " "} ' +
                          '\- ${jobDetails.maxSalary ?? " "}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                    // SizedBox(height: 20,),
                    Expanded(
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          // side: BorderSide(
                          //   color: Colors.black.withOpacity(.2),
                          // ),
                        ),
                        // borderRadius: BorderRadius.circular(12.0),
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
                    DescriptionTab(jobDetails: jobDetails),
                    RequirementsTab(jobDetails: jobDetails),
                    CompanyTab(jobDetails: jobDetails),
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
            onTap: () async{
                alreadyapplied().then((value) async{
                  if(value.status == 200) {

                    showToast('This is normal toast with animation',
                      context: context,
                      animation: StyledToastAnimation.scale,
                    );
                    showToast("You've Alreay Applied \n For this Job",
                      context: context,
                      fullWidth: true,
                      backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
                      animation: StyledToastAnimation.slideFromBottomFade,
                      reverseAnimation: StyledToastAnimation.fade,
                      position: StyledToastPosition.bottom,
                      animDuration: Duration(seconds: 2),
                      duration: Duration(seconds: 4),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.linear,
                    );

                  }
                  if(value.status == 100){
                    // final snackBar = SnackBar(content: Text('Email Sent!!!!'));
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    await  Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                JobApply(uName: uName,
                                  password: password,
                                  jobDetails: jobDetails,
                                  userDetails: userDetails,
                                  user_Id: user_Id,
                                  firstName: firstName,
                                  cv: cv,
                                  resumee: resumee)));
                  }
                });
            },
            child: Container(
              height: kSpacingUnit * 6,
              decoration: BoxDecoration(
                color: Colors.pinkAccent[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
             //     ignore: unrelated_type_equality_checks
                 appliedStatus == 1 ? "Already Applied" :"Apply",
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
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/applied_job.php";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "user_id": user_Id,
        "job_id": jobDetails.id,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print('${jobDetails.id}');
        print("Status Code is: ${response.statusCode}");
        jobAppliedDetailModel =
            JobAppliedDetailModel.fromJson(json.decode(response.body));
        return jobAppliedDetailModel;
      }
    } catch (e) {
      print("Error in exception::: ${e.toString()}");
    }
  }
  Future<CheckSaved> alreadySavedJob() async {
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/check_saved_job.php";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "user_id": user_Id,
        "job_id": jobDetails.id,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print('${jobDetails.id}');
        print("Status Code is: ${response.statusCode}");
        checkSaved =
            CheckSaved.fromJson(json.decode(response.body));
        return checkSaved;
      }
    } catch (e) {
      print("Error in exception::: ${e.toString()}");
    }
  }


  /////////
  Future savejob() async {
    String uid;
    String Jid;
    var res = await http.post(
        uploadsavejob , body: {
      "user_id": user_Id,
      "job_id": jobDetails.id,
    });
    if(res.statusCode == 200 ) {
     // SharedPreferences prefs = await SharedPreferences.getInstance();
     //  print("==================SharedPrefrence values==================");
     //
     //  final prefs = await SharedPreferences.getInstance();
     //
     //  prefs.setString('user_Id', user_Id);
     //  prefs.setString('job_Id', jobDetails.id);
     //  prefs.setBool('stateOfButton', true);
     //
     //   uid = await prefs.getString('user_Id');
     //   Jid = await prefs.getString('job_Id');
     //  IsButton = prefs.getBool('stateOfButton');
     //
     //  print('userid is :$uid');
     //  print('jobid is : $Jid');
     //  print('IsButton : $IsButton');

      print("==================Response values==================");
      print(res.body);

      showToast('Added To Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
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
    String uid;
    String Jid;
    var res = await http.post(
        removefavjob, body: {
      "seeker_id": user_Id,
      "job_id": jobDetails.id,
    });
    if(res.statusCode == 200 ) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // print("==================SharedPrefrence values==================");
      //
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('user_Id', user_Id);
      // prefs.setString('job_Id', jobDetails.id);
      // uid = await prefs.getString('user_Id');
      // Jid = await prefs.getString('job_Id');
      // print('userid is :$uid');
      // print('jobid is : $Jid');

      print("==================Response values==================");
      print(res.body);


      showToast('Removed From Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
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
  final Job data;
  final SearchModel joblist;
 // final  JobDetails jobDetails;
  final List<SeekerDetails> userDetails;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final int  appliedStatus;
  final List<FavoriteJobs> favoriteJobs;
  final String jobid;
  final cv;
  final resumee;
  const JobDetailOne(
      {Key key,
        this.uName,this.password, this.data,
        this.joblist,
        this.userDetails,
        this.user_Id,
        this.firstName,
        this.total_applied,
        this.total_saved,
        this.favoriteJobs , this.appliedStatus , this.jobid ,this.cv,this.resumee})
      : super(key: key);

  static final String uploadEndPoint = base_url + 'apply_job.php';
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String Unsavejob = base_url + 'unsave_job.php';

  @override
  State<JobDetailOne> createState() => _JobDetailOneState(
      this.uName,this.password, this.data,
      this.joblist,
      this.userDetails,
      this.user_Id,
      this.firstName,
      this.total_applied,
      this.total_saved,
      this.jobid,
      this.favoriteJobs, this.appliedStatus ,this.cv,this.resumee);
}

class _JobDetailOneState extends State<JobDetailOne> {

  final uName;
  final password;
  final user_Id;
  final String firstName;
  final total_applied;
  final total_saved;
  final String jobid;
  final List<FavoriteJobs> favoriteJobs;

  String errMessage = 'Error Uploading Slip';
  String status = '';
  final Job data;
  final SearchModel joblist;
  // final JobDetails jobDetails;
  final List<SeekerDetails> userDetails;

  var result;
  var Result;

  bool IsButton;
  bool isLiked;

  final int appliedStatus;
  bool isapplied = false;
  int resp;
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String removefavjob = base_url + 'unsave_job.php';


  String cv;
  String resumee;

  @override
  void initState() {
    super.initState();
    print("userid: $user_Id");
    // print("jobid: $jobid");
    print('firstName : $firstName');

    setState(() {
      print("AppliedStatus: ${appliedStatus}");
    });
  }

  _JobDetailOneState(this.uName, this.password, this.data, this.joblist,
      this.userDetails, this.user_Id, this.firstName,
      this.total_applied, this.total_saved, this.jobid, this.favoriteJobs,
      this.appliedStatus, this.cv, this.resumee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              if(isLiked == true){
                IsButton = true;
                savejob();
              }else{
                Unsavejob();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: FavoriteButton(
                isFavorite: false,
                valueChanged: (isLiked) {
                  print('Is Favorite : $isLiked');
                  if(isLiked) {
                    savejob();
                  }else{
                    Unsavejob();
                  }
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
        title: Text(
          '${joblist.companyName ?? " "}',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
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
                            '${joblist.companyLogo == null ? '' : joblist
                                .companyLogo }')),
                    SizedBox(height: 8.0),
                    Text(
                      '${joblist.title ?? " "}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${joblist.companyName ?? " "} ' +
                          '\- ${joblist.location ?? " "}',
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
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 15, left: 10.0),
                            child: Text(
                              '${joblist.jobType ?? " "}',style: TextStyle(
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 15, left: 10.0),
                            child: Text(
                              '${joblist.type ?? " "}',
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
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$ ${joblist.minSalary ?? " "} ' +
                          '\- ${joblist.maxSalary ?? " "}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                    // SizedBox(height: 20,),
                    Expanded(
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          // side: BorderSide(
                          //   color: Colors.black.withOpacity(.2),
                          // ),
                        ),
                        // borderRadius: BorderRadius.circular(12.0),
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
            onTap: () async{
              alreadyapplied().then((value) async{
                if(value.status == 200) {

                  showToast('This is normal toast with animation',
                    context: context,
                    animation: StyledToastAnimation.scale,
                  );
                  showToast("You've Alreay Applied \n For this Job",
                    context: context,
                    fullWidth: true,
                    backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
                    animation: StyledToastAnimation.slideFromBottomFade,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.bottom,
                    animDuration: Duration(seconds: 2),
                    duration: Duration(seconds: 4),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.linear,
                  );

                }
                if(value.status == 100){
                  // final snackBar = SnackBar(content: Text('Email Sent!!!!'));
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  await  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      SearchApply(uName: uName,
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
              height: kSpacingUnit * 6,
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
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/applied_job.php";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "user_id": user_Id,
        "job_id": joblist.id,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print('${joblist.id}');
        print("Status Code is: ${response.statusCode}");
        jobAppliedDetailModel =
            JobAppliedDetailModel.fromJson(json.decode(response.body));
        return jobAppliedDetailModel;
      }
    } catch (e) {
      print("Error in exception::: ${e.toString()}");
    }
  }

  /////////
  Future savejob() async {
    String uid;
    String Jid;
    var res = await http.post(
        uploadsavejob , body: {
      "user_id": user_Id,
      "job_id": joblist.id,
    });
    if(res.statusCode == 200 ) {
      print("==================Response values==================");
      print(res.body);

      showToast('Added To Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
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
    String uid;
    String Jid;
    var res = await http.post(
        removefavjob, body: {
      "seeker_id": user_Id,
      "job_id": joblist.id,
    });
    if(res.statusCode == 200 ) {
      print("==================Response values==================");
      print(res.body);
      showToast('Removed From Saved Jobs',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
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

