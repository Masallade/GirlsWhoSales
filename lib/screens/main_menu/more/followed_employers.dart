// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/widgets/header.dart';
//
//
// class FollowedEmployers extends StatefulWidget {
//   @override
//   _FollowedEmployersState createState() => _FollowedEmployersState();
// }
//
// class _FollowedEmployersState extends State<FollowedEmployers> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header(context,titleText: 'Followed Employers'),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return ConstrainedBox(
//             constraints: BoxConstraints(
//                 minHeight: viewportConstraints.maxHeight,
//                 minWidth: viewportConstraints.maxWidth),
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   container1
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// Widget get container1 {
//   return Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: DottedBorder(
//       padding: EdgeInsets.all(4),
//       dashPattern: [9, 5],
//       child: Container(
//         height: 100,
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '0 Followed Employers',
//               style: TextStyle(fontSize: 30),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
//
