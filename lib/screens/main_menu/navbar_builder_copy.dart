
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/main_menu/more/home_search_copy.dart';
import 'package:girlzwhosell/screens/main_menu/profile.dart';
import 'package:girlzwhosell/screens/main_menu/shortlisted.dart';
import 'package:girlzwhosell/screens/profile/profile_main.dart';
import 'package:girlzwhosell/utils/Storage.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final cookiee;
  final firstName;
  final title;
  final phoneno;
  final profile;
  final email;
  final location;
  final cv;
  final resumee;
  final String total_applied;
  final String  total_saved;
  final jobId;


  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final String token1;
  PushNotificationMessage notificationInfo;


   HomePage({Key key,this.uName,this.password, this.user_Id, this.cookiee, this.jobDetails,this.jobId, this.favoriteJobs, this.userDetails , this.firstName,this.title,this.profile,this.phoneno,this.email,this.location,this.resumee,this.cv,this.total_applied,this.total_saved ,this.token1 ,this.notificationInfo}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(uName:uName, password:password,user_Id: user_Id ,cookiee: cookiee ,jobDetails: jobDetails,favoriteJobs: favoriteJobs,userDetails: userDetails ,firstName: firstName,title: title,phoneno: phoneno, profile: profile,email: email,location: location,cv: cv,resumee: resumee,total_applied: total_applied,total_saved: total_saved ,token1: token1 , notificationInfo: notificationInfo);
}

class _HomePageState extends State<HomePage> {
  final uName;
  final password;
  final user_Id;
  final cookiee;
 final firstName;
   String title;
  String phoneno;
  String profile;
  String email;
  String location;
  String cv;
  String resumee;
  final String total_applied;
  final String total_saved;
  final jobId;

  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  String token1;
  PushNotificationMessage notificationInfo;

  _HomePageState({this.uName,this.password,this.user_Id, this.cookiee, this.jobId,this.jobDetails, this.favoriteJobs, this.userDetails , this.firstName,this.title,this.phoneno,this.profile,this.email,this.location,this.cv,this.resumee,this.total_applied,this.total_saved ,this.token1 ,this.notificationInfo});

  PageController pageController;
  int pageIndex = 0;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onItemSelected(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }
  Storage storage = new Storage();

  // Future<String> loadViewData() async {
  //  // userDetails=storage.updatetokenInfo(loginmodel);
  //  //  firstName = await storage.getFirstName();
  //  //  print("firstname is: $firstName");
  //  //  if (firstName == null) {
  //  //    firstName = "";
  //  //  }
  //  //  jobId = await storage.get_jobid();
  //  //  print('jobid is : $jobId');
  //  //  if(jobId == null ){
  //  //    jobId =="";
  //  //  }
  //  //  title = await storage.get_jobtitle();
  //  //  print("jobtitle is: $title");
  //  //  if (title == null) {
  //  //    title = "";
  //  //  }
  //  //  phoneno = await storage.getPhoneNo();
  //  //  print("phone is: $phoneno");
  //  //  if (phoneno == null) {
  //  //    phoneno = "";
  //  //  }
  //  //  email = await storage.getUser_email();
  //  //  print("email is: $email");
  //  //  if (email == null) {
  //  //    email = "";
  //  //  }
  //  //  profile = await storage.getProfile_pic();
  //  //  print("profile is: $profile");
  //  //  if (profile == null) {
  //  //    profile = "";
  //  //  }
  //  //  location = await storage.getlocation();
  //  //  print("location is: $location");
  //  //  if (location == null) {
  //  //    location = "";
  //  //  }
  //  //  cv =await storage.get_cv();
  //  //  print("cv is: $cv");
  //  //  if (cv == null) {
  //  //    cv = "";
  //  //  }
  //  //  resumee = await storage.get_resume();
  //  //  print("resumee is: $resumee");
  //  //  if (resumee == null) {
  //  //    resumee = "";
  //  //  }
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('title', title);
  //   prefs.setString('phone', phoneno);
  //
  //
  //
  //   ////Retreivinng user Email and password
  //
  //   final uName= prefs.getString('title',);
  //   final pass=prefs.getString('phone',);
  //   print("==================User Email And Password ==================");
  //   print(uName);
  //   print(pass);
  //
  //   return "OK";
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    print('uName is $uName');
    print('title $firstName');
    print('title $title');
    print('pass is $password');
    print('token is $token1');
    print('ProfilePic is $profile');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future getToken() async{
    await _firebaseMessaging.getToken().then((token) {
      print(" Token is :$token");
      setState(() {
        token1 = token;
      });
    } );
  }

     bool isSelected= false;
     GlobalKey<NavigatorState> _yourKey = GlobalKey<NavigatorState>();

  Future<bool> _backPressed(GlobalKey<NavigatorState> _yourKey) async {
    //Checks if current Navigator still has screens on the stack.
    if (_yourKey.currentState.canPop()) {
      // 'maybePop' method handles the decision of 'pop' to another WillPopScope if they exist.
      //If no other WillPopScope exists, it returns true
      _yourKey.currentState.maybePop();
      return Future<bool>.value(false);
    }
//if nothing remains in the stack, it simply pops
    return Future<bool>.value(true);
  }
Future<bool> _exitApp(BuildContext context) {
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text('Do you want to exit this application?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              print("you choose no");
              Navigator.of(context).pop(false);
            },
            child: Text('No',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue[800],

            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
            },
            child: Text('Yes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue[800],
            ),
          )],
      ), context: context,
    ) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _backPressed(_yourKey),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          children: <Widget>[
            HomeSearch(uName:uName,password:password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails, favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId,),
            Profile( user_Id: user_Id,firstName: firstName ,total_applied:total_applied,total_saved:total_saved,favoriteJobs: favoriteJobs,uName:uName ,password:password),
            ProfileMain(uName: uName,password:password, user_Id: user_Id, firstName: firstName,title:title,profile: profile, userDetails: userDetails),
            Shortlisted(),
            //HotJobs(),
           // MoreSettings(),
          ],
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),
          child: BottomNavigationBar(
            elevation: 3.0,
           backgroundColor: Colors.white,
           // type: BottomNavigationBarType.fixed,
            //  fixedColor: Colors.pinkAccent[200],
            selectedFontSize: 16,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              color: Colors.pinkAccent[200],
            ),
            unselectedLabelStyle:TextStyle(
              color: Colors.blueGrey[300],
            ),
            selectedItemColor: Colors.pinkAccent[200],
            unselectedItemColor: Colors.blueGrey[300],
            onTap: onItemSelected, // new
            currentIndex: pageIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage(
                  'assets/images/Asset 1.png' ,
                )),
               label: 'Home',
              ),
              new BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(
                    'assets/images/Asset 3.png'
                )),
                label:'Dashboard' ,
              ),
              new BottomNavigationBarItem(
      icon: ImageIcon(
            AssetImage(
                'assets/images/Asset 2.png'
      )
      ), label: 'Profile'
              ),
              new BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                      'assets/images/Asset 4.png'
                  )), label:'About Us',
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future getQue() async {
    if(token1!=null){
      var response = await http.post('https://biitsolutions.co.uk/girlzwhosell/API/fcm_register.php',
          body: {
            "token": token1,
            "user_id": user_Id
          });
      print(token1);
      print(user_Id);
      return json.decode(response.body);

    }
    else {
      print("Token is Null");
    }
  }
}
