import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/dashboasd%20applied%20Screen.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/widgets/job_card1.dart';



class Profile extends StatefulWidget {
  final user_Id;
  final firstName;
  final title;
  final String total_applied;
  final String total_saved;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final List<AppliedJobDetails> appliedJobDetails;
  final List<JobDetails> jobDetails;
  final uName;
  final password;
  const Profile(
      {Key key,
      this.user_Id,
      this.userDetails,
      this.title,
      this.firstName,
      this.total_saved,
      this.total_applied,
      this.favoriteJobs,
      this.appliedJobDetails ,this.jobDetails,this.uName,this.password })
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(
      user_Id: user_Id,
      firstName: firstName,
      total_applied: total_applied,
      total_saved: total_saved,
      favoriteJobs: favoriteJobs,
      userDetails: userDetails,
      appliedJobDetails: appliedJobDetails,jobDetails: jobDetails ,uName: uName,password: password);
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  // TabController _tabController;
  final user_Id;
  final firstName;
  final title;
  final String total_applied;
  final String total_saved;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  List<AppliedJobDetails> appliedJobDetails;
  final List<JobDetails> jobDetails;
  final uName;
  final password;
  _ProfileState(
      {this.user_Id,
      this.firstName,
      this.title,
      this.total_applied,
      this.total_saved,
      this.favoriteJobs,
      this.userDetails,
      this.appliedJobDetails ,this.jobDetails,this.uName,this.password,});

  void initState() {
    super.initState();
    print('$user_Id');
    print('$firstName');
    //appiedDashboadJobs();
  }

  @override
  Widget build(BuildContext context) {
  //  double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child:Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,top: 32),
                      child: Text("Welcome," , style: TextStyle(
                        color: Colors.black,
                        height: 1.5,
                        fontSize: 20.0,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0,top: 45),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: ((context)=>NotificationScreen(user_Id: user_Id,))));
                              },
                              child: Image.asset('assets/images/notification.png',scale: 1.0,color: Colors.black,))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,top: 60),
                      child:  Text(
                                '$firstName',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 24),
                              )),
                  ],
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 , right: 12.0 ,top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AllSavedJobs(user_Id: user_Id , uName: uName,password: password,firstName: firstName,)));
                  },
                  child: Container(
                    height: 150,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Saved \n Jobs',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Colors.pinkAccent[200]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Text(
                            '$total_saved',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: Colors.pinkAccent[200]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12.0 , right: 12.0 ,top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DashbordAppliedJobs(user_Id: user_Id)));
                  },
                  child: Container(
                    height: 150,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Applied \n Jobs',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Colors.blue[800]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Text(
                            '$total_applied',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                color: Colors.blue[900]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0 ,),
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
                              builder: (context) =>
                                  AllSavedJobs(user_Id: user_Id)));
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
              SizedBox(height:12.5,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: favoriteJobs == null
                      ? Container(
                          child: Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'No Saved Jobs!',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400),
                              ),
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
                                  padding: EdgeInsets.only(right: 12),
                                  child: JobCard2(
                                    favoriteJobs: item.value, user_Id: user_Id,uName: uName,password: password,firstName: firstName,jobDetails: jobDetails,userDetails: userDetails),
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
