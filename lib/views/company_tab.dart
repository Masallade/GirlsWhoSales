import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/notification_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:url_launcher/url_launcher.dart';


class CompanyTab extends StatefulWidget {
  final Job data;
  final JobDetails jobDetails;
  final String userId;
  CompanyTab({this.jobDetails,this.data,this.userId});

  @override
  State<CompanyTab> createState() => _CompanyTabState();
}
class _CompanyTabState extends State<CompanyTab> {
  //bool _hasCallSupport = false;
  Future<void> launched;


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    String url = widget.jobDetails.url;
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InkWell(
          onTap:() => setState(() {
            launched = _launchInBrowser(url);
          }),
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
                  child: Image.network('${widget.jobDetails.companyLogo == null ? Placeholder() : widget.jobDetails.companyLogo }')
              ),
              title: Text('${widget.jobDetails.title ?? " "}' ,style:  TextStyle(
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
                    Text('${widget.jobDetails.location ?? " "}', style: TextStyle(
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
      ),
    );
  }
}


class CompanyTabtwo extends StatefulWidget {
  final FavoriteJobs favoriteJobs;
  final  user_Id;

//  final Company company;
  CompanyTabtwo({this.favoriteJobs,this.user_Id});

  @override
  State<CompanyTabtwo> createState() => _CompanyTabtwoState();
}

class _CompanyTabtwoState extends State<CompanyTabtwo> {

  Future<void> launched;


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    String url = widget.favoriteJobs.url;
    return SingleChildScrollView(
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InkWell(
          onTap:() => setState(() {
            launched = _launchInBrowser(url);
          }),
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
                  child: Image.network('${widget.favoriteJobs.companyLogo ?? " "}')
              ),
              title: Text(widget.favoriteJobs.title ?? " " ,
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
                  Text('${widget.favoriteJobs.name ?? " "}' , style: TextStyle(
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
      ),
    );
  }
}


class CompanyTabthree extends StatefulWidget {
  final SavedJobs savedJobs;
  final  user_Id;


//  final Company company;
  CompanyTabthree({this.savedJobs,this.user_Id});

  @override
  State<CompanyTabthree> createState() => _CompanyTabthreeState();
}

class _CompanyTabthreeState extends State<CompanyTabthree> {
  Future<void> launched;


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    String url = widget.savedJobs.url;
    return SingleChildScrollView(
      child : Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          onTap:() => setState(() {
            launched = _launchInBrowser(url);
          }),
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
                  child: Image.network('${widget.savedJobs.companyLogo ?? " "}')
              ),
              title: Text(widget.savedJobs.title ?? " "),
              subtitle: Row(
                children: [
                  Image.asset('assets/images/location.png'),
                  SizedBox(width: 5,),
                  Text('${widget.savedJobs.name   ?? " "}')
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
      ),
    );
  }
}


class CompanyTabFour extends StatefulWidget {
  final Job data;
  final SearchModel jobList;
  final String userId;
//  final Company company;
  CompanyTabFour({this.jobList,this.data,this.userId});

  @override
  State<CompanyTabFour> createState() => _CompanyTabFourState();
}

class _CompanyTabFourState extends State<CompanyTabFour> {
  Future<void> launched;


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.jobList.url;
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InkWell(
          onTap:() => setState(() {
            launched = _launchInBrowser(url);
          }),
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
                  child: Image.network('${widget.jobList.companyLogo == null ? null : widget.jobList.companyLogo }')
              ),
              title: Text('${widget.jobList.title ?? " "}' ,style:  TextStyle(
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
                    Text('${widget.jobList.location ?? " "}', style: TextStyle(
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
      ),
    );
  }
}


class CompanyTabFive extends StatefulWidget {
  final AppliedJobDetails appliedJobDetails;
  final String userId;
//  final Company company;
  CompanyTabFive({this.appliedJobDetails,this.userId});

  @override
  State<CompanyTabFive> createState() => _CompanyTabFiveState();
}

class _CompanyTabFiveState extends State<CompanyTabFive> {
  Future<void> launched;


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.appliedJobDetails.url;
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InkWell(
          onTap:() => setState(() {
            launched = _launchInBrowser(url);
          }),
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
                  child: Image.network('${widget.appliedJobDetails.companyLogo == null ? null : widget.appliedJobDetails.companyLogo }')
              ),
              title: Text('${widget.appliedJobDetails.title ?? " "}' ,style:  TextStyle(
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
                    Text('${widget.appliedJobDetails.location ?? " "}', style: TextStyle(
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
      ),
    );
  }
}



class NotificationUrl extends StatefulWidget {
  final NotificationsDetails notificationsDetail;
  final String userId;
//  final Company company;
  NotificationUrl({this.notificationsDetail,this.userId});

  @override
  State<NotificationUrl> createState() => _NotificationUrlState();
}

class _NotificationUrlState extends State<NotificationUrl> {
  Future<void> launched;


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.notificationsDetail.url;
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child : Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InkWell(
          onTap:() => setState(() {
            launched = _launchInBrowser(url);
          }),
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
                  child: Image.network('${widget.notificationsDetail.companyLogo ?? Placeholder() }')
              ),
              title: Text('${widget.notificationsDetail.title ?? " "}' ,style:  TextStyle(
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
                    Text('${widget.notificationsDetail.city ?? " "}', style: TextStyle(
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
      ),
    );
  }
}