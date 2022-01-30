
class LoginModel {
  String message;
  String status;
  List<JobDetails> jobDetails;
  List<SeekerDetails> seekerDetails;
  List<FavoriteJobs> favoriteJobs;
  String countOfJobsSaved;
  String countOfJobsApplied;

  LoginModel(
      {this.message,
        this.status,
        this.jobDetails,
        this.seekerDetails,
        this.favoriteJobs,
        this.countOfJobsSaved,
        this.countOfJobsApplied});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['Job_details'] != null) {
      jobDetails = new List<JobDetails>();
      json['Job_details'].forEach((v) {
        jobDetails.add(new JobDetails.fromJson(v));
      });
    }
    if (json['Seeker_details'] != null) {
      seekerDetails = new List<SeekerDetails>();
      json['Seeker_details'].forEach((v) {
        seekerDetails.add(new SeekerDetails.fromJson(v));
      });
    }
    if (json['Favorite_Jobs'] != null) {
      favoriteJobs = new List<FavoriteJobs>();
      json['Favorite_Jobs'].forEach((v) {
        favoriteJobs.add(new FavoriteJobs.fromJson(v));
      });
    }
    countOfJobsSaved = json['Count_of_Jobs_saved'];
    countOfJobsApplied = json['Count_of_Jobs_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.jobDetails != null) {
      data['Job_details'] = this.jobDetails.map((v) => v.toJson()).toList();
    }
    if (this.seekerDetails != null) {
      data['Seeker_details'] =
          this.seekerDetails.map((v) => v.toJson()).toList();
    }
    if (this.favoriteJobs != null) {
      data['Favorite_Jobs'] = this.favoriteJobs.map((v) => v.toJson()).toList();
    }
    data['Count_of_Jobs_saved'] = this.countOfJobsSaved;
    data['Count_of_Jobs_applied'] = this.countOfJobsApplied;
    return data;
  }
}

class JobDetails {
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

  JobDetails(
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
        this.type});

  JobDetails.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class SeekerDetails {
  String id;
  String firstname;
  String lastname;
  String fatherName;
  String motherName;
  String email;
  String dob;
  String age;
  String profilePicture;
  String mobileNumber;
  String category;
  String jobTitle;
  String description;
  String maritalStatus;
  String country;
  String state;
  String city;
  String postcode;
  String address;
  String experience;
  String educationLevel;
  String skills;
  String currentSalary;
  String expectedSalary;
  String resume;
  String cV;

  SeekerDetails(
      {this.id,
        this.firstname,
        this.lastname,
        this.fatherName,
        this.motherName,
        this.email,
        this.dob,
        this.age,
        this.profilePicture,
        this.mobileNumber,
        this.category,
        this.jobTitle,
        this.description,
        this.maritalStatus,
        this.country,
        this.state,
        this.city,
        this.postcode,
        this.address,
        this.experience,
        this.educationLevel,
        this.skills,
        this.currentSalary,
        this.expectedSalary,
        this.resume,
        this.cV});

  SeekerDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    email = json['email'];
    dob = json['dob'];
    age = json['age'];
    profilePicture = json['profile_picture'];
    mobileNumber = json['mobile_number'];
    category = json['category'];
    jobTitle = json['job_title'];
    description = json['description'];
    maritalStatus = json['marital_status'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    address = json['address'];
    experience = json['experience'];
    educationLevel = json['education_level'];
    skills = json['skills'];
    currentSalary = json['current_salary'];
    expectedSalary = json['expected_salary'];
    resume = json['resume'];
    cV = json['CV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['profile_picture'] = this.profilePicture;
    data['mobile_number'] = this.mobileNumber;
    data['category'] = this.category;
    data['job_title'] = this.jobTitle;
    data['description'] = this.description;
    data['marital_status'] = this.maritalStatus;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['address'] = this.address;
    data['experience'] = this.experience;
    data['education_level'] = this.educationLevel;
    data['skills'] = this.skills;
    data['current_salary'] = this.currentSalary;
    data['expected_salary'] = this.expectedSalary;
    data['resume'] = this.resume;
    data['CV'] = this.cV;
    return data;
  }
}

class FavoriteJobs {
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
  String employerId;

  FavoriteJobs(
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
        this.skills,this.employerId});

  FavoriteJobs.fromJson(Map<String, dynamic> json) {
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
    employerId = json['employer_id'];
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
    data['employer_id'] = this.employerId;
    return data;
  }
}