
import 'dart:convert';


class VerifyEmailsignup {
  VerifyEmailsignup({
    this.message,
    this.status,
  });

  String? message;
  String? status;

  factory VerifyEmailsignup.fromJson(Map<String, dynamic> json) => VerifyEmailsignup(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}