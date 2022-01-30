// import 'package:flutter/material.dart';
// import 'package:qjobs/model/jobshot.dart';
//
// class InterviewInvitation extends StatefulWidget {
//   @override
//   _InterviewInvitationState createState() => _InterviewInvitationState();
// }
//
// class _InterviewInvitationState extends State<InterviewInvitation> {
//   List jobs;
//   @override
//   void initState() {
//     jobs = getHotJobs();
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         title: Text('Invitation to Interview'),
//         backgroundColor: Colors.red[200],
//       ),
//       body: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 10,
//                       blurRadius: 20,
//                       offset: Offset(0, 7), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Card(
//                   margin:
//                   EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                   color: Colors.white,
//                   elevation: 5.0,
//                   child: ListTile(
//                     title: Row(
//                       children: <Widget>[
//                         Text(
//                           '3',
//                           style: TextStyle(
//                             color: Colors.green,
//                           ),
//                         ),
//                         SizedBox(width: 10.0),
//                         Text(
//                           'Interview Invitation Found',
//                           style: TextStyle(
//                             color:Colors.black38,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15.0),
//               SingleChildScrollView(
//                   padding: EdgeInsets.all(10.0),
//                   child: Column(
//                     children: <Widget>[
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         elevation: 2,
//                         child: Column(
//                           children: <Widget>[
//                             ListTile(
//                               title: Text(
//                                 'The ACME Laboratories Limited',
//                                 style: TextStyle(
//                                   fontSize: 15.0,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               subtitle: Row(
//                                 children: <Widget>[
//                                   Icon(Icons.date_range, color: Colors.blueAccent),
//                                   SizedBox(width: 5),
//                                   Text('Invited on:8/28/2020',
//                                       style: TextStyle(color: Colors.black54,
//                                         fontSize: 15.0,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         elevation: 2,
//                         child: Column(
//                           children: <Widget>[
//                             ListTile(
//                               title: Text(
//                                 'Kallol Group of Companies',
//                                 style: TextStyle(
//                                   fontSize: 15.0,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               subtitle: Row(
//                                 children: <Widget>[
//                                   Icon(Icons.date_range, color: Colors.blueAccent),
//                                   SizedBox(width: 5),
//                                   Text('Invited on:7/8/2020',
//                                       style: TextStyle(color: Colors.black54,
//                                         fontSize: 15.0,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         elevation: 2,
//                         child: Column(
//                           children: <Widget>[
//                             ListTile(
//                               title: Text(
//                                 'Eye-Cone International',
//                                 style: TextStyle(
//                                   fontSize: 15.0,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               subtitle: Row(
//                                 children: <Widget>[
//                                   Icon(Icons.date_range, color: Colors.blueAccent),
//                                   SizedBox(width: 5),
//                                   Text('Invited on:7/2/2020',
//                                       style: TextStyle(color: Colors.black54,
//                                         fontSize: 15.0,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }