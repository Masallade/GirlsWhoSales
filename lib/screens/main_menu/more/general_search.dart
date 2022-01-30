import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/new_widgets/search_widget.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/views/job_detail.dart';




class JobSearchSecond extends StatefulWidget {


  final uName;
  final password;
  final user_Id;
  final String firstName;
//  final cookiee;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  JobSearchSecond({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId});
  @override
  _JobSearchSecondState createState() => _JobSearchSecondState(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId);
}

class _JobSearchSecondState extends State<JobSearchSecond> {



  final uName;
  final password;
  final user_Id;
  final String firstName;
//  final cookiee;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;

  _JobSearchSecondState({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId});

  String text;
  ValueChanged<String> onChanged;
  String location = '';
  List<SearchModel >joblist =[];

void initState(){
  super.initState();
  init();
}

Future init() async{
  final search = await Requests.getSearch(location);
  setState(()=> this.joblist = search);
}
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           centerTitle: true,
           elevation: 0.0,
           backgroundColor: Colors.pinkAccent[200],
           leading: InkWell(
             onTap: (){
               Navigator.of(context).pop();
             },
             child: Icon(Icons.arrow_back_ios ,color: Colors.white,)),
         title: Text("Results" ,
           style: TextStyle(
             fontFamily: 'Poppins' ,
             fontSize: 20 ,
             fontWeight: FontWeight.w500),),
         ),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent[200],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))              ),
              child: Column(
            children: [
              buildSearch(),
              buildSearch2(),
            ],
          )),

          Expanded(
            child: ListView.builder(
                itemCount: joblist.length,
                itemBuilder: (context , index){
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetail(uName:uName,password: password,  jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id, firstName: firstName,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
                          ),);
                      },
                      child: buildList(joblist[index]));
                }),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
    text: location,
    hintText: 'Job Title',
    onChanged: searchData,
  );
  Widget buildSearch2() => SearchWidgettwo(
    text: location,
    hintText: 'Location',
    onChanged: searchData,
  );

  Future searchData(String query) async{
    final search = await Requests.getSearch(query);
    if( !mounted ) return;
    setState(() {
      this.location =query;
      this.joblist = search;
    });

  }

  Widget buildList(SearchModel jobslist)=>Padding(
    padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
    child: Card(
      child: ListTile(
        leading: Image.network(
        jobslist.logo,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
        title: Align(
            alignment: Alignment.center,
            child: Text(jobslist.title ?? " " , style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.w700,
            ),)),
        subtitle: Column(
          children: [
            Text('${jobslist.experience ?? " "}' ,style: TextStyle(
              fontFamily: 'Questrial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
              fontSize: 14.0,
              //fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 10,),
            Text('${jobslist.location ?? " "}' ,style: TextStyle(
              fontFamily: 'Questrial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
              fontSize: 14.0,
              //fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 10,),
            Text('\$${jobslist.minSalary ?? " " + jobslist.maxSalary ?? " "}' , style: TextStyle(
              fontFamily: 'Questrial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
              fontSize: 14.0,
              //fontWeight: FontWeight.w700,
            ),),
          ],
        ),
      ),
    ),
  );


  }

