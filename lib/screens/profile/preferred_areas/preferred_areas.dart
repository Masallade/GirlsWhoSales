// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:qjobs/screens/profile/preferred_areas/edit_preferred_areas.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
//
// class PreferredAreas extends StatefulWidget {
//   @override
//   _PreferredAreasState createState() => _PreferredAreasState();
// }
//
// class _PreferredAreasState extends State<PreferredAreas> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(
//         context,
//         titleText: Strings.preferredAreas,
//           actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.edit,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => EditPreferredAreas()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(top: 10.0),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Preferred Job Categories",
//                 icon: Icons.work,
//               ),
//             ),
//             ContainerCareer(
//
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top: 10.0),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Preferred Organization Type",
//                 icon: Icons.location_city,
//               ),
//             ),
//             ContainerCareer(
//
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top: 10.0),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Preferred Job Location (Inside Bangladesh)",
//                 icon: Icons.location_on,
//               ),
//             ),
//             ContainerCareer(
//
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320.0,
//                 child: Divider(color: Colors.black38),
//               ),
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top: 10.0),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0),
//               child: FieldTitleWithIcon(
//                 title: "Preferred Country",
//                 icon: FontAwesomeIcons.globe,
//               ),
//             ),
//             ContainerCareer(
//
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
