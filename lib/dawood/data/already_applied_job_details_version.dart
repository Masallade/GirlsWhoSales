import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:girlzwhosell/model/job_apply_detail_model.dart';
import 'package:girlzwhosell/utils/constants.dart';

Future<JobAppliedDetailModel> alreadyappliedJobDetailsVersion({required String userID,required jobDetailsID}) async {
  final url = "https://girlzwhosellcareerconextions.com/API/applied_job.php";
  try {
    final response = await http.post(Uri.parse(url), body: {
      "user_id": userID,
      "job_id": jobDetailsID,
    });
    if (response.statusCode == 200) {
      print("Response is: ${response.body}");
      print('${jobDetailsID}');
      print("Status Code is: ${response.statusCode}");
      jobAppliedDetailModel = JobAppliedDetailModel.fromJson(json.decode(response.body));
      return jobAppliedDetailModel;
    }
  } catch (e) {
    print("Error in exception::: ${e.toString()}");
  }
  return jobAppliedDetailModel;
}