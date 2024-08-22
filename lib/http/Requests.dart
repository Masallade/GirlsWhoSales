import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/model/utils.dart';
import 'package:girlzwhosell/dawood/presentation/bottom_navigation/bottom_navigation.dart';
import 'package:girlzwhosell/dawood/presentation/profile/view/profile.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/SavedJobsModel.dart';
import '../model/all_jobs_model.dart';
import '../screens/main_menu/all_jobs.dart';

SharedPreferences? logindata;



class Requests {

  static Future<dynamic> Login(
      BuildContext context,
      String? userName,
      String? password,
      String token1 ,
      bool resync) async {
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      if(!resync){
        utils.showLoadingDialog(context, _keyLoader);
      }


      final response = await http.post(
        Uri.parse(base_url + "login.php"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "email": userName,
          "password": password,
          "token": token1
        },
      );

      print('herre is the main response ${response.statusCode} ${response.body} ');

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
        print("==================SharedPrefrence values==================");

        final prefs = await SharedPreferences.getInstance();

        prefs.setString("uName====", userName!);
        prefs.setString("pass=====", password!);

        //  logindata.getString('username');
        final uName = await prefs.getString("uName");
        final pass = await prefs.getString("pass");

        print('Uname $uName');
        print('pass $pass');

        print("==================RESPONSE CODE==================");
        print(response.body);
        print(response.statusCode);
        print('statusCode');



        if (loginModel.status == "200") {
          print(loginModel.status);
          print(loginModel.message);
          print(loginModel.jobDetails);
          print(loginModel.seekerDetails);

          CVurl = loginModel.seekerDetails![0].cV;
          VisumeUrl = loginModel.seekerDetails![0].resume;

          if(!resync){
            CurrentUserDetails currentUserDetails=CurrentUserDetails(
              uName: uName,
              password: pass,
              user_Id: loginModel.seekerDetails![0].id,
              cookiee: loginModel.message,
              jobDetails: loginModel.jobDetails,
              favoriteJobs: loginModel.favoriteJobs,
              userDetails: loginModel.seekerDetails,
              firstName: loginModel.seekerDetails![0].firstname,
              title: loginModel.seekerDetails![0].jobTitle,
              profile: loginModel.seekerDetails![0].profilePicture,
              // city : loginModel.seekerDetails[0].city,
              nationality: loginModel.seekerDetails![0].city,
              cv: loginModel.seekerDetails![0].cV,
              resumee: loginModel.seekerDetails![0].resume,
              total_applied: loginModel.countOfJobsApplied,
              total_saved: loginModel.countOfJobsSaved,
              token1: token1,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavigationView(
                    currentUserDetails: currentUserDetails,
                  );
                },
              ),
            );
            print('===========Calling From Login meri=========');
          }
        } else {
          if(!resync){
            utils().showDialogCustomForLogin(
                context,
                "Error",
                loginModel.message == null
                    ? "Server returned failure. Please try to restart the application."
                    : loginModel.message,
                "OK");
          }else{
            utils().showDialogCustomForLogin(
                context,
                "Error",
                loginModel.message == null
                    ? "Server returned failure. Please try to restart the application."
                    : loginModel.message,
                "OK");
          }

        }
      }
    } catch (error) {
      print('dawood dawood dawood');
      print(error.toString());
      // utils().showDialogCustomForLogin(context, "Failed",
      //     "No Internet Connection. Or Some Internal Issues", "OK");
    }
  }



  // ignore: missing_return
  // static Future<List<SearchModel>> getSearch(String query) async {//old code tariq
  //   final url = "https://biitsolutions.co.uk/girlzwhosell/API/jobs_list.php";
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       print("Status Code is: ${response.statusCode}");
  //       final List data = json.decode(response.body);
  //       print("Response is: ${response.body}");
  //       return data.map((json) => SearchModel.fromJson(json)).where((element) {
  //         final titleLower = element.title.toLowerCase();
  //         final locationlower = element.location.toLowerCase();
  //         final searchLower = query.toLowerCase();
  //
  //         return titleLower.contains(searchLower) ||
  //             locationlower.contains(searchLower);
  //       }).toList();
  //     }
  //   } catch (e) {
  //     print("Error in exception::: ${e.toString()}");
  //   }
  // }
  static Future<List<SearchModel>?> getSearch(String query) async {
    final url = "https://girlzwhosellcareerconextions.com/API/jobs_list.php";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("Status Code is: ${response.statusCode}");
        final List data = json.decode(response.body);
        print("Response is: ${response.body}");
        return data
            .map((json) => SearchModel.fromJson(json))
            .where((element) {
          final title = element.title ?? '';
          final location = element.location ?? '';
          final searchLower = query.toLowerCase();

          final titleLower = title.toLowerCase();
          final locationLower = location.toLowerCase();

          return titleLower.contains(searchLower) ||
              locationLower.contains(searchLower);
        })
            .toList();
      }
    } catch (e) {
      print("Error in exception: ${e.toString()}");
    }
    return null;
  }



  static Future<dynamic> ProfileLogin(BuildContext context, String? userName,
      String? password, String token1, bool resync) async {
    try {

      final response = await http.post(
        Uri.parse(base_url + "login.php"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"email": userName, "password": password, "token": token1},
      );

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
        //  TokenModel tokenModel = TokenModel.fromJson(json.decode(response.body));
        // StorageBase storage = Storage();
        // await storage.updatetokenInfo(loginModel);
        //await storage.updatetoken(tokenModel);

        print("==================SharedPrefrence values==================");

        final prefs = await SharedPreferences.getInstance();

        prefs.setString("uName", userName!);
        prefs.setString("pass", password!);

        final uName = await prefs.getString("uName");
        final pass = await prefs.getString("pass");

        print('Uname $uName');
        print('pass $pass');

        print("==================RESPONSE CODE==================");
        print(response.body);
        print(response.statusCode);
        print('statusCode');

        if (loginModel.status == "200") {
          print(loginModel.status);
          print(loginModel.message);
          print(loginModel.jobDetails);
          showToast(
            'Profile has been Updated Successfully',
            context: context,
            fullWidth: true,
            backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
            animation: StyledToastAnimation.slideFromBottomFade,
            reverseAnimation: StyledToastAnimation.fade,
            position: StyledToastPosition.center,
            animDuration: Duration(seconds: 1),
            duration: Duration(seconds: 2),
            curve: Curves.elasticOut,
            reverseCurve: Curves.linear,
          );
          CurrentUserDetails currentUserDetails=CurrentUserDetails(
              uName:uName,
              password:pass,
              user_Id:loginModel.seekerDetails![0].id,
              nationality:loginModel.seekerDetails![0].city,
              userDetails:loginModel.seekerDetails,
              firstName:loginModel.seekerDetails![0].firstname,
              title:loginModel.seekerDetails![0].jobTitle,
              profile:loginModel.seekerDetails![0].profilePicture,
              city:loginModel.seekerDetails![0].city,


          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                print('nationality in request : $seekerDetails.state');

                return ProfileView(currentUserDetails: currentUserDetails);
              },
            ),
          );

          // Requests.getInvoiceData(context, loginModel.jwt);
          print('===========Calling From Login=========');
        } else {
          utils().showDialogCustomForLogin(
              context,
              "Error",
              loginModel.message == null
                  ? "Server returned failure. Please try to restart the application."
                  : loginModel.message,
              "OK");
        }
      }
    } catch (error) {
      print(error.toString());
      // utils().showDialogCustomForLogin(
      //     context, "Failed", "No Internet Connection.", "OK");
    }
  }


  //getting all job details

  static Future<List<JobDetails>?> getJobDetails(int? user_ID) async {
    var request = http.Request('GET', Uri.parse(base_url + 'jobs_filtered.php?user_id=$user_ID'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(await response.stream.bytesToString());
      all_jobs_details = [];

      for (var jsonItem in responseData) {
        JobDetails job = JobDetails.fromJson(jsonItem);
        all_jobs_details!.add(job);
      }
      print("hello =================== >>>>>>>> +++++++++ ${all_jobs_details!.length}");


      return all_jobs_details;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static List<FavoriteJobs>? updatefavoriteJobs;

  static Future<List<FavoriteJobs>?> updatefavoriteJob(
      BuildContext context,String userID) async {
    String get_key_url =
        "https://girlzwhosellcareerconextions.com/API/fetch_saved_jobs.php?user_id=${userID}";

    // http.Response response;
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      // if (showLoading) showLoadingDialog(context, _keyLoader);

      final http.Response response = await http.get(Uri.parse(get_key_url));
      // print("email,${get_key_url}");
      // if (showLoading)
      //   Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      if (response.statusCode == 200) {
        AllFavoriteJobss resp = AllFavoriteJobss.fromJson(json.decode(response.body));


        if (resp.status == 100) {
          // showDialogCustom(
          //     context,
          //     "Failed",
          //     resp.message.length == 0 ? "record not found" : resp.message,
          //     "OK");
          return [];
        }
        // totalSavedJobs = resp.savedJobs.length;
        updatefavoriteJobs = resp.favJobs;
        print("jobs are hereeeeeeeeeeee ===============>>>>>> ${updatefavoriteJobs}");
        return resp.favJobs;
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


