import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';
import 'package:flutter_tindercard/main.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../http/Requests.dart';
import '../../model/check_saved_job.dart';
import 'new_job_details_model.dart';

class NewJobDetailss extends StatefulWidget {
  const NewJobDetailss({Key? key}) : super(key: key);

  @override
  State<NewJobDetailss> createState() => _NewJobDetailssState();
}

class _NewJobDetailssState extends State<NewJobDetailss> {

  int currentIndex = 0;
  // ignore: override_on_non_overriding_member
  // static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String dislikeJob = base_url + 'dislike_jobs.php';

  String? uName  = "";
  String? password = "";
  String? user_Id = "";
  String? firstName = "";
  String? jobId = "";

  List<New_Job_Details>? jobDetailsList;
  late List<JobDetails> jobDetails;

  void initState() {
    uName =  u_Name;
    password = u_password;
    user_Id = u_Id;
    firstName = u_firstName;
    jobId = u_jobId;

    // jobDetails  = getalljobDetails() as List<JobDetails>;

    print('userid${uName}');
    print('ALLJob Nameis ====================s: $firstName');
    print('ALLJob uName : $uName');
    print(' ALLJobpass : $password');
    super.initState();
  }

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    CardController? controller; //Use this to trigger swap.

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
          'All Jobs',
          style:TextStyle(
              fontFamily: 'Poppins' ,
              color: Colors.black,
              fontSize: 20 ,
              fontWeight: FontWeight.w500),
        ),),
      body:isActive == false ? SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 27.5,right: 27.5),
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 2.5,
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27.5 ,top: 15),
                    child: Text('Tips',style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueGrey,
                        fontSize: 20),
                    ),
                  )),
              SizedBox(height: 5.7,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 27.5),
                  child: Text('*Swipe Right for Next Job \n *Swipe Left to dislike the job',style: TextStyle(fontWeight: FontWeight.w400 ,color: Colors.blueGrey),),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.56,
                child:TinderSwapCard(
                  swipeUp: true,
                  swipeDown: false,
                  orientation: AmassOrientation.bottom,
                  totalNum: jobDetails.length,
                  stackNum: 3,
                  swipeEdge: 3.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.94,
                  maxHeight: MediaQuery.of(context).size.width * 0.94,
                  minWidth: MediaQuery.of(context).size.width * 0.93,
                  minHeight: MediaQuery.of(context).size.width * 0.93,

                  cardBuilder: (context, index) =>  index%2 == 0 ?
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetail(uName:uName,password: password,jobDetails: jobDetails[index],user_Id:user_Id,  firstName: firstName,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
                          ),);
                      },
                      child: AllJobCard(jobDetails: jobDetails[index], userId:user_Id))
                      :
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetail(uName:uName,password: password, jobDetails: jobDetails[index],user_Id:user_Id, firstName: firstName,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
                          ),);
                      },
                      child : AllJobCard2(jobDetails: jobDetails[index], userId:user_Id)),
                  cardController: controller,
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    //// Get orientation & index of swiped card!
                    print(orientation.toString());

                    if (orientation == CardSwipeOrientation.right) {
                      likeJob(index);

                    }
                    else if (orientation == CardSwipeOrientation.left){
                      Dislikejob(index);

                    }

                    // if ((index +1) == jobDetails.length) {
                    //   setState(() {
                    //     isActive = true;
                    //   });
                    // }

                  },
                ),
              ),
            ],
          ),
        ),
      ):SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',scale:2.5,
                  ),
                  SizedBox(height: 20,),
                  Image.asset('assets/images/noData.png'),
                  Text("Sad No More Jobs", style: TextStyle( fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Questrial',fontSize: 24, color: Colors.pinkAccent[200])),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: isActive == true
          ? FloatingActionButton(
        backgroundColor: Colors.pinkAccent[200],
        onPressed: () {
          setState(() {

            jobDetails  = getalljobDetails() as List<JobDetails>;
            isActive = false;
          });
        },
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      )
          : SizedBox(),
    );
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
                      uName,
                      password, 'token1',
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


  void likeJob(int index){

    if(index == jobDetails.length-1){
      setState(() {
        isActive = true;
      });
    }

  }

  Future Dislikejob(int index) async {

    var res = await http.post(
        Uri.parse(dislikeJob)  , body: {
      "seeker_id": user_Id,
      "job_id": jobDetails[index].id,
    });
    if(res.statusCode == 200 ) {
      print("==================Response values==================");
      print(res.body);
      if(index == jobDetails.length-1){
        setState(() {
          isActive = true;
        });
      }
    }
  }

  bool shouldSkipIndex(int index) {
    return index == 2 || index == 5;
  }




  Future<List<New_Job_Details>?> getalljobDetails()async{
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

      print("total jobs are ${jobDetailsList!.length}");

      return jobDetailsList;

    }
    else {
      print(response.reasonPhrase);
      return [];
    }

  }


}
