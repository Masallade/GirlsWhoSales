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
  final String location;
  final String Location;
  //final List<SearchModel >joblist =[];
  JobSearchSecond({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId ,this.location,this.Location});
  @override
  _JobSearchSecondState createState() => _JobSearchSecondState(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId ,location: location ,Location: Location);
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
  String location;
  String Location;

  _JobSearchSecondState({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId,this.location,this.Location});
  List<SearchModel >joblist =[];
  List<SearchModel >locationlist =[];


void initState(){
  super.initState();
  setState(() {
    location;
    Location;
  });
 print('Updated value ${ location}');
  print('Updated value ${ Location}');
 init();
  //initTwo();
}

Future init() async{
  final search = await Requests.getSearch(location);
  setState(()=> joblist = search);
}
  // Future initTwo() async{
  //   final search = await Requests.getSearchTwo(Location);
  //   setState(()=> locationlist = search);
  // }
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
              child: Column(
            children: [
              buildSearch(),
              buildSearch2(),
            ],
          )),

          Expanded(
            child:  ListView.builder(
                itemCount: joblist?.length,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailOne(uName:uName,password: password,joblist: joblist[index],
                              userDetails: userDetails,user_Id:user_Id, firstName: firstName,
                              appliedStatus:jobAppliedDetailModel.applied,jobid: jobId)));
                      },
                      child: Column(
                        children: [
                          buildList(joblist[index]),
                        //  buildListLocation(locationlist[index])
                        ],
                      ));
                }),
          ),
          // Expanded(
          //   child: locationlist.length == null ? Container() : ListView.builder(
          //       itemCount: locationlist?.length,
          //       itemBuilder: (context, index){
          //         return InkWell(
          //             onTap: (){
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => JobDetail(uName:uName,password: password,jobDetails: jobDetails[index],
          //                           userDetails: userDetails,user_Id:user_Id, firstName: firstName,
          //                           appliedStatus:jobAppliedDetailModel.applied,jobid: jobId)));
          //             },
          //             child: Column(
          //               children: [
          //                 buildList(joblist[index]),
          //                 buildListLocation(locationlist[index])
          //               ],
          //             ));
          //       }),
          // ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(

    text: location,
    hintText: location == null ? '' : location,
    onChanged: searchData,
  );
  Widget buildSearch2() => SearchWidgettwo(
    text: Location,
    hintText: Location == null ? '' : Location,
    onChanged: searchData,
  );

  Future searchData(String query) async{
    final search = await Requests.getSearch(query);
    if(!mounted ) return;
    location = Location;
    setState(() {
      Location = query;
      location =query;
      joblist = search;
    });

  }

  Future searchLocation(String query) async{
    final search = await Requests.getSearchTwo(query);
    if(!mounted ) return;
    setState(() {
      Location =query;
      joblist = search;
    });

  }

  Widget buildList(SearchModel jobslist)=>Padding(
    padding: const EdgeInsets.only( top: 20,left: 12.0 , right: 12.0),
    child: Card(
      borderOnForeground: true,
      elevation: 1.0,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          child: Image.network(
          jobslist.companyLogo,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
      ),
        ),
        title: Align(
            alignment: Alignment.center,
            child: Text(jobslist.title ?? " " , style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: Colors.blue[800],
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
  // Widget buildListLocation(SearchModel locationlist)=>Padding(
  //   padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
  //   child: Container(
  //     color: Colors.yellow,
  //     child: Card(
  //       borderOnForeground: true,
  //       elevation: 1.0,
  //       child: ListTile(
  //         leading: Image.network(
  //           locationlist.logo,
  //           fit: BoxFit.cover,
  //           width: 50,
  //           height: 50,
  //         ),
  //         title: Align(
  //             alignment: Alignment.center,
  //             child: Text(locationlist.title ?? " " , style: TextStyle(
  //               fontFamily: 'Poppins',
  //               fontStyle: FontStyle.normal,
  //               fontWeight: FontWeight.w500,
  //               color: Colors.black,
  //               fontSize: 16.0,
  //               //fontWeight: FontWeight.w700,
  //             ),)),
  //         subtitle: Column(
  //           children: [
  //             Text('${locationlist.experience ?? " "}' ,style: TextStyle(
  //               fontFamily: 'Questrial',
  //               fontStyle: FontStyle.normal,
  //               fontWeight: FontWeight.w400,
  //               color: Colors.blueGrey,
  //               fontSize: 14.0,
  //               //fontWeight: FontWeight.w700,
  //             ),),
  //             SizedBox(height: 10,),
  //             Text('${locationlist.location ?? " "}' ,style: TextStyle(
  //               fontFamily: 'Questrial',
  //               fontStyle: FontStyle.normal,
  //               fontWeight: FontWeight.w400,
  //               color: Colors.blueGrey,
  //               fontSize: 14.0,
  //               //fontWeight: FontWeight.w700,
  //             ),),
  //             SizedBox(height: 10,),
  //             Text('\$${locationlist.minSalary ?? " " + locationlist.maxSalary ?? " "}' , style: TextStyle(
  //               fontFamily: 'Questrial',
  //               fontStyle: FontStyle.normal,
  //               fontWeight: FontWeight.w400,
  //               color: Colors.blueGrey,
  //               fontSize: 14.0,
  //               //fontWeight: FontWeight.w700,
  //             ),),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );


  }




// import 'package:flutter/material.dart';
// import 'package:girlzwhosell/http/Requests.dart';
// import 'package:girlzwhosell/model/login_model.dart';
// import 'package:girlzwhosell/model/search_model.dart';
// import 'package:girlzwhosell/new_widgets/search_widget.dart';
// import 'package:girlzwhosell/utils/constants.dart';
// import 'package:girlzwhosell/views/job_detail.dart';
//
//
//
//
// class JobSearchSecond extends StatefulWidget {
//
//
//   final uName;
//   final password;
//   final user_Id;
//   final String firstName;
// //  final cookiee;
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//   final List<SeekerDetails> userDetails;
//   final jobId;
//   JobSearchSecond({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId});
//   @override
//   _JobSearchSecondState createState() => _JobSearchSecondState(uName: uName,password: password,user_Id: user_Id,firstName: firstName, jobDetails: jobDetails ,favoriteJobs: favoriteJobs,userDetails: userDetails,jobId: jobId);
// }
//
// class _JobSearchSecondState extends State<JobSearchSecond> {
//
//
//
//   final uName;
//   final password;
//   final user_Id;
//   final String firstName;
// //  final cookiee;
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//   final List<SeekerDetails> userDetails;
//   final jobId;
//
//   _JobSearchSecondState({this.uName,this.password,this.user_Id, this.firstName, this.jobDetails,this.favoriteJobs,this.userDetails ,this.jobId});
//
//
//   String location = '';
//   List<SearchModel >joblist =[];
//
//   void initState(){
//     super.initState();
//     init();
//   }
//
//   Future init() async{
//     final search = await Requests.getSearch(location);
//     setState(()=> this.joblist = search);
//   }
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Colors.pinkAccent[200],
//         leading: InkWell(
//             onTap: (){
//               Navigator.of(context).pop();
//             },
//             child: Icon(Icons.arrow_back_ios ,color: Colors.white,)),
//         title: Text("Results" ,
//           style: TextStyle(
//               fontFamily: 'Poppins' ,
//               fontSize: 20 ,
//               fontWeight: FontWeight.w500),),
//       ),
//       body: Column(
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                   color: Colors.pinkAccent[200],
//                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
//               child: Column(
//                 children: [
//                   buildSearch(),
//                   buildSearch2(),
//                 ],
//               )),
//
//           Expanded(
//             child: ListView.builder(
//                 itemCount: joblist.length,
//                 itemBuilder: (context , index){
//                   return GestureDetector(
//                       onTap: (){
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => JobDetail(uName:uName,password: password,  jobDetails: jobDetails[index], userDetails: userDetails,user_Id:user_Id, firstName: firstName,appliedStatus:jobAppliedDetailModel.applied,jobid: jobId,),
//                           ),);
//                       },
//                       child: buildList(joblist[index]));
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSearch() => SearchWidget(
//     text: location,
//     hintText: 'Job Title',
//     onChanged: searchData,
//   );
//   Widget buildSearch2() => SearchWidgettwo(
//     text: location,
//     hintText: 'Location',
//     onChanged: searchData,
//   );
//
//   Future searchData(String query) async{
//     final search = await Requests.getSearch(query);
//     if( !mounted ) return;
//     setState(() {
//       this.location =query;
//       this.joblist = search;
//     });
//
//   }
//
//   Widget buildList(SearchModel jobslist)=>Padding(
//     padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
//     child: Card(
//       child: ListTile(
//         leading: Image.network(
//           jobslist.logo,
//           fit: BoxFit.cover,
//           width: 50,
//           height: 50,
//         ),
//         title: Align(
//             alignment: Alignment.center,
//             child: Text(jobslist.title ?? " " , style: TextStyle(
//               fontFamily: 'Poppins',
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//               fontSize: 16.0,
//               //fontWeight: FontWeight.w700,
//             ),)),
//         subtitle: Column(
//           children: [
//             Text('${jobslist.experience ?? " "}' ,style: TextStyle(
//               fontFamily: 'Questrial',
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w400,
//               color: Colors.blueGrey,
//               fontSize: 14.0,
//               //fontWeight: FontWeight.w700,
//             ),),
//             SizedBox(height: 10,),
//             Text('${jobslist.location ?? " "}' ,style: TextStyle(
//               fontFamily: 'Questrial',
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w400,
//               color: Colors.blueGrey,
//               fontSize: 14.0,
//               //fontWeight: FontWeight.w700,
//             ),),
//             SizedBox(height: 10,),
//             Text('\$${jobslist.minSalary ?? " " + jobslist.maxSalary ?? " "}' , style: TextStyle(
//               fontFamily: 'Questrial',
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w400,
//               color: Colors.blueGrey,
//               fontSize: 14.0,
//               //fontWeight: FontWeight.w700,
//             ),),
//           ],
//         ),
//       ),
//     ),
//   );
//
//
// }