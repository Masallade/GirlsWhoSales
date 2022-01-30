import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';



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