// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
// import 'add_language_proficiency.dart';
//
// class LanguageProficiencyNull extends StatefulWidget {
//   @override
//   _LanguageProficiencyNullState createState() =>
//       _LanguageProficiencyNullState();
// }
//
// class _LanguageProficiencyNullState extends State<LanguageProficiencyNull> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(
//         context,
//         titleText: Strings.languageProficiency,
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
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(15.0)),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Text(
//                                 'Add Language Proficiency',
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
//                                                 AddLanguageProficiency()));
//                                   }),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }