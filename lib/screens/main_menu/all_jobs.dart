import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:http/http.dart' as http;
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/dawood/presentation/job_details/view/job_detail.dart';
import 'package:flutter_tindercard/main.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:lottie/lottie.dart';

import '../../http/Requests.dart';
import '../../model/check_saved_job.dart';
import '../../dawood/presentation/home/view/home.dart';


class AllJobs extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;
  const AllJobs({Key? key,required this.currentUserDetails }) : super(key: key);

  @override
  _AllJobsState createState() => _AllJobsState(currentUserDetails: currentUserDetails);
}
class _AllJobsState extends State<AllJobs>  with TickerProviderStateMixin{
  bool? isLiked;
  final CurrentUserDetails currentUserDetails;
  late JobDetails? jobDetails2;

  @override
  _AllJobsState({required this.currentUserDetails});



  int currentIndex = 0;
  // ignore: override_on_non_overriding_member
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String dislikeJob = base_url + 'dislike_jobs.php';


  List<JobDetails> likeJobList = [];


  bool isJobsAdded = false;

  void initState() {
    if(currentUserDetails.jobDetails==null){
      Requests.getJobDetails(int.tryParse(currentUserDetails.user_Id.toString()));
      currentUserDetails.jobDetails = List.from(all_jobs_details!);
    }

    setState(() {
      // Requests.getJobDetails(int.tryParse(user_Id.toString()));
      // jobDetails = List.from(all_jobs_details!);
    });



    print('userid${currentUserDetails.user_Id}');
    print('ALLJob Nameis: ${currentUserDetails.firstName}');
    print('ALLJob uName : ${currentUserDetails.uName}');
    print(' ALLJobpass : ${currentUserDetails.password}');

    print("total job length ${currentUserDetails.jobDetails!.length}");



    super.initState();
  }

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    CardController? controller; //Use this to trigger swap.

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'All Jobs',),),
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
                    child: Text('Tips',style: Theme.of(context).textTheme.displayMedium
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
                  totalNum: currentUserDetails.jobDetails!.length,
                  stackNum: 3,
                  swipeEdge: 3.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.94,
                  maxHeight: MediaQuery.of(context).size.width * 0.94,
                  minWidth: MediaQuery.of(context).size.width * 0.93,
                  minHeight: MediaQuery.of(context).size.width * 0.93,

                  cardBuilder: (context, currentIndex) =>
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetail(
                                  currentUserDetails: currentUserDetails,
                                  appliedStatus:jobAppliedDetailModel.applied,
                                  index: currentIndex,
                                  ),
                              ),);
                          },
                          child: AllJobCard(jobDetails: currentUserDetails.jobDetails![currentIndex], userId:currentUserDetails.user_Id)),

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
                    setState(() {
                      isJobsAdded = false;
                    });

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
                    ImageManager.logoImage,scale:2.5,
                  ),
                  SizedBox(height: 20,),
                  LottieBuilder.asset(LottieManager.noMoreJobAnimation),
                  Text(AppString.sadNoMoreJobs, style: Theme.of(context).textTheme.displayMedium),
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
            isActive = false;
            currentUserDetails.jobDetails = List.from(all_jobs_details!);

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

  Future savejob() async {

    var res = await http.post(
        Uri.parse(uploadsavejob)  , body: {
      "user_id": currentUserDetails.user_Id,
      "job_id": jobDetails2!.id,
    });
    if(res.statusCode == 200 ) {
      print("==================Response values==================");
      print(res.body);

      setState(() {

        isLiked = true;
      });
    }

  }

  void likeJob(int index){

    print("hello current index $index and the total length ${currentUserDetails.jobDetails!.length} ");

    if(index == currentUserDetails.jobDetails!.length-1){
      setState(() {
        Requests.getJobDetails(int.tryParse(currentUserDetails.user_Id.toString()));
        isActive = true;
      });
    }

  }

  Future Dislikejob(int index) async {
    print("hello current index =======================>>>>>>> $index");
    var res = await http.post(
        Uri.parse(dislikeJob)  , body: {
      "seeker_id": currentUserDetails.user_Id,
      "job_id": currentUserDetails.jobDetails![index].id,
    });
    if(res.statusCode == 200 ) {
      print("==================Response values==================");

      print("Index value ${index} leangth ${currentUserDetails.jobDetails!.length}");

      if(index == currentUserDetails.jobDetails!.length-1){
        setState(() {
          Requests.getJobDetails(int.tryParse(currentUserDetails.user_Id.toString()));
          isActive = true;
        });
      }
    }
  }


}
