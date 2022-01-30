// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/other_relevent_information/edit_other_relevant_information.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class OtherRelevantInformation extends StatefulWidget {
//   OtherRelevantInformation({
//       this.careerSummary, this.specialQualification, this.keyword});
//
//   final String careerSummary;
//   final String specialQualification;
//   final String keyword;
//
//   @override
//   _OtherRelevantInformationState createState() =>
//       _OtherRelevantInformationState();
// }
//
// class _OtherRelevantInformationState extends State<OtherRelevantInformation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(
//         context,
//         titleText: Strings.otherRelevantInfo,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.edit,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => EditOtherRelevantInformation()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(top: 10.0),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Career Summary",
//                 icon: Icons.star,
//               ),
//             ),
//             ContainerCareer(
//               initValue: widget.careerSummary,
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Special Qualification",
//                 icon: Icons.folder_special,
//               ),
//             ),
//             ContainerCareer(
//               initValue: widget.specialQualification,
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Keywords",
//                 icon: Icons.search,
//               ),
//             ),
//             ContainerCareer(
//               initValue: widget.keyword,
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//           ],
//         ),
//       ),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
