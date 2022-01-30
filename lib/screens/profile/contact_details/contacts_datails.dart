// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/contact_details/edit_contacts_details.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class ContactDetails extends StatefulWidget {
//   @override
//   _ContactDetailsState createState() => _ContactDetailsState();
// }
//
// class _ContactDetailsState extends State<ContactDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: header2(
//         context, titleText: Strings.contactDetails, actions: <Widget>[
//         IconButton(
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder:
//                     (context) => EditContactDetails()));
//           },
//           icon: Icon(Icons.edit),
//         ),
//       ],
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
//                 title: "Present Address",
//                 icon: Icons.my_location,
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
//                 title: "Parmanent Address",
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
//                 title: "Phone Number",
//                 icon: Icons.phone,
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
//                 title: "Email Address",
//                 icon: Icons.alternate_email,
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
