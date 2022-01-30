// import 'package:flutter/material.dart';
// import 'package:qjobs/model/jobshot.dart';
// import 'package:qjobs/utils/size_config.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class JobDetailsPage extends StatefulWidget {
//   final JobsHot jobsHot;
//
//   JobDetailsPage({this.jobsHot});
//
//   @override
//   _JobDetailsPageState createState() => _JobDetailsPageState();
// }
//
// class _JobDetailsPageState extends State<JobDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     final topContentText = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0, top: 10.0),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Image(
//                   width: 100.0,
//                   height: 100.0,
//                   image: AssetImage(widget.jobsHot.image),
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     widget.jobsHot.companyName,
//                     style: TextStyle(color: Colors.white, fontSize: 25.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: SizeConfig.screenWidth,
//           child: new Divider(color: Colors.blueGrey),
//         ),
//         SizedBox(height: 10.0),
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: Text(
//             widget.jobsHot.title,
//             style: TextStyle(color: Colors.white, fontSize: 25.0),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '💲 Salary:',
//                       style: TextStyle(
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white),
//                     ),
//                     Text(
//                       widget.jobsHot.salary,
//                       style: TextStyle(fontSize: 15.0, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       '👥 Vacancies:',
//                       style: TextStyle(
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white),
//                     ),
//                     Text(
//                       widget.jobsHot.vacancies,
//                       style: TextStyle(fontSize: 15.0, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '🎓 Education:',
//                       style: TextStyle(
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white),
//                     ),
//                     Text(
//                       widget.jobsHot.education,
//                       style: TextStyle(fontSize: 15.0, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '📍 Location:',
//                       style: TextStyle(
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white),
//                     ),
//                     Text(
//                       widget.jobsHot.location,
//                       style: TextStyle(fontSize: 15.0, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//
//     final topContent = Stack(
//       children: <Widget>[
//         Container(
//           height: MediaQuery.of(context).size.height * 0.6,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(color: Colors.red[200]),
//           child: Center(
//             child: topContentText,
//           ),
//         ),
//       ],
//     );
//
//     final bottomContentText = Padding(
//         padding: EdgeInsets.all(25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "Job Information",
//               style: TextStyle(fontSize: 25.0),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top:10.0),
//                   child: Text(
//                     "Job Descrption / Responsibility",
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom:10.0),
//                   child: Container(
//                     width: 250.0,
//                     child: new Divider(color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//                 Text(
//                   widget.jobsHot.responsibility,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top:10.0),
//                   child: Text(
//                     "Job Requirements",
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom:10.0),
//                   child: Container(
//                     width: 250.0,
//                     child: new Divider(color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//                 Text(
//                   widget.jobsHot.requirement,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top:10.0),
//                   child: Text(
//                     "Salary and Compensation",
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom:10.0),
//                   child: Container(
//                     width: 250.0,
//                     child: new Divider(color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//                 Text(
//                   widget.jobsHot.salaryBreakdown,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ],
//             ),
//           ],
//         ),
//     );
//
//     return Scaffold(
//       appBar: header(context, titleText: 'Job Details'),
//       body: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         child: Column(
//           children: <Widget>[topContent, bottomContentText],
//         ),
//       ),
//     );
//   }
// }
