// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/employment_history/employment_history_null.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class AddEmploymentHistory extends StatefulWidget {
//   @override
//   _AddEmploymentHistoryState createState() => _AddEmploymentHistoryState();
// }
//
// class _AddEmploymentHistoryState extends State<AddEmploymentHistory> {
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
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Company Name*",
//                             labelText: 'Company Name*',
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
//                             hintText: "Company Business*",
//                             labelText: 'Company Business*',
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
//                             hintText: "Company Location*",
//                             labelText: 'Company Location*',
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
//                             hintText: "Designation*",
//                             labelText: 'Designation*',
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
//                             hintText: "Department*",
//                             labelText: 'Department*',
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
//                             hintText: "Responsibilities",
//                             labelText: 'Responsibilities',
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
//                             hintText: "Training Year*",
//                             labelText: 'Training Year*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           Container(
//                             width: 130,
//                             child: TextField(
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.teal,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "Start Date*",
//                                   labelText: 'Start Date*',
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
//                                   hintText: "End Date*",
//                                   labelText: 'End Date*',
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
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Checkbox(value: false, onChanged: null),
//                           Text('Currently Working')
//                         ],
//                       ),
//                       Divider(),
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Area of Experience*",
//                             labelText: 'Area of Experience*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Divider(),
//                       Container(
//                           alignment: Alignment.centerLeft,
//                           child: Text('*Max 3 Working Discipline')),
//                       SizedBox(
//                         height: 100,
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
//           context, MaterialPageRoute(builder: (context) => EmploymentHistoryNull())),
//      // bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
