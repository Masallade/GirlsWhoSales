class GetUserDataLink {
  String? message;
  String? status;
  List<SeekerDetails1>? seekerDetails;

  GetUserDataLink({this.message, this.status, this.seekerDetails});

  GetUserDataLink.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['Seeker_details'] != null) {
      seekerDetails = <SeekerDetails1>[];
      json['Seeker_details'].forEach((v) {
        seekerDetails!.add(new SeekerDetails1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.seekerDetails != null) {
      data['Seeker_details'] =
          this.seekerDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeekerDetails1 {
  String? resume;
  String? cV;

  SeekerDetails1({this.resume, this.cV});

  SeekerDetails1.fromJson(Map<String, dynamic> json) {
    resume = json['resume'];
    cV = json['CV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resume'] = this.resume;
    data['CV'] = this.cV;
    return data;
  }
}
