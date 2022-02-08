import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';


class RequirementsTab extends StatelessWidget {
  final Job data;
  final JobDetails jobDetails;
  final String userId;
  final FavoriteJobs favoriteJobs;
//  final Company company;
  RequirementsTab({this.jobDetails,this.data,this.userId,this.favoriteJobs});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
            '1. ${jobDetails.skills ?? " "}',
            style: TextStyle(
              fontFamily: 'Questrial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey[600],
              fontSize: 16.0,
              //fontWeight: FontWeight.w700,
            ),

        ),
      //  SizedBox(height: 5,),
        // Text(
        //   '2. ${jobDetails.skills ?? " "}',
        //   style: TextStyle(
        //     fontFamily: 'Questrial',
        //     fontStyle: FontStyle.normal,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.blueGrey[600],
        //     fontSize: 16.0,
        //     //fontWeight: FontWeight.w700,
        //   ),
        //
        // ),
      ],
    );
  }
}

class RequirementsTabtwo extends StatelessWidget {
  final FavoriteJobs favoriteJobs;
  final Job data;
  final JobDetails jobDetails;
  final  user_Id;
//  final Company company;
  RequirementsTabtwo({this.favoriteJobs, this.data,this.jobDetails,this.user_Id});
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
        SizedBox(height: 5,),
        // Text(
        //   '2. ${favoriteJobs.skills ?? " "}',
        //   style: TextStyle(
        //     fontFamily: 'Questrial',
        //     fontStyle: FontStyle.normal,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.blueGrey[600],
        //     fontSize: 16.0,
        //     //fontWeight: FontWeight.w700,
        //   ),
        //
        // ),
      ],
    );
  }
}



class RequirementsTabthree extends StatelessWidget {
  final SavedJobs savedJobs;
  final  user_Id;
//  final Company company;
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
  final Job data;
 final SearchModel jobList;
  // final JobDetails jobDetails;
  final String userId;
  final FavoriteJobs favoriteJobs;
//  final Company company;
  RequirementsTabFour({this.jobList,this.data,this.userId,this.favoriteJobs});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25.0),
        Text(
          '1. ${jobList.skills ?? " "}',
          style: TextStyle(
            fontFamily: 'Questrial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey[600],
            fontSize: 16.0,
            //fontWeight: FontWeight.w700,
          ),

        ),
        //  SizedBox(height: 5,),
        // Text(
        //   '2. ${jobDetails.skills ?? " "}',
        //   style: TextStyle(
        //     fontFamily: 'Questrial',
        //     fontStyle: FontStyle.normal,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.blueGrey[600],
        //     fontSize: 16.0,
        //     //fontWeight: FontWeight.w700,
        //   ),
        //
        // ),
      ],
    );
  }
}
