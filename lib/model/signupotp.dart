class SignUpverifyOtp {
  String? message;
  String? userId;
  String? status;

  SignUpverifyOtp({this.message, this.userId, this.status});

  SignUpverifyOtp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    return data;
  }
}