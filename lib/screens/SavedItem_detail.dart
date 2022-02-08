import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/job_apply_detail_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';
import 'package:girlzwhosell/utils/Storage.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/views/RequirementTab.dart';
import 'package:girlzwhosell/views/company_tab.dart';
import 'package:girlzwhosell/views/description_tab.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


class SavedScreenDetail extends StatefulWidget {

  final FavoriteJobs favoriteJobs;
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final List<JobDetails> jobDetails;
  final List<SeekerDetails> userDetails;
  final jobId;
  const SavedScreenDetail({Key key, this.favoriteJobs, this.user_Id,this.jobDetails,this.password,this.uName,this.userDetails,this.firstName,this.jobId}) : super(key: key);
  static final String uploadEndPoint = base_url+'apply_job.php';

  static final String uploadsavejob = base_url+'saved_jobs.php';

  @override
  State<SavedScreenDetail> createState() => _SavedScreenDetailState(favoriteJobs:favoriteJobs,user_Id:user_Id,jobId: jobId,firstName: firstName,userDetails: userDetails, uName: uName ,password: password);
}

class _SavedScreenDetailState extends State<SavedScreenDetail> {
  final uName;
  final password;
  final String firstName;
//  final cookiee;
  final List<JobDetails> jobDetails;
  final List<SeekerDetails> userDetails;
  final jobId;
  final user_Id;
  bool isLiked=false;
  String errMessage = 'Error Uploading Slip';
  String status = '';
  final FavoriteJobs favoriteJobs;
  _SavedScreenDetailState({this.favoriteJobs, this.user_Id ,this.jobId,this.firstName,this.userDetails,this.uName,this.password,this.jobDetails});

  var SaveResponse;
  var Result;
  bool IsButton;
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String removefavjob = base_url + 'unsave_job.php';
  @override
  void initState() {
    super.initState();
    print("userid: $user_Id");
    print("sharedname: $uName");
    print("sahredpass: $password");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [

          GestureDetector(
            onTap: (){
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
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: GestureDetector(
          //     onTap: savejob,
          //     child:Result==200 ?Image.asset('assets/images/heart2.png',):Image.asset('assets/images/Liked.png.png', color: Colors.black),
          //   ),
          // )

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
          '${widget.favoriteJobs.companyName ?? " "}',
          style:TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 17.0,
            //fontWeight: FontWeight.w700,
          ),
          // style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 50.0),
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
              Container(
                constraints: BoxConstraints(maxHeight: 300.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                       child:  Image.network(favoriteJobs.companyLogo ?? " "),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      favoriteJobs.title,
                      style:TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '${favoriteJobs.companyName ?? " "} '+'\- ${favoriteJobs.name ?? " "}',
                      style:TextStyle(
                        fontFamily: 'Questrial',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey[300],
                        fontSize: 15.0,
                        //fontWeight: FontWeight.w700,
                      ),
                      // style: kTitleStyle,
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          child:Padding(
                            padding: const EdgeInsets.only(top: 15,left: 10.0),
                            child: Text(favoriteJobs.jobType ?? " " , style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 82, 174, 1),
                              fontSize: 16.0,
                              //fontWeight: FontWeight.w700,
                            ),),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 248, 1.0),
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          child:Padding(
                            padding: const EdgeInsets.only(top: 15,left: 10.0),
                            child: Text(favoriteJobs.jobType ?? " " ,  style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 82, 174, 1),
                              fontSize: 16.0,
                              //fontWeight: FontWeight.w700,
                            ),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '\$${favoriteJobs.minSalary ?? " "} '+'\-${favoriteJobs.maxSalary ?? " "+ '/month'}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),

                    Expanded(
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.blueGrey,
                          indicatorColor: Color.fromRGBO(255, 65, 129, 1),
                          indicatorWeight: 2,
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
                    )
                  ],
                ),
              ),
            //  SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    DescriptionTabtwo(favoriteJobs: widget.favoriteJobs,),
                    RequirementsTabtwo(favoriteJobs: widget.favoriteJobs),
                    CompanyTabtwo(favoriteJobs: widget.favoriteJobs),
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
                await Navigator.push(context, MaterialPageRoute(builder: (context)=>SavedJobApply(favoriteJobs:favoriteJobs,uName: uName,password: password,userDetails:userDetails,user_Id: user_Id,firstName: firstName,)));
              }
            });
          },
            //  onTap: applynow,
            child: Container(
              height: kSpacingUnit * 6,
              decoration: BoxDecoration(
                color: Colors.pinkAccent[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Apply',
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
      final response = await http.post(Uri.parse(url) , body:{
        "user_id": user_Id,
        "job_id": favoriteJobs.jobId,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        jobAppliedDetailModel = JobAppliedDetailModel.fromJson(json.decode(response.body));
        return jobAppliedDetailModel;
      }
    } catch (e) {
      print("Error in exception::: ${e.toString()}");
    }
  }

  // applynow() {
  //
  //   http.post(Uri.parse(SavedScreenDetail.uploadEndPoint), body: {
  //     "user_id": user_Id,
  //     "job_id": favoriteJobs.jobId,
  //     "emp_id": favoriteJobs.id,
  //     "cover_letter": "123456",
  //     "applied_date": getCurrentDate(),
  //
  //   }).then((result) {
  //     Result=result.statusCode;
  //     print('Appliedresult$Result');
  //     setStatus(result.statusCode == 200 ? result.body : errMessage);
  //     if (result.statusCode == 200) {
  //       Fluttertoast.showToast(
  //           msg: "${status}",
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.SNACKBAR,
  //           timeInSecForIosWeb: 1).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApply(jobDetails:jobDetails,user_Id:user_Id ))));
  //     }
  //   }).catchError((error) {
  //     setStatus(error);
  //   });
  // }
  // savejob() {
  //
  //   http.post(Uri.parse(SavedScreenDetail.uploadsavejob), body: {
  //     "user_id": user_Id,
  //     "job_id": favoriteJobs.jobId,
  //
  //   }).then((result) {
  //     setStatus(result.statusCode == 200 ? result.body : errMessage);
  //     SaveResponse= result.statusCode;
  //     print('SaveResponseinSaveitem_detail $SaveResponse');
  //     if (result.statusCode == 200) {
  //       Fluttertoast.showToast(
  //           msg: "${status}",
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.SNACKBAR,
  //           timeInSecForIosWeb: 1);
  //     }
  //   }).catchError((error) {
  //     setStatus(error);
  //   });
  // }

  Future savejob() async {
    String uid;
    String Jid;
    var res = await http.post(
        uploadsavejob , body: {
      "user_id": user_Id,
      "job_id": favoriteJobs.jobId,
    });
    if(res.statusCode == 200 ) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // print("==================SharedPrefrence values==================");
      //
      // final prefs = await SharedPreferences.getInstance();
      //
      // prefs.setString('user_Id', user_Id);
      // prefs.setString('job_Id', favoriteJobs.jobId);
      // prefs.setBool('stateOfButton', true);
      //
      // uid = await prefs.getString('user_Id');
      // Jid = await prefs.getString('job_Id');
      // IsButton = prefs.getBool('stateOfButton');
      //
      // print('userid is :$uid');
      // print('jobid is : $Jid');
      // print('IsButton : $IsButton');

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
      "user_id": user_Id,
      "job_id": favoriteJobs.jobId,
    });
    if(res.statusCode == 200 ) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // print("==================SharedPrefrence values==================");
      //
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('user_Id', user_Id);
      // prefs.setString('job_Id', favoriteJobs.jobId);
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



class SavedScreenDetailTwo extends StatefulWidget {

  final  user_Id;
  final  SavedJobs savedJobs;
  final JobDetails jobDetails;
  final cv;
  final resumee;
  final uName;
  final password;
  final String firstName;

  const SavedScreenDetailTwo({Key key,this.user_Id,this.savedJobs, this.jobDetails,this.cv,this.resumee ,this.uName,this.password ,this.firstName}) : super(key: key);
  static final String uploadEndPoint = base_url+'apply_job.php';

  static final String uploadsavejob = base_url+'saved_jobs.php';

  @override
  State<SavedScreenDetailTwo> createState() => _SavedScreenDetailTwoState(user_Id:user_Id,savedJobs: savedJobs ,cv: cv,resumee: resumee ,uName: uName,password: password,firstName: firstName);
}

class _SavedScreenDetailTwoState extends State<SavedScreenDetailTwo> {

  final user_Id;
  bool IsButton;
  bool isLiked;
  String errMessage = 'Error Uploading Slip';
  String status = '';
  final SavedJobs savedJobs;
  final JobDetails jobDetails;
  final List<SeekerDetails> userDetails;
  final uName;
  final password;
  final String firstName;

  _SavedScreenDetailTwoState( {this.user_Id ,this.savedJobs, this.jobDetails ,this.userDetails,this.cv,this.resumee ,this.uName,this.password ,this.firstName});

  var SaveResponse;
  var Result;
  String cv;
  String resumee;
  Storage storage = new Storage();
   final String uploadsavejob = base_url + 'saved_jobs.php';
   final String removefavjob = base_url + 'unsave_job.php';
  @override
  void initState() {
    super.initState();
    print("userid: $user_Id");
    print("userid: $uName");
    print("pass For SavedJobsAPi: $password");
    print("userid: $firstName");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: GestureDetector(
          //     onTap: savejob,
          //     child:Result==200 ?Image.asset('assets/images/heart2.png',):Image.asset('assets/images/Liked.png.png', color: Colors.black),
          //   ),
          // )
          GestureDetector(
            onTap: () {
              if(isLiked == true){
                IsButton = true;
                savejob();
              }else{
                Unsave();
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
                    Unsave();
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
         '${savedJobs.companyName}',
          style:TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.0,
          ),
          // style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 50.0),
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
              Container(
                constraints: BoxConstraints(maxHeight: 300.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        child:  Image.network(savedJobs.companyLogo ?? " "),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('${savedJobs.title}',
                      style:TextStyle(
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
                      '${savedJobs.companyName} '+'\-${savedJobs.name}',
                      style:TextStyle(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(238, 242, 248, 1.0),
                                borderRadius: BorderRadius.circular(12.0)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.only(top: 10,left: 10.0),
                              child: Text('${savedJobs.jobType ?? " "}' ,style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[800],
                                fontSize: 16.0,
                                //fontWeight: FontWeight.w700,
                              ),),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(238, 242, 248, 1.0),
                                borderRadius: BorderRadius.circular(12.0)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.only(top: 10,left: 10.0),
                              child: Text(savedJobs.type ?? " " ,style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[800],
                                fontSize: 16.0,
                                //fontWeight: FontWeight.w700,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${savedJobs.minSalary} '+'\-${savedJobs.maxSalary}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),

                    Material(
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
                        indicatorWeight: 2,
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
                    )
                  ],
                ),
              ),
              //  SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    DescriptionTabthree(savedJobs: savedJobs,),
                    RequirementsTabthree(savedJobs: savedJobs),
                    CompanyTabthree(savedJobs: savedJobs),
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
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>SavedJobApply1(
                    favoriteJobs: savedJobs,uName:uName,password: password,
                    userDetails:userDetails,user_Id: user_Id,firstName: firstName,
                    cv: cv,resumee: resumee,)));
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
                  'Apply',
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

  // applynow() {
  //
  //   http.post(Uri.parse(SavedScreenDetailTwo.uploadEndPoint), body: {
  //     "user_id": user_Id,
  //     "job_id": savedJobs.jobId,
  //     "emp_id": savedJobs.id,
  //     "cover_letter": "123456",
  //     "applied_date": getCurrentDate(),
  //
  //   }).then((result) {
  //     Result=result.statusCode;
  //     print('Appliedresult$Result');
  //     setStatus(result.statusCode == 200 ? result.body : errMessage);
  //     if (result.statusCode == 200) {
  //       Fluttertoast.showToast(
  //           msg: "${status}",
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.SNACKBAR,
  //           timeInSecForIosWeb: 1).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApply(jobDetails:jobDetails,user_Id:user_Id ))));
  //     }
  //   }).catchError((error) {
  //     setStatus(error);
  //   });
  // }
  Future<JobAppliedDetailModel> alreadyapplied() async {

    final url = "https://biitsolutions.co.uk/girlzwhosell/API/applied_job.php";
    try {
      final response = await http.post(Uri.parse(url) , body:{
        "user_id": user_Id,
        "job_id": savedJobs.jobId,
      });
      if (response.statusCode == 200) {
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        jobAppliedDetailModel = JobAppliedDetailModel.fromJson(json.decode(response.body));
        return jobAppliedDetailModel;
      }
    } catch (e) {
      print("Error in exception::: ${e.toString()}");
    }
  }
  // savejob() {
  //
  //   http.post(Uri.parse(SavedScreenDetailTwo.uploadsavejob), body: {
  //     "user_id": user_Id,
  //     "job_id": savedJobs.jobId,
  //
  //   }).then((result) {
  //     setStatus(result.statusCode == 200 ? result.body : errMessage);
  //     SaveResponse= result.statusCode;
  //     print('SaveResponseinSaveitem_detail $SaveResponse');
  //     if (result.statusCode == 200) {
  //       Fluttertoast.showToast(
  //           msg: "${status}",
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.SNACKBAR,
  //           timeInSecForIosWeb: 1);
  //     }
  //   }).catchError((error) {
  //     setStatus(error);
  //   });
  // }
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
      // print("==================SharedPrefrence values==================");
      //
      // final prefs = await SharedPreferences.getInstance();
      //
      // prefs.setString('user_Id', user_Id);
      // prefs.setString('job_Id', jobDetails.id);
      // prefs.setBool('stateOfButton', true);
      //
      // uid = await prefs.getString('user_Id');
      // Jid = await prefs.getString('job_Id');
      // IsButton = prefs.getBool('stateOfButton');

      print('userid is :$uid');
      print('jobid is : $Jid');
      print('IsButton : $IsButton');

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

  Future Unsave() async {
    String uid;
    String Jid;
    var res = await http.post(
        removefavjob, body: {
      "user_id": user_Id,
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


      showToast('Remove From Saved Jobs',
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