class Total_Saved_Job {
  String? message;
  String? status;
  String? countOfJobsSaved;
  String? countOfJobsApplied;

  Total_Saved_Job(
      {this.message,
        this.status,
        this.countOfJobsSaved,
        this.countOfJobsApplied});

  Total_Saved_Job.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    countOfJobsSaved = json['Count_of_Jobs_saved'];
    countOfJobsApplied = json['Count_of_Jobs_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['Count_of_Jobs_saved'] = this.countOfJobsSaved;
    data['Count_of_Jobs_applied'] = this.countOfJobsApplied;
    return data;
  }
}
