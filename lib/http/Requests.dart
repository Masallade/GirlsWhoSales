
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/model/utils.dart';
import 'package:girlzwhosell/screens/main_menu/navbar_builder_copy.dart';
import 'package:girlzwhosell/screens/profile/profile_main.dart';
import 'package:girlzwhosell/utils/Storage.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class Requests {

  static Future <List<SearchModel>> getSearch(String query) async {
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/jobs_list.php";
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        print("Status Code is: ${response.statusCode}");
        final List data = json.decode(response.body);
        print("Response is: ${response.body}");
        return data.map((json) => SearchModel.fromJson(json)).where((element) {
          final titleLower= element.title.toLowerCase();
          final locationlower= element.location.toLowerCase();
          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower)  || locationlower.contains(searchLower);
        }).toList();
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }

  static Future <List<SearchModel>> getSearchTwo(String query) async {
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/jobs_list.php";
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        print("Status Code is: ${response.statusCode}");
        final List data = json.decode(response.body);
        print("Response is: ${response.body}");
        return data.map((json) => SearchModel.fromJson(json)).where((element) {
         // final titleLower= element.title.toLowerCase();
          final locationlower= element.location.toLowerCase();
          final searchLower = query.toLowerCase();

          return locationlower.contains(searchLower);

          // return titleLower.contains(searchLower)  || locationlower.contains(searchLower);
        }).toList();
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }

  static Future<dynamic> Login(BuildContext context, String userName, String password, String token1 ,bool resync) async {

    http.Response response;
    try
    {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();


     utils.showLoadingDialog(context, _keyLoader);

      final response = await http.post(
        Uri.parse(base_url+"login.php"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "email": userName,
          "password":password,
          "token": token1

        },
      );

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      //  TokenModel tokenModel = TokenModel.fromJson(json.decode(response.body));
        StorageBase storage = Storage();
       // await storage.updatetokenInfo(loginModel);
        //await storage.updatetoken(tokenModel);

        print("==================SharedPrefrence values==================");

     final prefs= await SharedPreferences.getInstance();

         prefs.setString("uName",userName);
         prefs.setString("pass",password);


      final uName= await  prefs.getString("uName");
        final pass= await   prefs.getString("pass");

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage(
                    uName: uName,
                    password: pass,
                    user_Id: loginModel.seekerDetails[0].id, cookiee: loginModel.message,
                    jobDetails: loginModel.jobDetails, favoriteJobs: loginModel.favoriteJobs,
                  userDetails: loginModel.seekerDetails , firstName: loginModel.seekerDetails[0].firstname,
                  title:loginModel.seekerDetails[0].jobTitle, profile: loginModel.seekerDetails[0].profilePicture,
                  total_applied: loginModel.countOfJobsApplied,
                  total_saved: loginModel.countOfJobsSaved,token1: token1,
                );
              },
            ),
          );

          // Requests.getInvoiceData(context, loginModel.jwt);
          print('===========Calling From Login=========');
        } else {
          utils().showDialogCustomForLogin(context, "Error",
              loginModel.message == null
                  ? "Server returned failure. Please try to restart the application."
                  : loginModel.message, "OK");
        }
      }
    }
    catch(error)
    {
      print(error.toString());
      utils().showDialogCustomForLogin(context, "Failed", "No Internet Connection.", "OK");
    }
  }
  static Future<dynamic> ProfileLogin(BuildContext context, String userName, String password, String token1 ,bool resync) async {

    http.Response response;
    try
    {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();


      utils.showLoadingDialog(context, _keyLoader);

      final response = await http.post(
        Uri.parse(base_url+"login.php"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "email": userName,
          "password":password,
          "token": token1

        },
      );

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
        //  TokenModel tokenModel = TokenModel.fromJson(json.decode(response.body));
        StorageBase storage = Storage();
        // await storage.updatetokenInfo(loginModel);
        //await storage.updatetoken(tokenModel);

        print("==================SharedPrefrence values==================");

        final prefs= await SharedPreferences.getInstance();

        prefs.setString("uName",userName);
        prefs.setString("pass",password);


        final uName= await  prefs.getString("uName");
        final pass= await   prefs.getString("pass");

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfileMain(
                  uName: uName,
                  password: pass,
                  user_Id: loginModel.seekerDetails[0].id,
                  //cookiee: loginModel.message,
            //      jobDetails: loginModel.jobDetails, favoriteJobs: loginModel.favoriteJobs,
                  userDetails: loginModel.seekerDetails , firstName: loginModel.seekerDetails[0].firstname,
                  title:loginModel.seekerDetails[0].jobTitle, profile: loginModel.seekerDetails[0].profilePicture,
                  // total_applied: loginModel.countOfJobsApplied,
                  // total_saved: loginModel.countOfJobsSaved,token1: token1,
                );
              },
            ),
          );

          // Requests.getInvoiceData(context, loginModel.jwt);
          print('===========Calling From Login=========');
        } else {
          utils().showDialogCustomForLogin(context, "Error",
              loginModel.message == null
                  ? "Server returned failure. Please try to restart the application."
                  : loginModel.message, "OK");
        }
      }
    }
    catch(error)
    {
      print(error.toString());
      utils().showDialogCustomForLogin(context, "Failed", "No Internet Connection.", "OK");
    }
  }


}