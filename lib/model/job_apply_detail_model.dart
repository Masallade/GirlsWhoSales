import 'dart:convert';

JobAppliedDetailModel jobAppliedDetailModelFromJson(String str) =>
    JobAppliedDetailModel.fromJson(json.decode(str));

String jobAppliedDetailModelToJson(JobAppliedDetailModel data) =>
    json.encode(data.toJson());

class JobAppliedDetailModel {
  JobAppliedDetailModel({
    this.status,
    this.message,
    this.applied,
  });

  int? status;
  String? message;
  int? applied;

  factory JobAppliedDetailModel.fromJson(Map<String, dynamic> json) =>
      JobAppliedDetailModel(
        status: json["status"],
        message: json["message"],
        applied: json["Applied"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "Applied": applied,
      };
}
