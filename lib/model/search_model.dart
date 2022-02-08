// class searchModel {
//   String status;
//   String message;
//   List<JobsList> jobsList;
//
//   searchModel({this.status, this.message, this.jobsList});
//
//   searchModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['Jobs List'] != null) {
//       jobsList = new List<JobsList>();
//       json['Jobs List'].forEach((v) {
//         jobsList.add(new JobsList.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.jobsList != null) {
//       data['Jobs List'] = this.jobsList.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class JobsList {
//   String id;
//   String employerId;
//   String title;
//   String description;
//   String minSalary;
//   String maxSalary;
//   String experience;
//   String skills;
//   String location;
//   String totalPositions;
//
//   JobsList(
//       {this.id,
//         this.employerId,
//         this.title,
//         this.description,
//         this.minSalary,
//         this.maxSalary,
//         this.experience,
//         this.skills,
//         this.location,
//         this.totalPositions});
//
//   JobsList.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     employerId = json['employer_id'];
//     title = json['title'];
//     description = json['description'];
//     minSalary = json['min_salary'];
//     maxSalary = json['max_salary'];
//     experience = json['experience'];
//     skills = json['skills'];
//     location = json['location'];
//     totalPositions = json['total_positions'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['employer_id'] = this.employerId;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['min_salary'] = this.minSalary;
//     data['max_salary'] = this.maxSalary;
//     data['experience'] = this.experience;
//     data['skills'] = this.skills;
//     data['location'] = this.location;
//     data['total_positions'] = this.totalPositions;
//     return data;
//   }
// }


// class SearchModel {
//   String id;
//   String employerId;
//   String title;
//   String description;
//   String minSalary;
//   String maxSalary;
//   String experience;
//   String skills;
//   String location;
//   String totalPositions;
//   String logo;
//   SearchModel(
//       {this.id,
//         this.employerId,
//         this.title,
//         this.description,
//         this.minSalary,
//         this.maxSalary,
//         this.experience,
//         this.skills,
//         this.location,
//         this.totalPositions,this.logo});
//
//   SearchModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     employerId = json['employer_id'];
//     title = json['title'];
//     description = json['description'];
//     minSalary = json['min_salary'];
//     maxSalary = json['max_salary'];
//     experience = json['experience'];
//     skills = json['skills'];
//     location = json['location'];
//     totalPositions = json['total_positions'];
//     logo = json['company_logo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['employer_id'] = this.employerId;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['min_salary'] = this.minSalary;
//     data['max_salary'] = this.maxSalary;
//     data['experience'] = this.experience;
//     data['skills'] = this.skills;
//     data['location'] = this.location;
//     data['total_positions'] = this.totalPositions;
//     data['company_logo'] = this.logo;
//     return data;
//   }
// }

class SearchModel {
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
  String requiredEducation;
  String companyLogo;
  String companyName;
  String jobType;
  String type;
  String expiryDate;
  String category;
  String url;

  SearchModel(
      {this.id,
        this.employerId,
        this.title,
        this.description,
        this.minSalary,
        this.maxSalary,
        this.experience,
        this.skills,
        this.location,
        this.totalPositions,
        this.requiredEducation,
        this.companyLogo,
        this.companyName,
        this.jobType,
        this.type,
        this.expiryDate,
        this.category,
        this.url});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
    requiredEducation = json['required_education'];
    companyLogo = json['company_logo'];
    companyName = json['company_name'];
    jobType = json['job_type'];
    type = json['type'];
    expiryDate = json['expiry_date'];
    category = json['category'];
    url = json['url'];
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
    data['required_education'] = this.requiredEducation;
    data['company_logo'] = this.companyLogo;
    data['company_name'] = this.companyName;
    data['job_type'] = this.jobType;
    data['type'] = this.type;
    data['expiry_date'] = this.expiryDate;
    data['category'] = this.category;
    data['url'] = this.url;
    return data;
  }
}