import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';


class AllJobs extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  const AllJobs({Key key,this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId}) : super(key: key);
  @override
  _AllJobsState createState() => _AllJobsState(uName: uName,password: password,user_Id: user_Id, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,firstName: firstName);
}
class _AllJobsState extends State<AllJobs>  with TickerProviderStateMixin{
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  bool isLiked;
  _AllJobsState({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails,this.jobId});
  @override

  // ignore: override_on_non_overriding_member
  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String dislikeJob = base_url + 'dislike_jobs.php';

  void initState() {
    print('userid${user_Id}');
    print('ALLJob Nameis: $firstName');
    print('ALLJob uName : $uName');
    print(' ALLJobpass : $password');
    super.initState();
  }
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27.5,right: 27.5),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 2.5,
              ),
            ),
            Container(
             // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.6,
              child: new TinderSwapCard(
                swipeUp: true,
                swipeDown: false,
                orientation: AmassOrientation.BOTTOM,
                 totalNum: jobDetails.length,
                // totalNum: welcomeImages.length,
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
                          builder: (context) => JobDetail(uName:uName,password: password,jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id,  firstName: firstName,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
                        ),);
                    },
                    child: AllJobCard(jobDetails: jobDetails[index], userId:user_Id)) :
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetail(uName:uName,password: password, jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id, firstName: firstName,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
                        ),);
                    },
                    child : AllJobCard2(jobDetails: jobDetails[index], userId:user_Id)),
                cardController: controller,
                //= CardController(),
                // swipeUpdateCallback:
                //     (DragUpdateDetails details, Alignment align) {
                //   /// Get swiping card's alignment
                //   if (align.x < 0) {
                //     // Fluttertoast.showToast(
                //     //   msg: 'LEFT swiping',
                //     //   toastLength: Toast.LENGTH_SHORT,
                //     //   gravity: ToastGravity.TOP_RIGHT,
                //     // );
                //   //  Card is LEFT swiping
                //   } else if (align.x > 0) {
                //     //Card is RIGHT swiping
                //     // Fluttertoast.showToast(
                //     //   msg: 'Right swiping',
                //     //   toastLength: Toast.LENGTH_SHORT,
                //     //   gravity: ToastGravity.TOP_RIGHT,
                //     // );
                //  //   savejob();
                //   }
                //   // else if (align.y <= ){
                //   //   Fluttertoast.showToast(
                //   //     msg: 'Up swiping',
                //   //     toastLength: Toast.LENGTH_SHORT,
                //   //     gravity: ToastGravity.TOP_RIGHT,
                //   //   );
                //   // }
                // },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                //// Get orientation & index of swiped card!
                     print(orientation.toString());
                      if (orientation == CardSwipeOrientation.UP) {
                        print("Card is swiping Up");
                        savejob();
                      //  print(jobDetails.length);
                      } else if (orientation == CardSwipeOrientation.RIGHT) {
                         print("Card is RIGHT swiping");
                        // showToast('Next Job',
                        //   context: context,
                        //   fullWidth: true,
                        //   backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
                        //   animation: StyledToastAnimation.slideFromLeft,
                        //   reverseAnimation: StyledToastAnimation.fade,
                        //   position: StyledToastPosition.center,
                        //   animDuration: Duration(seconds: 2),
                        //   duration: Duration(seconds: 4),
                        //   curve: Curves.elasticOut,
                        //   reverseCurve: Curves.linear,
                        // );

                        //  print(jobDetails.length);
                      }
                      else if (orientation == CardSwipeOrientation.LEFT){
                        Dislikejob();
                      }
                      if ((index + 1) == jobDetails.length) {
                        setState(() {
                          isActive = true;
                        });
                      }

                },
              ),
            ),
          ],
        ),
      ):SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
  Future savejob() async {

    var res = await http.post(
        uploadsavejob , body: {
      "user_id": user_Id,
      "job_id": jobDetails[0].id,
    });
    if(res.statusCode == 200 ) {
      print("==================Response values==================");
      print(res.body);

//Set an animation
      showToast('This is normal toast with animation',
        context: context,
        animation: StyledToastAnimation.scale,
      );
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
  Future Dislikejob() async {
    var res = await http.post(
        dislikeJob , body: {
      "seeker_id": user_Id,
      "job_id": jobDetails[0].id,
    });
    if(res.statusCode == 200 ) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // print("==================SharedPrefrence values==================");
      //
      // final prefs = await SharedPreferences.getInstance();
      //
      // prefs.setString('user_Id', user_Id);
      // prefs.setString('job_Id', jobDetails[0].id);
      // prefs.setBool('stateOfButton', true);
      //
      // uid = await prefs.getString('user_Id');
      // Jid = await prefs.getString('job_Id');
      // //IsButton = prefs.getBool('stateOfButton');
      // print('userid is :$uid');
      // print('jobid is : $Jid');
      // print('IsButton : $IsButton');

      print("==================Response values==================");
      print(res.body);

//Set an animation
      showToast('This is normal toast with animation',
        context: context,
        animation: StyledToastAnimation.scale,
      );
      showToast('Job Deleted',
        context: context,
        fullWidth: true,
        backgroundColor: Colors.pinkAccent[200].withOpacity(0.6),
        animation: StyledToastAnimation.slideFromLeft,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
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
  }