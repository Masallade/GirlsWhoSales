// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/language_proficiency/language_proficiency_null.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// import 'add_language_proficiency.dart';
//
//
// class LanguageProficiency extends StatefulWidget {
//   @override
//   _LanguageProficiencyState createState() =>
//       _LanguageProficiencyState();
// }
//
// class _LanguageProficiencyState extends State<LanguageProficiency> {
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
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                           color: Colors.white,
//                           elevation: 20,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               const ListTile(
//                                 leading: Icon(Icons.translate, size: 30),
//                                 title: Text('Bangla',
//                                     style: TextStyle(
//                                         color: Colors.teal, fontSize: 25)),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(30),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text(
//                                       '◘ Reading: High',
//                                       style: TextStyle(fontSize: 18),
//                                     ),
//                                     Divider(),
//                                     Text(
//                                       '◘ Writing: Medium',
//                                       style: TextStyle(fontSize: 18),
//                                     ),
//                                     Divider(),
//                                     Text(
//                                       '◘ Speaking: High',
//                                       style: TextStyle(fontSize: 18),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: <Widget>[
//                                         IconButton(
//                                             icon: Icon(
//                                               Icons.edit,
//                                               size: 30,
//                                             ),
//                                             onPressed: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           AddLanguageProficiency()));
//                                             }),
//                                         IconButton(
//                                             icon: Icon(
//                                               Icons.delete,
//                                               size: 30,
//                                             ),
//                                             onPressed: null)
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
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
//       floatingActionButton: floatingActionButtonNext(
//           context, MaterialPageRoute(builder: (context) => LanguageProficiencyNull())),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
