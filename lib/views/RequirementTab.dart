import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';


class RequirementsTab extends StatelessWidget {
  final JobDetails jobDetails;
  final String userId;
  RequirementsTab({this.jobDetails,this.userId});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
            '${jobDetails.skills ?? " "}',
            style: TextStyle(
              fontFamily: 'Questrial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey[600],
              fontSize: 16.0,
            ),

        ),
      ],
    );
  }
}
class RequirementsTabtwo extends StatelessWidget {
  final FavoriteJobs favoriteJobs;
  final  user_Id;
  RequirementsTabtwo({this.favoriteJobs,this.user_Id});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
          '${favoriteJobs.skills ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
class RequirementsTabthree extends StatelessWidget {
  final SavedJobs savedJobs;
  final  user_Id;
  RequirementsTabthree({this.savedJobs,this.user_Id});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
          '${savedJobs.skills ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
class RequirementsTabFour extends StatelessWidget {
  final SearchModel jobList;
  final String userId;
  RequirementsTabFour({this.jobList,this.userId});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
          '${jobList.skills ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
class RequirementsTabFive extends StatelessWidget {
  final String userId;
  final AppliedJobDetails appliedJobDetails;

  RequirementsTabFive({this.userId,this.appliedJobDetails});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
          '${appliedJobDetails.skills ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}