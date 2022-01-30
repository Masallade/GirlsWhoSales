class DashboadAppliedJobsModel {
  String message;
  String status;
  List<FavoriteJobs> favoriteJobs;

  DashboadAppliedJobsModel({this.message, this.status, this.favoriteJobs});

  DashboadAppliedJobsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['Favorite_Jobs'] != null) {
      favoriteJobs = new List<FavoriteJobs>();
      json['Favorite_Jobs'].forEach((v) {
        favoriteJobs.add(new FavoriteJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.favoriteJobs != null) {
      data['Favorite_Jobs'] = this.favoriteJobs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteJobs {
  String seekerId;
  String isShortlisted;
  String isInterviewed;
  String appliedDate;
  Null description;
  Null title;
  Null maxSalary;
  Null minSalary;
  Null skills;

  FavoriteJobs(
      {this.seekerId,
        this.isShortlisted,
        this.isInterviewed,
        this.appliedDate,
        this.description,
        this.title,
        this.maxSalary,
        this.minSalary,
        this.skills});

  FavoriteJobs.fromJson(Map<String, dynamic> json) {
    seekerId = json['seeker_id'];
    isShortlisted = json['is_shortlisted'];
    isInterviewed = json['is_interviewed'];
    appliedDate = json['applied_date'];
    description = json['description'];
    title = json['title'];
    maxSalary = json['max_salary'];
    minSalary = json['min_salary'];
    skills = json['skills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seeker_id'] = this.seekerId;
    data['is_shortlisted'] = this.isShortlisted;
    data['is_interviewed'] = this.isInterviewed;
    data['applied_date'] = this.appliedDate;
    data['description'] = this.description;
    data['title'] = this.title;
    data['max_salary'] = this.maxSalary;
    data['min_salary'] = this.minSalary;
    data['skills'] = this.skills;
    return data;
  }
}