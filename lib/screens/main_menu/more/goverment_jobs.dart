// import 'package:flutter/material.dart';
// import 'package:qjobs/model/jobshot.dart';
// import 'package:qjobs/screens/main_menu/job_details_page.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class GovernmentJobs extends StatefulWidget {
//   @override
//   _GovernmentJobsState createState() => _GovernmentJobsState();
// }
//
// class _GovernmentJobsState extends State<GovernmentJobs> {
//   List jobs;
//   @override
//   void initState() {
//     jobs = getHotJobs();
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//
//     ListTile makeListTile(JobsHot job) => ListTile(
//       isThreeLine: true,
//       title: Text(
//         job.title,
//         style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             job.companyName,
//             style: TextStyle(fontSize: 15.0),
//           ),
//           SizedBox(height: 15.0,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Text(
//                     '📅 Deadline:',
//                     style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700),
//                   ),
//                   Text(
//                     job.deadline,
//                     style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Text(
//                     '💼 Experience:',
//                     style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700),
//                   ),
//                   Text(
//                     job.experience,
//                     style: TextStyle(fontSize: 15.0),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 15.0,),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '🎓 Education:',
//                       style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700),
//                     ),
//                     Text(
//                       job.education,
//                       style: TextStyle(fontSize: 15.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       trailing: Image(
//         width: 40.0,
//         height: 40.0,
//         image: AssetImage(job.image),
//       ),
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => JobDetailsPage(jobsHot: job)));
//       },
//     );
//
//     Card makeCard(JobsHot job) => Card(
//       elevation: 8.0,
//       margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//       child: Container(
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: makeListTile(job),
//         ),
//       ),
//     );
//
//     return Scaffold(
//       appBar: header(context, titleText: 'Government Jobs'),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 10,
//                     blurRadius: 20,
//                     offset: Offset(0, 7), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: <Widget>[
//                   Card(
//                     margin:
//                     EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                     color: Colors.white,
//                     elevation: 5.0,
//                     child: ListTile(
//                       title: Row(
//                         children: <Widget>[
//                           Text(
//                             '160',
//                             style: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             ' Government Jobs',
//                             style: TextStyle(
//                               color: Theme.of(context).accentColor,
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: jobs.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return makeCard(jobs[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
