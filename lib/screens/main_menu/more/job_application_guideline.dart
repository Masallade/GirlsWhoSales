// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class ApplicationGuideline extends StatefulWidget {
//   @override
//   _ApplicationGuidelineState createState() => _ApplicationGuidelineState();
// }
//
// class _ApplicationGuidelineState extends State<ApplicationGuideline> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: header2(
//         context,
//         titleText: "App Guidelines",
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: double.maxFinite,
//               color: Theme.of(context).primaryColor,
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: 300.0,
//                     height: 140.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: Text(
//                             'Here you can get a guideline of job application. '
//                             'How to apply effectively to increase your chance to getnoticed by your desired Employer',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         Positioned(
//                           top: 100.0,
//                           left: 120.0,
//                           child: Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//                               ),
//                               width: 50.0,height: 50.0,
//                               child: Icon(
//                                 Icons.arrow_downward,color: Colors.black,size: 30.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             PageTitle(
//               titleText: 'How it works',
//               fontSize: 16.0,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                   child: Text(
//                     'i. Job seeker of JobPortal can apply for a'
//                     ' limited number of circulars every month.',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                   child: Text(
//                     'ii. Validity period of application limit is 100 jobs per month.',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'iii. It is set to be renwed every month.',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                   child: Text(
//                     'iv. Unused "Application Volume" will not be carried'
//                     ' forword to the next month.',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             PageTitle(
//               titleText: 'Usage guide to effective online application',
//               fontSize: 16.0,
//             ),
//             ListTile(
//               leading: Icon(Icons.cloud_done, color: Colors.pink),
//               title: Text('Step 1', style: TextStyle(color: Colors.pink)),
//               subtitle: Text(
//                 'Update Resume',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Colors.black),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 68.0, right: 10.0),
//               child: Text(
//                 'Update your resume when it is necessary. Remember, your'
//                 'resume represents you to employer. So always keep it up to date.',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.description, color: Colors.blueAccent),
//               title: Text('Step 2', style: TextStyle(color: Colors.blueAccent)),
//               subtitle: Text(
//                 'Matching Job Requirements',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Colors.black),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 68.0, right: 10.0),
//               child: Text(
//                 'Applicant should look for a job tha match skill set. Read carefully '
//                 'educational and job details for example Job Responsibilities'
//                 ', Educational and Experience.',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             ListTile(
//               leading:
//                   Icon(Icons.phone_in_talk, color: Colors.deepOrangeAccent),
//               title: Text('Step 1',
//                   style: TextStyle(color: Colors.deepOrangeAccent)),
//               subtitle: Text(
//                 'Increase InterView Calls',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Colors.black),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 68.0, bottom: 20.0, right: 10.0),
//               child: Text(
//                 "It's always better and good practice to go through whole job"
//                 " requirements for a better understanding regerding the"
//                 " position and your relivence.",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
