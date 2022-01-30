//
//
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'model/general_model.dart';
// import 'model/login_model.dart';
// class PrefrencesService {
//
//   Future<String> getToken(String stringValue , String Job_id) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('user_Id', user_Id);
//     prefs.setString('job_Id', jobDetails.id);
//     stringValue = prefs.getString('user_Id');
//     Job_id = prefs.getString('job_Id');
//     print('string:$stringValue');
//     return stringValue;
//   }
//
//
//   String token = await _storageService.getTokenAsync();
//
// _storageService.setTokenAsync(entity.token);
//
// }