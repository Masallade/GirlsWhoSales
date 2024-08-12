import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/main_menu/more/home_search_copy.dart';
import 'package:girlzwhosell/screens/main_menu/profile.dart';
import 'package:girlzwhosell/screens/main_menu/shortlisted.dart';
import 'package:girlzwhosell/screens/profile/profile_main.dart';
import 'package:http/http.dart' as http;

import '../../http/Requests.dart';
import '../../model/SavedJobsModel.dart';
import '../../model/total_notification.dart';
import '../../user_preferences/user_pref_manager.dart';
import '../../utils/constants.dart';
import 'more/home_search_copy.dart';

// ignore: must_be_immutable
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
  final cv;
  final resumee;
  final String? total_applied;
  final String? total_saved;
  final jobId;
  final city;
  String? nationality;

  final List<JobDetails>? jobDetails;
  final List<FavoriteJobs>? favoriteJobs;
  final List<SeekerDetails>? userDetails;
  final String? token1;
  PushNotificationMessage? notificationInfo;

  HomePage(
      {Key? key,
      this.uName,
      this.password,
        this.nationality,
      this.user_Id,
      this.cookiee,
      this.jobDetails,
      this.jobId,
      this.favoriteJobs,
      this.userDetails,
      this.firstName,
      this.title,
      this.profile, this.city,
      this.phoneno,
      this.email,
      this.resumee,
      this.cv,
      this.total_applied,
      this.total_saved,
      this.token1})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(
        uName: uName,
        password: password,
        user_Id: user_Id,
        cookiee: cookiee,
        jobDetails: jobDetails,
        favoriteJobs: favoriteJobs,
        userDetails: userDetails,
        firstName: firstName,
        title: title,
        phoneno: phoneno,
        nationality :nationality,
        profile: profile,
        email: email,
        cv: cv,
        city : city,
        resumee: resumee,
        total_applied: total_applied,
        total_saved: total_saved,
        token1: token1,
      );
}

class _HomePageState extends State<HomePage> {
  final uName;
  final password;
  final user_Id;
  final cookiee;
  final firstName;
  String? nationality;
  String? title;
  String? phoneno;
  String? profile;
  String? email;
  String? location;
  String? Location;
  String? cv;
  String? resumee;
  final String? total_applied;
  final String? total_saved;
  final jobId;
  final city;

  List<JobDetails>? jobDetails;
  final List<FavoriteJobs>? favoriteJobs;
  final List<SeekerDetails>? userDetails;
  String? token1;
  PushNotificationMessage? notificationInfo;

   List<SavedJobs>? savedJobs;

  _HomePageState(
      {this.uName,
      this.password,
      this.user_Id,
      this.cookiee,
      this.jobId,
      this.jobDetails,
        this.nationality,
      this.favoriteJobs,
      this.userDetails,
      this.firstName,
      this.title,
      this.phoneno,
      this.profile,
      this.email,
      this.cv,
      this.resumee,
      this.total_applied,
      this.total_saved,
        this.city,
      this.token1});



  PageController? pageController;
  int pageIndex = 0;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onItemSelected(int pageIndex) {
    SharedPreferencesManager.getTotalSavedJobs(int.tryParse(user_Id));
    pageController!.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  Future<String> loadViewData() async {
    savedJobs = await request(context, false);
    return "OK";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
     u_Name = uName;
     u_password= password;
     u_Id = user_Id;
     u_firstName = firstName;
     u_jobId= jobId;

    print('uName is $uName');
    print('name $firstName');
    print('nationality meri: $nationality');
    print('title $title');
    print('pass is $password');
    // print('token is $token1');
    // print('ProfilePic is $profile');
    print('cv is $cv');
    print ("cv url is $CVurl");
    print('city is : $city');
    print('resume is $resumee');
    print("Resme  url is $VisumeUrl");

    loadViewData();

    setState(() {
      TotalNotifiction();
    });

    Requests.getJobDetails(int.tryParse(user_Id.toString()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController!.dispose();
    super.dispose();
  }

  bool isSelected = false;
  Future<bool> _exitApp() {
    return showDialog(
          builder: (context) => AlertDialog(
            title: Text('Do you want to exit this application?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  print("you choose no");
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blue[800],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blue[800],
                ),
              )
            ],
          ),
          context: context,
        ).then((value) => value as bool) ??
        false as Future<bool>;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringManager.home),
        ),
        backgroundColor: Colors.white,
        body: PageView(
          children: <Widget>[
            HomeSearch(
              uName: uName,
              password: password,
              user_Id: user_Id,
              firstName: firstName,
              jobDetails: jobDetails,
              favoriteJobs: favoriteJobs,
              userDetails: userDetails,
              jobId: jobId,
              nationality : nationality,
              cv: cv,
              resume: resumee,
              totalNotification: totalNotification.totalCountNotf,
            ),
            Profile(
                user_Id: user_Id,
                firstName: firstName,
                total_applied: total_applied,
                total_saved: total_saved,
                favoriteJobs: favoriteJobs,
                uName: uName,
                city: city,
                password: password,
                nationality : nationality,
                cv: cv,
                resume: resumee),
            ProfileMain(
                uName: uName,
                password: password,
                user_Id: user_Id,
                firstName: firstName,
                title: title,
                profile: profile,
                city : city,
                nationality : nationality,
                userDetails: userDetails,
            ),
            Shortlisted(),
          ],
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),

          child: BottomNavigationBar(

            backgroundColor: Colors.pink,

            selectedFontSize: 16,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              color: ColorManager.bluePrimary,
            ),
            unselectedLabelStyle: TextStyle(
              color: ColorManager.pinkPrimary,
            ),
            selectedItemColor: ColorManager.bluePrimary,
            unselectedItemColor: ColorManager.pinkPrimary,
            onTap: onItemSelected, // new
            currentIndex: pageIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              new BottomNavigationBarItem(
                  icon:Icon(CupertinoIcons.profile_circled),
                  label: 'Profile'),
              new BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.info),
                label: 'About Us',
              ),
            ],
          ),
        ),
      ),
    );
  }


  // ignore: missing_return
  Future <TotalNotification?> TotalNotifiction() async {
    final url = "https://girlzwhosellcareerconextions.com/API/total_notifications.php?seeker_id=$user_Id";
    try{
      final http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200 ){
        print('response is : ${response.body}');

        totalNotification = TotalNotification.fromJson(json.decode(response.body));
        return totalNotification;

      }
    } catch (e){
      print(e.toString());
    }
  }



  Future<List<SavedJobs>?> request(
      BuildContext context, bool showLoading) async {
    String get_key_url =
        "https://girlzwhosellcareerconextions.com/API/fetch_saved_jobs.php?user_id=${user_Id}";

    // http.Response response;
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      if (showLoading) showLoadingDialog(context, _keyLoader);

      final http.Response response = await http.get(Uri.parse(get_key_url));
      print("email,${get_key_url}");
      if (showLoading)
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

      if (response.statusCode == 200) {
        AllSavedJobss resp = AllSavedJobss.fromJson(json.decode(response.body));
        print(response.statusCode);
        print(response.body);

        if (resp.status == 100) {
          showDialogCustom(
              context,
              "Failed",
              resp.message!.length == 0 ? "record not found" : resp.message,
              "OK");
          return [];
        }
        setState(() {
          // totalSavedJobs = resp.savedJobs.length;
        });
        return resp.savedJobs;
      }
    } catch (error) {
      Future.delayed(
          Duration.zero,
              () => dataSuccessfullyLoaded(
              context,
              getTranslated(context, 'Not_Found'),
              getTranslated(context, 'Data_Not_Found'),
              getTranslated(context, 'OK')));
      return [];
    }
  }



}
