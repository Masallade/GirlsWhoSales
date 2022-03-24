class JobSearchModel {
  String status;
  String message;
  List<JobsList> jobsList;

  JobSearchModel({this.status, this.message, this.jobsList});

  JobSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['Jobs List'] != null) {
      // ignore: deprecated_member_use
      jobsList = new List<JobsList>();
      json['Jobs List'].forEach((v) {
        jobsList.add(new JobsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.jobsList != null) {
      data['Jobs List'] = this.jobsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobsList {
  String id;
  String employerId;
  String title;
  String description;
  String minSalary;
  String maxSalary;
  String experience;
  String skills;
  String location;
  String totalPositions;

  JobsList(
      {this.id,
        this.employerId,
        this.title,
        this.description,
        this.minSalary,
        this.maxSalary,
        this.experience,
        this.skills,
        this.location,
        this.totalPositions});

  JobsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employerId = json['employer_id'];
    title = json['title'];
    description = json['description'];
    minSalary = json['min_salary'];
    maxSalary = json['max_salary'];
    experience = json['experience'];
    skills = json['skills'];
    location = json['location'];
    totalPositions = json['total_positions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employer_id'] = this.employerId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['min_salary'] = this.minSalary;
    data['max_salary'] = this.maxSalary;
    data['experience'] = this.experience;
    data['skills'] = this.skills;
    data['location'] = this.location;
    data['total_positions'] = this.totalPositions;
    return data;
  }
}

