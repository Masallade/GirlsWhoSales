import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/total_saved_jobs.dart';
import '../utils/constants.dart';

class SharedPreferencesManager {
  static SharedPreferences? _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    print("prefences loaded ");
  }

  static bool getUserPref(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  static Future<void> setUserPref(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static late Total_Saved_Job total_saved_job;
  static String saved_job_counter = "0";

  static Future<void>  getTotalSavedJobs(int? userId)async{
    var request = http.Request('GET', Uri.parse('https://girlzwhosellcareerconextions.com/API/total_saved_jobs.php?user_id=$userId'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String jsonBody  = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(jsonBody);
      total_saved_job = Total_Saved_Job.fromJson(jsonResponse);

      totalSavedJobs = total_saved_job.countOfJobsSaved;


      print("totatl saved jobs ${total_saved_job.countOfJobsSaved}");
      print("totatl appllied jobs ${total_saved_job.countOfJobsApplied}");
    }
    else {
      print(response.reasonPhrase);
    }

  }
}

