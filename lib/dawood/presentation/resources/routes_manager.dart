
import 'package:flutter/material.dart';
import 'package:girlzwhosell/User_profile/Edit_Profile.dart';
import 'package:girlzwhosell/User_profile/current_password.dart';
import 'package:girlzwhosell/User_profile/user_personal_data.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';
import 'package:girlzwhosell/screens/intro_pages/second_splash_screen.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/main_menu/all_jobs.dart';
import 'package:girlzwhosell/screens/main_menu/more/general_search.dart';
import 'package:girlzwhosell/screens/profile/cv_update.dart';
import 'package:girlzwhosell/screens/profile/help_form.dart';

class Routes{
  static const String splashRoute="/";
  static const String editProfilePagePath="/editProfilePage";
  static const String cvUpdatePath="/cvUpdate";
  static const String currentPasswordPath="/currentPassword";
  static const String notificationScreenPath="/notificationScreen";
  static const String helpFormPath="/helpForm";
  static const String signInPagePath="/signInPage";
  static const String jobSearchPagePath="/jobSearchPage";
  static const String allSavedJobsPagePath="/allSavedJobs";
  static const String allJobsPagePath="/allJobs";
  static const String viewProfilePicPath="/viewProfilePic";
  static const String editProfilePage1Path="/EditProfilePage1";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>SecondSplash());
      case Routes.editProfilePagePath:
        final args=routeSettings.arguments as CurrentUserDetails;
        return MaterialPageRoute(builder: (_)=>EditProfilePage(currentUserDetails: args));

      case Routes.cvUpdatePath:
        final args=routeSettings.arguments as CurrentUserDetails;
        return MaterialPageRoute(builder: (_)=>CVUpdate(currentUserDetails: args));

      case Routes.currentPasswordPath:
        final args=routeSettings.arguments as String;
        return MaterialPageRoute(builder:(_)=>CurrentPassword(user_id: args,));

      case Routes.notificationScreenPath:
        final args=routeSettings.arguments as String;
        return MaterialPageRoute(builder: (_)=>NotificationScreen(user_Id: args,));

      case Routes.helpFormPath:
        return MaterialPageRoute(builder: (_)=>HelpForm());

      case Routes.signInPagePath:
        return MaterialPageRoute(builder: (_)=>SignInPage());

      case Routes.jobSearchPagePath:
        final args=routeSettings.arguments as CurrentUserDetails;
        return MaterialPageRoute(builder: (_)=>JobSearchSecond(currentUserDetails: args,));

      case Routes.allSavedJobsPagePath:
        final args=routeSettings.arguments as CurrentUserDetails;
        return MaterialPageRoute(builder: (_)=>AllSavedJobs(currentUserDetails: args));

      case Routes.allJobsPagePath:
        final args= routeSettings.arguments as CurrentUserDetails;
        return MaterialPageRoute(builder: (_)=>AllJobs(currentUserDetails: args));

      case Routes.editProfilePage1Path:
        final args =routeSettings.arguments as CurrentUserDetails;
        return MaterialPageRoute(builder: (_)=>EditProfilePage1(currentUserDetails: args,));

      default:
        return MaterialPageRoute(builder:(_)=> unDefinedRoute());
    }

  }
  }

  Widget unDefinedRoute(){
  return Scaffold(
    appBar: AppBar(
      title: Text(AppString.unDefinedRoute),
    ),
  );
  }