// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/carrer_and_application/edit_career_application.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class CareerApplication extends StatefulWidget {
//   CareerApplication(
//       {this.objective,
//       this.presentSalary,
//       this.expectedSalary,
//       this.lookingFor,
//       this.availableFor});
//
//   final String objective;
//   final String presentSalary;
//   final String expectedSalary;
//   final String lookingFor;
//   final String availableFor;
//
//   @override
//   _CareerApplicationState createState() => _CareerApplicationState();
// }
//
// class _CareerApplicationState extends State<CareerApplication> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: header2(
//         context,
//         titleText: Strings.careerAndApplication,
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => EditCareerApplication()));
//             },
//             icon: Icon(Icons.edit),
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
//                 title: "Objective",
//                 icon: Icons.track_changes,
//               ),
//             ),
//             ContainerCareer(
//               initValue: widget.objective,
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15.0),
//                         child: FieldTitleWithIcon(
//                           title: "Present Salary",
//                           icon: Icons.attach_money,
//                         ),
//                       ),
//                       ContainerCareer(
//                         initValue: widget.presentSalary,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15.0),
//                         child: FieldTitleWithIcon(
//                           title: "Expected Salary",
//                           icon: Icons.attach_money,
//                         ),
//                       ),
//                       ContainerCareer(
//                         initValue: widget.expectedSalary,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15.0),
//                         child: FieldTitleWithIcon(
//                           title: "Looking For",
//                           icon: Icons.search,
//                         ),
//                       ),
//                       ContainerCareer(
//                         initValue: widget.lookingFor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15.0),
//                         child: FieldTitleWithIcon(
//                           title: "Available For",
//                           icon: Icons.assignment_turned_in,
//                         ),
//                       ),
//                       ContainerCareer(
//                         initValue: widget.availableFor,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
