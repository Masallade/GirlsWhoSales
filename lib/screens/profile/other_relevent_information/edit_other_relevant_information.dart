// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/other_relevent_information/other_relevant_information1.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class EditOtherRelevantInformation extends StatefulWidget {
//   @override
//   _EditOtherRelevantInformationState createState() =>
//       _EditOtherRelevantInformationState();
// }
//
// class _EditOtherRelevantInformationState
//     extends State<EditOtherRelevantInformation> {
//   String careerSummary = "";
//   String specialQualification = "";
//   String keyword = "";
//
//   void _whatIsCareerSummary() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               physics: AlwaysScrollableScrollPhysics(),
//               child: Container(
//                 width: double.maxFinite,
//                 height: 200.0,
//                 child: ListView(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Container(
//                       child: Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               'Career Summary',
//                               style: TextStyle(fontSize: 20.0),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       isThreeLine: true,
//                       subtitle: Text(
//                         'Career summary is an optional customized section where you can list your key achievenments, skills, and relevant experiences'
//                         'to enrich the value of your resume. This section focuses on your relevant experience and lets the employer know that you have taken time'
//                         'to create your resume which shows your qualification as well as activeness',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//   void _careerSummaryExample() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0)), //this right here
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             physics: AlwaysScrollableScrollPhysics(),
//             child: Container(
//               width: double.maxFinite,
//               height: 300.0,
//               child: ListView(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     child: Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Career Summary',
//                             style: TextStyle(fontSize: 20.0),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     title: Text('Good Example'),
//                     isThreeLine: true,
//                     subtitle: Text(
//                       'At present I am working as a [Your Designation] at [XYZ Company]. I have done an Internship at Independent Television ltd. And after my graduation, I served as a probationary English Teacher at Lion School and College, Rangur. Except that during my student life I was involved in different programs of event organizing at my college and University.',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   ListTile(
//                     title: Text('Bad Example'),
//                     isThreeLine: true,
//                     subtitle: Text(
//                       'I worked for many reputed companies and earned enough knowledge in the field. I think I am the most eligible candidate for relevant job post.',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void _whatIsSpecialQualification() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               physics: AlwaysScrollableScrollPhysics(),
//               child: Container(
//                 width: double.maxFinite,
//                 height: 200.0,
//                 child: ListView(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Container(
//                       child: Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               'Special Qualification',
//                               style: TextStyle(fontSize: 20.0),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       isThreeLine: true,
//                       subtitle: Text(
//                         'In Special Qualification part you can add the summery of your most pertinent qualifications. This will help to get a job by grabbing attention of the employer. It is also a place where attributes, such as punctuality and honesty can added too. Make your statement precise and concise to increase the chance of getting job easily.',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   void _specialQualificationExample() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0)), //this right here
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             physics: AlwaysScrollableScrollPhysics(),
//             child: Container(
//               width: double.maxFinite,
//               height: 300.0,
//               child: ListView(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     child: Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Special Qualification',
//                             style: TextStyle(fontSize: 20.0),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     title: Text('Good Example'),
//                     isThreeLine: true,
//                     subtitle: Text(
//                       'I have some special qualifications of web development like Java, C#, Dot net. Besides, I have potential of event organizing and data analyzing too. I can work under pressure I am a quick learner.',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   ListTile(
//                     title: Text('Bad Example'),
//                     isThreeLine: true,
//                     subtitle: Text(
//                       'I am very energetic and dedicated to office work. I am regular and know the very basic of your required field. I have 5 years of experience in the field and I think I am the best candidate for your job post.',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void _whatIsKeyword() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               physics: AlwaysScrollableScrollPhysics(),
//               child: Container(
//                 width: double.maxFinite,
//                 height: 200.0,
//                 child: ListView(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Container(
//                       child: Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               'Career Summary',
//                               style: TextStyle(fontSize: 20.0),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       isThreeLine: true,
//                       subtitle: Text(
//                         'Keywords are specific words or phrases which job seekers use to search jobs and employers use to find the right candidates. Keywords are used as search criteria like the same way you do research on the internet. The more keywords you use, the more jobs will match closely to your search. Example: MBA, BBA, Photography, Computer Diploma, Visual Basic, Visual C++, Java, HTML, Photo shop, BUET, DU, IBA, NUU etc.',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(
//         context,
//         titleText: Strings.otherRelevantInfo,
//       ),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                   minHeight: viewportConstraints.maxHeight,
//                   minWidth: viewportConstraints.maxWidth),
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         onChanged: (val) {
//                           careerSummary = val;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10.0))),
//                           labelText: "Career Summary",
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _whatIsCareerSummary,
//                         child: Row(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 child: Text('What is Career Summary?'),
//                               ),
//                             ),
//                             Icon(Icons.help)
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: _careerSummaryExample,
//                           child: Row(
//                             children: <Widget>[
//                               Icon(Icons.remove_red_eye),
//                               Container(
//                                 child: Text('Example'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       TextFormField(
//                         onChanged: (val) {
//                           specialQualification = val;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10.0))),
//                           labelText: "Special Qualification",
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _whatIsSpecialQualification,
//                         child: Row(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 child: Text('What is Special Qualification?'),
//                               ),
//                             ),
//                             Icon(Icons.help)
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: _specialQualificationExample,
//                           child: Row(
//                             children: <Widget>[
//                               Icon(Icons.remove_red_eye),
//                               Container(
//                                 child: Text('Example'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       TextFormField(
//                         onChanged: (val) {
//                           keyword = val;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10.0))),
//                           labelText: "Keywords *",
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _whatIsKeyword,
//                         child: Row(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 child: Text('What is Keywords?'),
//                               ),
//                             ),
//                             Icon(Icons.help)
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color(0xFFDE1E37),
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => OtherRelevantInformation(
//                     careerSummary: careerSummary, specialQualification:specialQualification, keyword: keyword,
//                   )));
//         },
//         child: Icon(
//           Icons.done,
//           size: 40.0,
//         ),
//       ),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
