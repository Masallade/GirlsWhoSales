import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';

import '../model/notification_model.dart';



class DescriptionTab extends StatelessWidget {

  final Job data;
  final JobDetails jobDetails;
  final String userId;
  DescriptionTab({this.jobDetails ,this.userId ,this.data});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
       SizedBox(height: 30.0),
        Text(
          '${jobDetails.description ?? " "}',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
       // SizedBox(height: 15.0),

      ],
    );
  }
}

class DescriptionTabtwo extends StatelessWidget {
  final FavoriteJobs favoriteJobs;
  final Job data;
  final JobDetails jobDetails;
  final  user_Id;
  DescriptionTabtwo({this.favoriteJobs,this.data ,this.jobDetails ,this.user_Id});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 30.0),
        Text(
          '${favoriteJobs.description ?? " "}',
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


class DescriptionTabthree extends StatelessWidget {
  final SavedJobs savedJobs;
  final  user_Id;
  DescriptionTabthree({this.savedJobs,this.user_Id});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // SizedBox(height: 25.0),
        // Text(
        //   '\Positions Available: ${favoriteJobs.}',
        //   style: subtitleStyle,
        // ),
        SizedBox(height: 25.0),
        Text(
          '${ savedJobs.description ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 15.0),

      ],
    );
  }
}

class DescriptionTabFour extends StatelessWidget {

  final Job data;
  final SearchModel jobList;
  //final JobDetails jobDetails;
  final String userId;
  DescriptionTabFour({this.jobList ,this.userId ,this.data});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 30.0),
        Text(
          '${jobList.description ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        // SizedBox(height: 15.0),

      ],
    );
  }
}

class DescriptionTabFive extends StatelessWidget {

  final AppliedJobDetails appliedJobDetails;
  final String userId;
  DescriptionTabFive({this.appliedJobDetails ,this.userId});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 30.0),
        Text(
          '${appliedJobDetails.description ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        // SizedBox(height: 15.0),

      ],
    );
  }
}

class NotificationDesc extends StatelessWidget {

  final NotificationsDetails notificationsDetail;
  final String userId;
  NotificationDesc({this.notificationsDetail ,this.userId});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 30.0),
        Text(
          '${notificationsDetail.description ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),
        ),
        // SizedBox(height: 15.0),

      ],
    );
  }
}