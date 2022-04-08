import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/size_config.dart';

class JobApplied extends StatefulWidget {
  final uName;
  final password;
  final JobDetails jobDetails;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final FavoriteJobs favoriteJobs;
  final SeekerDetails userDetails;
  JobApplied({this.uName,this.password, this.jobDetails,this.user_Id,this.firstName,this.total_applied,this.total_saved,this.favoriteJobs, this.userDetails});
  @override
  _JobAppliedState createState() => _JobAppliedState(uName:uName,password: password, jobDetails: jobDetails,user_Id: user_Id,firstName: firstName,total_applied: total_applied,favoriteJobs: favoriteJobs ,userDetails: userDetails);
}

class _JobAppliedState extends State<JobApplied> {
  final uName;
  final password;
  final JobDetails jobDetails;
  final user_Id;
  final firstName;
  final String total_applied;
  final String total_saved;
  final FavoriteJobs favoriteJobs;
  final SeekerDetails userDetails;
  _JobAppliedState({this.uName,this.password, this.jobDetails,this.user_Id,this.firstName,this.total_applied,this.total_saved,this.favoriteJobs , this.userDetails});
  bool resync=false;
@override
void initState(){
  super.initState();
  setState(() {

  });
 print(uName);
 print(password);
  print('firstName : $firstName');
  print('total_applied : $total_applied');
  print('total_saved : $total_saved');
  print('firstname : $jobDetails');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
            ),
            // Image.network('https://www.animatedimages.org/data/media/1574/animated-success-image-0004.gif',scale: 1.0,),
            Image.asset(
              'assets/images/check.gif',scale:0.8,
            ),
            SizedBox(
              height: 37,
            ),
            SizedBox(
              width: 200,
              child: DefaultTextStyle(
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 34, 34, 34),

                  /* letterSpacing: 0.0, */
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  animatedTexts: [
                    RotateAnimatedText('Successful' ,
                    duration: Duration(seconds: 5) ,
                     textStyle: TextStyle(
                       height: 1.171875,
                       fontSize: 24.0,
                       fontFamily: 'Poppins',
                       fontWeight: FontWeight.w600,
                       color: Color.fromARGB(255, 34, 34, 34),),
                    )],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '''You have successfully applied for this job. \n You can track your job records in the dashboard.  ''',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 16.0,
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 112, 126, 148),

                /* letterSpacing: 0.0, */
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 12 , right: 12),
              child: Container(
                // width:SizeConfig.screenWidth,
                width: SizeConfig.screenWidth,
                height:60.0,                  decoration: BoxDecoration(
                // color:  Colors.red[100],
                color: Color.fromARGB(255, 255, 65, 129),
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: Theme.of(context).accentColor)),
              ),
                child: GestureDetector(
                  onTap: () {
                    Requests.Login(context, uName, password, '',
                        false);
                  },
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,),

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class SavedJobApplied extends StatefulWidget {
  final uName;
  final password;
  final JobDetails jobDetails;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final FavoriteJobs favoriteJobs;
  final SeekerDetails userDetails;
  SavedJobApplied({this.uName,this.password, this.jobDetails,this.user_Id,this.firstName,this.total_applied,this.total_saved,this.favoriteJobs, this.userDetails});
  @override
  _SavedJobAppliedState createState() => _SavedJobAppliedState(uName:uName,password: password, jobDetails: jobDetails,user_Id: user_Id,firstName: firstName,total_applied: total_applied,favoriteJobs: favoriteJobs ,userDetails: userDetails);
}

class _SavedJobAppliedState extends State<SavedJobApplied> {
  final uName;
  final password;
  final JobDetails jobDetails;
  final user_Id;
  final firstName;
  final String total_applied;
  final String total_saved;
  final FavoriteJobs favoriteJobs;
  final SeekerDetails userDetails;
  _SavedJobAppliedState({this.uName,this.password, this.jobDetails,this.user_Id,this.firstName,this.total_applied,this.total_saved,this.favoriteJobs , this.userDetails});
  bool resync=false;
  @override
  void initState(){
    super.initState();
    setState(() {

    });
    print(uName);
    print(password);
    print('firstName : $firstName');
    print('total_applied : $total_applied');
    print('total_saved : $total_saved');
    print('firstname : $jobDetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            // Image.network('https://www.animatedimages.org/data/media/1574/animated-success-image-0004.gif',scale: 1.0,),
            Image.asset(
              'assets/images/check.gif',scale:0.8,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 200,
              child: DefaultTextStyle(
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 34, 34, 34),

                  /* letterSpacing: 0.0, */
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText('Successful' ,
                      duration: Duration(seconds: 5) ,
                      textStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 34, 34, 34),),
                    )],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "You have successfully applied for this job. \n You can track your job records in the dashboard.",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 16.0,
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 112, 126, 148),

                /* letterSpacing: 0.0, */
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20 , right: 20),
              child: Container(
                // width:SizeConfig.screenWidth,
                width: SizeConfig.screenWidth,
                height:60.0,                  decoration: BoxDecoration(
                // color:  Colors.red[100],
                color: Color.fromARGB(255, 255, 65, 129),
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: Theme.of(context).accentColor)),
              ),
                child: GestureDetector(
                  onTap: () {
                   Requests.Login(context, uName, password, '',
                       false);
                  },
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,),

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






class SavedJobApplied1 extends StatefulWidget {
  final uName;
  final password;
  final JobDetails jobDetails;
  final user_Id;
  final firstName;
  final total_applied;
  final total_saved;
  final SavedJobs favoriteJobs;
  final SeekerDetails userDetails;
  SavedJobApplied1({this.uName,this.password, this.jobDetails,this.user_Id,this.firstName,this.total_applied,this.total_saved,this.favoriteJobs, this.userDetails});
  @override
  _SavedJobApplied1State createState() => _SavedJobApplied1State(uName:uName,password: password, jobDetails: jobDetails,user_Id: user_Id,firstName: firstName,total_applied: total_applied,favoriteJobs: favoriteJobs ,userDetails: userDetails);
}

class _SavedJobApplied1State extends State<SavedJobApplied1> {
  final uName;
  final password;
  final JobDetails jobDetails;
  final user_Id;
  final firstName;
  final String total_applied;
  final String total_saved;
  final SavedJobs favoriteJobs;
  final SeekerDetails userDetails;
  _SavedJobApplied1State({this.uName,this.password, this.jobDetails,this.user_Id,this.firstName,this.total_applied,this.total_saved,this.favoriteJobs , this.userDetails});
  bool resync=false;
  @override
  void initState(){
    super.initState();
    setState(() {

    });
    print(uName);
    print(password);
    print('firstName : $firstName');
    print('total_applied : $total_applied');
    print('total_saved : $total_saved');
    print('firstname : $jobDetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            // Image.network('https://www.animatedimages.org/data/media/1574/animated-success-image-0004.gif',scale: 1.0,),
            Image.asset(
              'assets/images/check.gif',scale:0.8,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 200,
              child: DefaultTextStyle(
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 34, 34, 34),

                  /* letterSpacing: 0.0, */
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText('Successful' ,
                      duration: Duration(seconds: 5) ,
                      textStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 34, 34, 34),),
                    )],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
             " You have successfully applied for this job. \n You can track your job records in the dashboard.",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 16.0,
                fontFamily: 'Questrial',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 112, 126, 148),

                /* letterSpacing: 0.0, */
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20 , right: 20),
              child: Container(
                // width:SizeConfig.screenWidth,
                width: SizeConfig.screenWidth,
                height:60.0,                  decoration: BoxDecoration(
                // color:  Colors.red[100],
                color: Color.fromARGB(255, 255, 65, 129),
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: Theme.of(context).accentColor)),
              ),
                child: GestureDetector(
                  onTap: () {
                    Requests.Login(context, uName, password, '',
                        false);
                  },
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,),

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}