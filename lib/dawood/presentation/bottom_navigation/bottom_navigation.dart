import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/dawood/presentation/home/view/home.dart';
import 'package:girlzwhosell/dawood/presentation/dashboard/dashboard.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/about_us.dart';
import 'package:girlzwhosell/dawood/presentation/profile/view/profile.dart';
import 'package:http/http.dart' as http;

import '../../../http/Requests.dart';
import '../../../model/SavedJobsModel.dart';
import '../../../model/total_notification.dart';
import '../../../user_preferences/user_pref_manager.dart';
import '../../../utils/constants.dart';
import '../home/view/home.dart';

// ignore: must_be_immutable
class BottomNavigationView extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;

  BottomNavigationView({Key? key, required this.currentUserDetails}): super(key: key);

  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState(
    currentUserDetails: currentUserDetails
  );
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  final CurrentUserDetails currentUserDetails;

  _BottomNavigationViewState({required this.currentUserDetails});



  PageController? pageController;
  int pageIndex = 0;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onItemSelected(int pageIndex) {
    SharedPreferencesManager.getTotalSavedJobs(int.tryParse(currentUserDetails.user_Id));
    pageController!.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  Future<String> loadViewData() async {
    currentUserDetails.savedJobs = await request(context, false);
    return "OK";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
     u_Name = currentUserDetails.uName;
     u_password= currentUserDetails.password;
     u_Id = currentUserDetails.user_Id;
     u_firstName = currentUserDetails.firstName;
     u_jobId= currentUserDetails.jobId;

    print('uName is ${currentUserDetails.uName}');
    print('name ${currentUserDetails.firstName}');
    print('nationality meri: ${currentUserDetails.nationality}');
    print('title ${currentUserDetails.title}');
    print('pass is ${currentUserDetails.password}');
    // print('token is $token1');
    // print('ProfilePic is $profile');
    print('cv is ${currentUserDetails.cv}');
    print ("cv url is CVurl");
    print('city is : ${currentUserDetails.city}');
    print('resume is ${currentUserDetails.resumee}');
    print("Resme  url is $VisumeUrl");

    loadViewData();

    setState(() {
      TotalNotifiction();
    });

    Requests.getJobDetails(int.tryParse(currentUserDetails.user_Id.toString()));
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
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppString.exitAppMsgTitle,style: Theme.of(context).textTheme.displayMedium,),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  AppString.no,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), backgroundColor: Colors.blue[800],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text(
                  AppString.yes,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), backgroundColor: Colors.blue[800],
                ),
              )
            ],
          ),

        ).then((value) => value as bool) ??
        false as Future<bool>;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.home),
        ),
        backgroundColor: Colors.white,
        body: PageView(
          children: <Widget>[
            HomeView(currentUserDetails: currentUserDetails,),
            DashBoard(currentUserDetails: currentUserDetails),
            ProfileView(currentUserDetails: currentUserDetails,),
            AboutUsView(),
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
    final url = "https://girlzwhosellcareerconextions.com/API/total_notifications.php?seeker_id=$currentUserDetails.user_Id";
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
        "https://girlzwhosellcareerconextions.com/API/fetch_saved_jobs.php?user_id=${currentUserDetails.user_Id}";

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
