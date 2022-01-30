class AllSavedJobss {
  String message;
  String status;
  List<SavedJobs> savedJobs;

  AllSavedJobss({this.message, this.status, this.savedJobs});

  AllSavedJobss.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['Saved_Jobs'] != null) {
      savedJobs = new List<SavedJobs>();
      json['Saved_Jobs'].forEach((v) {
        savedJobs.add(new SavedJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.savedJobs != null) {
      data['Saved_Jobs'] = this.savedJobs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SavedJobs {
  String jobId;
  String id;
  String title;
  String jobType;
  String description;
  String name;
  String createdDate;
  String companyName;
  String companyLogo;
  String minSalary;
  String maxSalary;
  String skills;
  String city;
  String employerid;
  String Type;
  SavedJobs(
      {this.jobId,
        this.id,
        this.title,
        this.jobType,
        this.description,
        this.name,
        this.createdDate,
        this.companyName,
        this.companyLogo,
        this.minSalary,
        this.maxSalary,
        this.skills,this.city,this.employerid,this.Type});

  SavedJobs.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    id = json['id'];
    title = json['title'];
    jobType = json['job_type'];
    description = json['description'];
    name = json['name'];
    createdDate = json['created date'];
    companyName = json['company_name'];
    companyLogo = json['company_logo'];
    minSalary = json['min_salary'];
    maxSalary = json['max_salary'];
    skills = json['skills'];
    city = json['name'];
    employerid = json['employer_id'];
    Type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['job_type'] = this.jobType;
    data['description'] = this.description;
    data['name'] = this.name;
    data['created date'] = this.createdDate;
    data['company_name'] = this.companyName;
    data['company_logo'] = this.companyLogo;
    data['min_salary'] = this.minSalary;
    data['max_salary'] = this.maxSalary;
    data['skills'] = this.skills;
    data['type'] = this.Type;
    return data;
  }
}