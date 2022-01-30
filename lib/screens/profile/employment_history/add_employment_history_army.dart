// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/employment_history/employment_history_army_null.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
//
// class AddEmploymentHistoryArmy extends StatefulWidget {
//   @override
//   _AddEmploymentHistoryArmyState createState() => _AddEmploymentHistoryArmyState();
// }
//
// class _AddEmploymentHistoryArmyState extends State<AddEmploymentHistoryArmy> {
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
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             width: 130,
//                             child: TextField(
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.teal,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "BA*",
//                                   labelText: 'BA*',
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.blueAccent,
//                                           width: 32.0),
//                                       borderRadius:
//                                           BorderRadius.circular(10.0)),
//                                 )),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             width: 130,
//                             child: TextField(
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.teal,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "No*",
//                                   labelText: 'No*',
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.blueAccent,
//                                           width: 32.0),
//                                       borderRadius:
//                                           BorderRadius.circular(10.0)),
//                                 )),
//                           ),
//                         ],
//                       ),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Ranks*",
//                             labelText: 'Ranks*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Type*",
//                             labelText: 'Type*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Arms*",
//                             labelText: 'Arms*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Trade*",
//                             labelText: 'Trade*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Course*",
//                             labelText: 'Course*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Date of Retirement*",
//                             labelText: 'Date of Retirement*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       SizedBox(
//                         height: 50,
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
//       floatingActionButton: floatingActionButtonNext(
//           context, MaterialPageRoute(builder: (context) => EmploymentHistoryArmyNull())),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
