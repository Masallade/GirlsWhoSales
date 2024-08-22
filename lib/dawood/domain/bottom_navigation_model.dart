import 'package:girlzwhosell/model/PushNotificationMessage%20_model.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/login_model.dart';

class CurrentUserDetails{
  final uName;
  final password;
  final user_Id;
  final cookiee;
  final firstName;
  String? nationality;
  String? title;
  String? phoneno;
  String? profile;
  String? email;
  String? location;
  String? Location;
  String? cv;
  String? resumee;
  final String? total_applied;
  final String? total_saved;
  final jobId;
  final city;
  List<JobDetails>? jobDetails;
  final List<FavoriteJobs>? favoriteJobs;
  final List<SeekerDetails>? userDetails;
  String? token1;
  PushNotificationMessage? notificationInfo;
  List<SavedJobs>? savedJobs;

  CurrentUserDetails(
      {this.uName,
        this.password,
        this.user_Id,
        this.cookiee,
        this.jobId,
        this.jobDetails,
        this.nationality,
        this.favoriteJobs,
        this.userDetails,
        this.firstName,
        this.title,
        this.phoneno,
        this.profile,
        this.email,
        this.cv,
        this.resumee,
        this.total_applied,
        this.total_saved,
        this.city,
        this.token1});
}