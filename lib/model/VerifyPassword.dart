
import 'dart:convert';

VerifyPassword verifyPasswordFromJson(String str) => VerifyPassword.fromJson(json.decode(str));

String verifyPasswordToJson(VerifyPassword data) => json.encode(data.toJson());

class VerifyPassword {
  VerifyPassword({
    this.message,
    this.userId,
    this.status,
  });

  String? message;
  UserId? userId;
  String? status;

  factory VerifyPassword.fromJson(Map<String, dynamic> json) => VerifyPassword(
    message: json["message"],
    userId: UserId.fromJson(json["user_id"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user_id": userId!.toJson(),
    "status": status,
  };
}

class UserId {
  UserId({
    this.empty,
  });

  Empty? empty;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    empty: Empty.fromJson(json[""]),
  );

  Map<String, dynamic> toJson() => {
    "": empty!.toJson(),
  };
}

class Empty {
  Empty({
    this.id,
  });

  String? id;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
