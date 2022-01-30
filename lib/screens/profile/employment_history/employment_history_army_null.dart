// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/employment_history/add_employment_history_army.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class EmploymentHistoryArmyNull extends StatefulWidget {
//   @override
//   _EmploymentHistoryArmyNullState createState() => _EmploymentHistoryArmyNullState();
// }
//
// class _EmploymentHistoryArmyNullState extends State<EmploymentHistoryArmyNull> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(
//         context,
//         titleText: Strings.employmentHistory,
//       ),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                   minHeight: viewportConstraints.maxHeight,
//                   minWidth: viewportConstraints.maxWidth),
//               child: Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: DottedBorder(
//                         padding: EdgeInsets.all(4),
//                         dashPattern: [9, 5],
//                         child: Container(
//                           height: 300,
//                           width: double.maxFinite,
//                           decoration: BoxDecoration(),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Text(
//                                 'Add Employment History',
//                                 style: TextStyle(fontSize: 25),
//                               ),
//                               Text(
//                                 '(Retired Army Person)',
//                                 style: TextStyle(fontSize: 25),
//                               ),
//                               IconButton(
//                                   icon: Icon(
//                                     Icons.add_circle_outline,
//                                     size: 50,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 AddEmploymentHistoryArmy()));
//                                   })
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//      // bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
