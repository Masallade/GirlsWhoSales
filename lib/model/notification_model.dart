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
  String logo;

  NotificationsDetails(
      {this.id, this.seekerId, this.jobId, this.notifyTitle, this.notifyText ,this.logo});

  NotificationsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seekerId = json['seeker_id'];
    jobId = json['job_id'];
    notifyTitle = json['notify_title'];
    notifyText = json['notify_text'];
    logo = json ['company_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['job_id'] = this.jobId;
    data['notify_title'] = this.notifyTitle;
    data['notify_text'] = this.notifyText;
    data['company_logo'] = this.logo;
    return data;
  }
}