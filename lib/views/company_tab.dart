import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/constants2.dart';


class CompanyTab extends StatelessWidget {
  final Job data;
  final JobDetails jobDetails;
  final String userId;
//  final Company company;
  CompanyTab({this.jobDetails,this.data,this.userId});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey[300].withOpacity(0.6),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            leading:
            Container(
                width: 50.0,
                height: 50.0,
                child: Image.network('${jobDetails.companyLogo == null ? '' : jobDetails.companyLogo }')
            ),
            title: Text('${jobDetails.title ?? " "}' ,style:  TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.w700,
            ),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6.5),
              child: Row(
                children: [
                  Image.asset('assets/images/location.png'),
                  SizedBox(width: 10,),
                  Text('${jobDetails.location ?? " "}', style: TextStyle(
                    fontFamily: 'Questrial',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey[300],
                    fontSize: 14.0,
                    //fontWeight: FontWeight.w700,
                  ),)
                ],

              ),
            ),
            trailing: Column(
              children: [
                Icon(Icons.star_border_purple500_sharp),
                SizedBox(height: 2,),
                Text('View Rating' , style: subtitleStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CompanyTabtwo extends StatelessWidget {
  final FavoriteJobs favoriteJobs;
  final  user_Id;

//  final Company company;
  CompanyTabtwo({this.favoriteJobs,this.user_Id});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey[300].withOpacity(0.6),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
           leading: Container(
                width: 50.0,
                height: 50.0,
                child: Image.network('${favoriteJobs.companyLogo ?? " "}')
            ),
            title: Text(favoriteJobs.title ?? " " ,
              style:TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.w700,
            ),),
            subtitle: Row(
              children: [
                Image.asset('assets/images/location.png'),
                SizedBox(width: 10,),
                Text('${favoriteJobs.name ?? " "}' , style: TextStyle(
                  fontFamily: 'Questrial',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey[300],
                  fontSize: 14.0,
                  //fontWeight: FontWeight.w700,
                ))
              ],

            ),
            trailing: Column(
              children: [
                Icon(Icons.star_border_purple500_sharp),
                SizedBox(height: 2,),
                Text('View Rating' , style: subtitleStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CompanyTabthree extends StatelessWidget {
  final SavedJobs savedJobs;
  final  user_Id;


//  final Company company;
  CompanyTabthree({this.savedJobs,this.user_Id});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child : Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey[300],
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            leading: Container(
                width: 50.0,
                height: 50.0,
                child: Image.network('${savedJobs.companyLogo ?? " "}')
            ),
            title: Text(savedJobs.title ?? " "),
            subtitle: Row(
              children: [
                Image.asset('assets/images/location.png'),
                SizedBox(width: 5,),
                Text('${savedJobs.name   ?? " "}')
              ],

            ),
            trailing: Column(
              children: [
                Icon(Icons.star_border_purple500_sharp),
                SizedBox(height: 2,),
                Text('View Rating' , style: subtitleStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}