import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/dawood/presentation/resources/routes_manager.dart';
import 'package:http/http.dart' as http;

Future DeleteAccount(String UserId,BuildContext context) async {
  CircularProgressIndicator();

  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://girlzwhosellcareerconextions.com/API/delete_account.php'));
  request.fields.addAll({'seeker_id': UserId});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: "User Deleted Successfully");
    Navigator.pushReplacementNamed(context, Routes.signInPagePath);
    // print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}