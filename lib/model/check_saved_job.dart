class CheckSaved {
  String? message;
  int? applied;
  int? status;

  CheckSaved({this.message, this.applied, this.status});

  CheckSaved.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    applied = json['Applied'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['Applied'] = this.applied;
    data['status'] = this.status;
    return data;
  }
}