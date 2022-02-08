import 'package:animations/animations.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/SavedItem_detail.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';






class JobCard1 extends StatefulWidget {

  final FavoriteJobs favoriteJobs;
  final user_Id;
  final uName;
  final password;
  final String firstName;
  // final cookiee;
  final List<JobDetails> jobDetails;
  final List<SeekerDetails> userDetails;
  final jobId;

  const JobCard1({Key key, this.favoriteJobs, this.user_Id,this.uName,this.password,this.firstName,this.jobDetails, this.userDetails,this.jobId}) : super(key: key);

  @override
  State<JobCard1> createState() => _JobCard1State(favoriteJobs: favoriteJobs,user_Id: user_Id,uName: uName, password: password,firstName: firstName,jobDetails: jobDetails,userDetails: userDetails,jobId: jobId);
}

class _JobCard1State extends State<JobCard1> {

  final FavoriteJobs favoriteJobs;
  final user_Id;
  final uName;
  final password;
  final String firstName;
  // final cookiee;
  final List<JobDetails> jobDetails;
  final List<SeekerDetails> userDetails;

  final jobId;
void initState(){
  print('jobCardEMail :$uName ');
  print('jobCardpass : $password');
}
  _JobCard1State({ this.favoriteJobs, this.user_Id,this.uName,this.password,this.firstName,this.jobDetails, this.userDetails,this.jobId});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,

        openElevation: 0,
        openBuilder: (context, action) {
        //  return DetailsForFavJob(favoriteJobs: favoriteJobs, userId: user_Id);
          return SavedScreenDetail(favoriteJobs: favoriteJobs, user_Id: user_Id,jobDetails: jobDetails, password:password,
              uName: uName,userDetails: userDetails,firstName:firstName, jobId: jobId);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
              height: 150.w,
              width: 250.w,
            //  padding: EdgeInsets.all(kSpacingUnit * 2),
              decoration: BoxDecoration(
              color: Color.fromRGBO(233, 246, 255,1.0),
                //color: Colors.blue[50],
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
            child: ListTile(
                leading:   Padding(
                  padding: const EdgeInsets.only(left: 8.0 , top: 7),
                  child: Container(
                    width: 40,
                    height: 40,
                //    color: Colors.yellow,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.network(favoriteJobs.companyLogo ?? Image.asset('assets/images/splashlogo.png'),
                         height: 40,
                         width: 40,),
                    ),
                  ),
                ),
           title: Padding(
             padding: const EdgeInsets.only(top: 16.0),
             child: Text('${favoriteJobs.companyName ?? ""}' ,  style: TextStyle(
                             color: Color.fromRGBO(113, 126, 149, 1),
                             fontStyle: FontStyle.normal,
                             fontFamily: "Questrial",
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                           ),),
           ),
              subtitle: Column(
                children: [
                  SizedBox(height:5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('${favoriteJobs.title}' ,  style: TextStyle(
                      color: Color.fromRGBO(34, 34, 34, 1),
                      fontStyle: FontStyle.normal,
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  SizedBox(height:10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('${favoriteJobs.jobType}' ,  style: TextStyle(
                      color: Color.fromRGBO(1, 82, 174, 1),
                      fontStyle: FontStyle.normal,
                      fontFamily: "Questrial",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}





class JobCard2 extends StatefulWidget {

  final FavoriteJobs favoriteJobs;
  final user_Id;
  final uName;
  final password;
  final String firstName;
  // final cookiee;
  final List<JobDetails> jobDetails;
  final List<SeekerDetails> userDetails;
  final jobId;

  const JobCard2({Key key, this.favoriteJobs, this.user_Id,this.uName,this.password,this.firstName,this.jobDetails, this.userDetails,this.jobId}) : super(key: key);

  @override
  State<JobCard2> createState() => _JobCard2State(favoriteJobs: favoriteJobs,user_Id: user_Id,uName: uName, password: password,firstName: firstName,jobDetails: jobDetails,userDetails: userDetails,jobId: jobId);
}

class _JobCard2State extends State<JobCard2> {

  final FavoriteJobs favoriteJobs;
  final user_Id;
  final uName;
  final password;
  final String firstName;
  // final cookiee;
  final List<JobDetails> jobDetails;
  final List<SeekerDetails> userDetails;

  final jobId;

  bool isLiked;
  bool IsButton;

  static final String uploadsavejob = base_url + 'saved_jobs.php';
  static final String removefavjob = base_url + 'unsave_job.php';


  void initState(){
    print('jobCard2EMail :$uName ');
    print('jobCard2pass : $password');
  }
  _JobCard2State({ this.favoriteJobs, this.user_Id,this.uName,this.password,this.firstName,this.jobDetails, this.userDetails,this.jobId});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,

        openElevation: 0,
        openBuilder: (context, action) {
          //  return DetailsForFavJob(favoriteJobs: favoriteJobs, userId: user_Id);
          return SavedScreenDetail(favoriteJobs: favoriteJobs, user_Id: user_Id,jobDetails: jobDetails,uName: uName,password:password,userDetails: userDetails,firstName:firstName, jobId: jobId,);

        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Card(
            shape: Border.all(color: Color.fromRGBO(238, 242, 248, 1)),
            child: Container(
              height: 190.w,
              width:327.w,
              decoration: BoxDecoration(
             //   color: Color.fromRGBO(233, 246, 255,1.0),
                //color: Colors.blue[50],
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
              child: Column(
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0 ,top:16.0 ),
                      child: Container(

                        width: 40,
                        height: 40,
                        //  color: Colors.yellow,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.network(favoriteJobs.companyLogo ?? Image.asset('assets/images/splashlogo.png'),
                            height: 40,
                            width: 40,),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(isLiked == true){
                         // IsButton = true;//    savejob();
                        }else{
                          Unsavejob();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0 ,top:16.0,right:18.5),
                        // child: FavoriteButton(
                        //   isFavorite: false,
                        //   valueChanged: (isLiked) {
                        //     print('Is Favorite : $isLiked');
                        //     if(isLiked) {
                        //       savejob();
                        //     }else{
                        //       Unsavejob();
                        //     }
                        //   },
                        // ),
                        child: Icon(Icons.favorite , color: Colors.red, size: 40,),
                      ),
                    )
              ]
                ),
SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${favoriteJobs.title ?? ""}',
                        //style: kCaptionTextStyle,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(favoriteJobs.companyName ?? " ",
                                   //data.companyName,
                                   style: TextStyle(
                                     color: Color.fromRGBO(113, 126, 149, 1),
                                     fontStyle: FontStyle.normal,
                                     fontFamily: "Questrial",
                                     fontSize: 14,
                                     fontWeight:
                                     FontWeight.w400,
                                   ),
                                   //   style: kCardTitleTextStyle,
                                 ),
                        ),
              ),

                      SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                             "Salary \$ ${favoriteJobs.minSalary ?? " " + favoriteJobs.maxSalary ?? "" }",
                             style: TextStyle(
                               color: Color.fromRGBO(113, 126, 149, 1),
                               fontStyle: FontStyle.normal,
                               fontFamily: "Questrial",
                               fontSize: 14,
                               fontWeight:
                               FontWeight.w400,
                             ),
                           ),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


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
      print("==================SharedPrefrence values==================");

      final prefs = await SharedPreferences.getInstance();

      prefs.setString('user_Id', user_Id);
      prefs.setString('job_Id', favoriteJobs.jobId);
      prefs.setBool('stateOfButton', true);

      uid = await prefs.getString('user_Id');
      Jid = await prefs.getString('job_Id');
      IsButton = prefs.getBool('stateOfButton');

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

  Future Unsavejob() async {
    String uid;
    String Jid;
    var res = await http.post(
        removefavjob, body: {
      "seeker_id": user_Id,
      "job_id": favoriteJobs.jobId,
    });
    if(res.statusCode == 200 ) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      print("==================SharedPrefrence values==================");

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user_Id', user_Id);
      prefs.setString('job_Id', favoriteJobs.jobId);
      uid = await prefs.getString('user_Id');
      Jid = await prefs.getString('job_Id');
      print('userid is :$uid');
      print('jobid is : $Jid');

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
      Requests.Login(context, uName, password,'',false);

      setState(() {
        //isapplied = false;
        isLiked = false;
      });
    }

  }
}