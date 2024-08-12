class fetchAppliedJobsModel {
  String? message;
  String? status;
  List<AppliedJobDetails>? appliedJobDetails;

  fetchAppliedJobsModel({this.message, this.status, this.appliedJobDetails});

  fetchAppliedJobsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['Applied_Job_Details'] != null) {
      // ignore: deprecated_member_use
      appliedJobDetails = List<AppliedJobDetails>.empty(growable: true);
      json['Applied_Job_Details'].forEach((v) {
        appliedJobDetails!.add(new AppliedJobDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.appliedJobDetails != null) {
      data['Applied_Job_Details'] =
          this.appliedJobDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppliedJobDetails {
  String? seekerId;
  String? msg;
  int? staus;
  String? appliedDate;
  String? description;
  String? title;
  String? maxSalary;
  String? minSalary;
  String? skills;
  String? experience;
  String? companyLogo;
  String? jobId;
  String? url;
  String? location;
  String? companyName;
  String? jobtype;
  AppliedJobDetails(
      {this.seekerId,
        this.msg,
        this.staus,
        this.appliedDate,
        this.description,
        this.title,
        this.maxSalary,
        this.minSalary,
        this.skills,
        this.experience,
        this.companyLogo,
        this.jobId,
        this.url ,this.location ,
      this.companyName ,this.jobtype});

  AppliedJobDetails.fromJson(Map<String, dynamic> json) {
    seekerId = json['seeker_id'];
    msg = json['msg'];
    staus = json['staus'];
    appliedDate = json['applied_date'];
    description = json['description'];
    title = json['title'];
    maxSalary = json['max_salary'];
    minSalary = json['min_salary'];
    skills = json['skills'];
    experience = json['Experience'];
    companyLogo = json['Company_Logo'];
    jobId = json['Job_Id'];
    url = json['url'];
    location = json['city'];
    companyName= json['company_name'];
    jobtype =json['job_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seeker_id'] = this.seekerId;
    data['msg'] = this.msg;
    data['staus'] = this.staus;
    data['applied_date'] = this.appliedDate;
    data['description'] = this.description;
    data['title'] = this.title;
    data['max_salary'] = this.maxSalary;
    data['min_salary'] = this.minSalary;
    data['skills'] = this.skills;
    data['Experience'] = this.experience;
    data['Company_Logo'] = this.companyLogo;
    data['Job_Id'] = this.jobId;
    data['url'] = this.url;
    data['city'] = this.location;
    data['company_name'] = this.companyName;
    data['job_type'] = this.jobtype;

    return data;
  }
}