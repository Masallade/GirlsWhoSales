class TokenModel {
  String? message;
  String? status;
  String? token;

  TokenModel({this.message, this.status, this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['token'] = this.token;
    return data;
  }
}