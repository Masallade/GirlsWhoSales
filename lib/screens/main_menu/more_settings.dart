// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:qjobs/screens/main_menu/more/contractual_jobs.dart';
// import 'package:qjobs/screens/main_menu/more/deadline_tomorrow.dart';
// import 'package:qjobs/screens/main_menu/more/email_resume.dart';
// import 'package:qjobs/screens/main_menu/more/general_search.dart';
// import 'package:qjobs/screens/main_menu/more/applied_jobs.dart';
// import 'package:qjobs/screens/main_menu/more/favourite_search.dart';
// import 'package:qjobs/screens/main_menu/more/followed_employers.dart';
// import 'package:qjobs/screens/main_menu/more/followed_jobs.dart';
// import 'package:qjobs/screens/main_menu/more/goverment_jobs.dart';
// import 'package:qjobs/screens/main_menu/more/interview_invitation.dart';
// import 'package:qjobs/screens/main_menu/more/job_application_guideline.dart';
// import 'package:qjobs/screens/main_menu/more/new_jobs.dart';
// import 'package:qjobs/screens/main_menu/more/part_time_job.dart';
// import 'package:qjobs/screens/main_menu/more/setting_details/settings.dart';
// import 'package:qjobs/screens/main_menu/more/upcoming_training_list.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/widgets/header.dart';
// import 'package:qjobs/widgets/others.dart';
//
// import 'more/employer_view_resume.dart';
//
// class MoreSettings extends StatefulWidget {
//   @override
//   _MoreSettingsState createState() => _MoreSettingsState();
// }
//
// class _MoreSettingsState extends State<MoreSettings> {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: header(context, titleText: 'More'),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             SizedBox(
//               height: 180.0,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Container(
//                     width: 100.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           width: 100.0,
//                           child: new RawMaterialButton(
//                             onPressed: ()=> onAlertWithCustomContentPressed(context),
//                             child: new Icon(
//                               FontAwesomeIcons.cog,
//                               color: Colors.white,
//                               size: 35.0,
//                             ),
//                             shape: new CircleBorder(),
//                             elevation: 2.0,
//                             //fillColor: Color(0XFF2EDB81),
//                             fillColor: kAccentColor,
//                             padding: const EdgeInsets.all(15.0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0, left: 20.0),
//                           child: Text(
//                             'Manage Resume',
//                             textDirection: TextDirection.ltr,
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 100.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           width: 100.0,
//                           child: new RawMaterialButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => AppliedJobs()));
//                             },
//                             child: new Icon(
//                               FontAwesomeIcons.stickyNote,
//                               color: Colors.white,
//                               size: 35.0,
//                             ),
//                             shape: new CircleBorder(),
//                             elevation: 2.0,
//                             //fillColor: Color(0XFF196DC3),
//                             fillColor: kAccentColor,
//                             padding: const EdgeInsets.all(15.0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0, left: 20.0),
//                           child: Text(
//                             'Applied Jobs',
//                             textDirection: TextDirection.ltr,
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.black , fontWeight: FontWeight.w200) ,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 100.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           width: 100.0,
//                           child: new RawMaterialButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => FavouriteSearch()));
//                             },
//                             child: new Icon(
//                               FontAwesomeIcons.bookmark,
//                               color: Colors.white,
//                               size: 35.0,
//                             ),
//                             shape: new CircleBorder(),
//                             elevation: 2.0,
//                            // fillColor: Color(0XFFEE4D43),
//                            fillColor: kAccentColor,
//                             padding: const EdgeInsets.all(15.0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0, left: 20.0),
//                           child: Text(
//                             'Favorites Search',
//                             textDirection: TextDirection.ltr,
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 100.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           width: 100.0,
//                           child: new RawMaterialButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => FollowedEmployers()));
//                             },
//                             child: new Icon(
//                               FontAwesomeIcons.userPlus,
//                               color: Colors.white,
//                               size: 35.0,
//                             ),
//                             shape: new CircleBorder(),
//                             elevation: 2.0,
//                            // fillColor: Color(0XFF485867),
//                            fillColor: kAccentColor,
//                             padding: const EdgeInsets.all(15.0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0, left: 20.0),
//                           child: Text(
//                             'Followed Employers',
//                             textDirection: TextDirection.ltr,
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 100.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           width: 100.0,
//                           child: new RawMaterialButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => FollowedJobs()));
//                             },
//                             child: new Icon(
//                               FontAwesomeIcons.fire,
//                               color: Colors.white,
//                               size: 35.0,
//                             ),
//                             shape: new CircleBorder(),
//                             elevation: 2.0,
//                            // fillColor: Colors.red,
//                             fillColor: kAccentColor,
//                             padding: const EdgeInsets.all(15.0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0, left: 20.0),
//                           child: Text(
//                             'Followed Jobs',
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 360.0,
//               child: Row(children: <Widget>[
//                 Expanded(
//                   child: Divider(
//                     thickness: 2.0,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(" Job Search "),
//                 Expanded(
//                   child: Divider(
//                     thickness: 2.0,
//                     color: Colors.black,
//                   ),
//                 ),
//               ]),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>JobSearchSecond()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.search ,color: kAccentColor),
//                 title: Text('General Search',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>NewJobs()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.briefcase ,color: kAccentColor),
//                 title: Text('New Jobs (24hrs)',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DeadlineTomorrow()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.hourglass ,color: kAccentColor),
//                 title: Text('Deadline Tomorrow',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PartTimeJobs()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.businessTime,color: kAccentColor),
//                 title: Text('Part Time Job',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractualJobs()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.fileContract,color: kAccentColor),
//                 title: Text('Contractual Jobs',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             // GestureDetector(
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (context)=>GovernmentJobs()));
//             //   },
//             //   child: ListTile(
//             //     leading: Icon(FontAwesomeIcons.globe,color: kAccentColor),
//             //     title: Text('Government Jobs',style:
//             //     TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//             //   ),
//             // ),
//             Container(
//               width: 360.0,
//               child: Divider(
//                 thickness: 2.0,
//                 color: Colors.black,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>NewJobs()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.userClock,color: kAccentColor),
//                 title: Text('Job Application Deadline',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>TimesEmailResume()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.mailBulk,color: kAccentColor),
//                 title: Text('Emailed Resume',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployerViewResume()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.eye,color: kAccentColor),
//                 title: Text('Employer Viewed Resume',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>InterviewInvitation()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.handshake,color: kAccentColor),
//                 title: Text('Interview Invitation',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainingList()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.chalkboardTeacher,color: kAccentColor),
//                 title: Text('Upcoming Training',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.cogs,color: kAccentColor),
//                 title: Text('Settings',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             Container(
//               width: 360.0,
//               child: Divider(
//                 thickness: 2.0,
//                 color: Colors.black,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplicationGuideline()));
//               },
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.infoCircle,color: kAccentColor),
//                 title: Text('App Guides',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap:(){},
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.star,color: kAccentColor),
//                 title: Text('Rate Us on Google Play Store',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//             onTap:(){},
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.inbox,color: kAccentColor),
//                 title: Text('Feedback and Support',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.lock,color: kAccentColor),
//                 title: Text('Privacy Policy',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(FontAwesomeIcons.solidStickyNote , color: kAccentColor,),
//                 title: Text('Terms and Policies',style:
//                 TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.w200),),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
