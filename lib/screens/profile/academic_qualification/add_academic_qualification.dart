// import 'package:flutter/material.dart';
// import 'package:girlzwhosell/utils/constants.dart';
// import 'package:girlzwhosell/utils/strings.dart';
// import 'package:girlzwhosell/widgets/header.dart';
// import 'academic_qualification.dart';
//
// class AddAcademicQualification extends StatefulWidget {
//   @override
//   _AddAcademicQualificationState createState() =>
//       _AddAcademicQualificationState();
// }
//
// class _AddAcademicQualificationState
//     extends State<AddAcademicQualification> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(context, titleText: Strings.academicQualification),
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
//                             hintText: "Lavel of Education*",
//                             labelText: 'Lavel of Education*',
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
//                             hintText: "Exam/Major/Group*",
//                             labelText: 'Exam/Major/Group*',
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
//                             hintText: "Institute Name*",
//                             labelText: 'Institute Name*',
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
//                             hintText: "Result*",
//                             labelText: 'Result*',
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
//                             hintText: "Passing Year*",
//                             labelText: 'Passing Year*',
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
//                             hintText: "Duration",
//                             labelText: 'Duration',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: floatingActionButtonNext(context, MaterialPageRoute(builder: (context) => AcademicQualification())),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
