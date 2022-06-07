class NotificationModel {
  String message;
  String status;
  List<NotificationsDetails> notificationsDetails;

  NotificationModel({this.message, this.status, this.notificationsDetails});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['Notifications_Details'] != null) {
      notificationsDetails = <NotificationsDetails>[];
      json['Notifications_Details'].forEach((v) {
        notificationsDetails.add(new NotificationsDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.notificationsDetails != null) {
      data['Notifications_Details'] =
          this.notificationsDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationsDetails {
  String id;
  String seekerId;
  String jobId;
  String notifyTitle;
  String notifyText;
  String companyLogo;
  String msg;
  int staus;
  String appliedDate;
  String description;
  String title;
  String maxSalary;
  String minSalary;
  String skills;
  String experience;
  String url;
  String companyName;
  String city;
  String jobType;
  String color;
  NotificationsDetails(
      {this.id,
        this.seekerId,
        this.jobId,
        this.notifyTitle,
        this.notifyText,
        this.companyLogo,
        this.msg,
        this.staus,
        this.appliedDate,
        this.description,
        this.title,
        this.maxSalary,
        this.minSalary,
        this.skills,
        this.experience,
        this.url,
        this.companyName,
        this.city,
        this.jobType , this.color});

  NotificationsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seekerId = json['seeker_id'];
    jobId = json['job_id'];
    notifyTitle = json['notify_title'];
    notifyText = json['notify_text'];
    companyLogo = json['company_logo'];
    msg = json['msg'];
    staus = json['staus'];
    appliedDate = json['applied_date'];
    description = json['description'];
    title = json['title'];
    maxSalary = json['max_salary'];
    minSalary = json['min_salary'];
    skills = json['skills'];
    experience = json['Experience'];
    jobId = json['Job_Id'];
    url = json['url'];
    companyName = json['company_name'];
    city = json['city'];
    jobType = json['job_type'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['job_id'] = this.jobId;
    data['notify_title'] = this.notifyTitle;
    data['notify_text'] = this.notifyText;
    data['company_logo'] = this.companyLogo;
    data['msg'] = this.msg;
    data['staus'] = this.staus;
    data['applied_date'] = this.appliedDate;
    data['description'] = this.description;
    data['title'] = this.title;
    data['max_salary'] = this.maxSalary;
    data['min_salary'] = this.minSalary;
    data['skills'] = this.skills;
    data['Experience'] = this.experience;
    data['Job_Id'] = this.jobId;
    data['url'] = this.url;
    data['company_name'] = this.companyName;
    data['city'] = this.city;
    data['job_type'] = this.jobType;
    data['color'] = this.color;
    return data;
  }
}