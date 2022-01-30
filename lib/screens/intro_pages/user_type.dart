// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:qjobs/screens/intro_pages/job_search_all.dart';
// import 'package:qjobs/screens/intro_pages/sign_in_page.dart';
// import 'package:qjobs/screens/registration/skill_selection_functional_page.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/constants2.dart';
// import 'package:qjobs/utils/size_config.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
//
// class UserType extends StatefulWidget {
//   @override
//   _UserTypeState createState() => _UserTypeState();
// }
//
// class _UserTypeState extends State<UserType> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//      backgroundColor: Colors.red[100],
//       body: Stack(
//         children: [
//           Container(
//             height: size.height * .5,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 bottomRight: Radius.circular(60),
//                 bottomLeft: Radius.circular(60),
//               ),
//             ),
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 20.0,
//                         ),
//                         child: Image.asset(
//                           'assets/images/logo.png',
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.1),
//                       Padding(
//                         padding: const EdgeInsets.only(left:10.0),
//                         child: Text(
//                             "Please Choose User Type",
//                           style: TextStyle(
//                             fontFamily: 'SourceSansPro',
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24,
//                               color: Colors.blue[800]),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SafeArea(
//               child: SingleChildScrollView(
//                 //  scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 260.0, left: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Container(
//                               height: 300,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   border: Border.all(color: Colors.red[100].withOpacity(0.2))
//                               ),
//                             //  color: Colors.white,
//                               child: Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(20.0),
//                                   child: Column(
//                                     children: <Widget>[
//                                       SizedBox(height: 20,),
//                                       Container(
//
//                                         width:SizeConfig.screenWidth,
//                                         height: 50.0,
//                                         decoration: BoxDecoration(
//                                           color: kAccentColor,
//                                           //color: Colors.pink[300],
//                                             borderRadius: BorderRadius.circular(30.0),
//                                            // border: Border.all(color: Theme.of(context).accentColor)
//                                            ),
//                                         child: GestureDetector(
//                                           onTap: (){
//                                             //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                           },
//                                           child: ListTile(
//                                             title: Center(
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(bottom: 10.0),
//                                                 child: Text(
//                                                   'Job Seeker',
//                                                   style: kH4DPATextStyle,
//
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 30,),
//                                       Container(
//
//                                         width:SizeConfig.screenWidth,
//                                         height: 50.0,
//                                         decoration: BoxDecoration(
//                                             color:kAccentColor ,
//                                           // color: Colors.pink[300],
//                                             borderRadius: BorderRadius.circular(30.0),
//                                         //    border: Border.all(color: Theme.of(context).accentColor)
//                                         ),
//                                         child: GestureDetector(
//                                           onTap: (){
//                                             //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                           },
//                                           child: ListTile(
//                                             title: Center(
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(bottom: 10.0),
//                                                 child: Text(
//                                                   'Mentor/Mentee',
//                                                   style: kH4DPATextStyle,
//
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 30,),
//                                       Container(
//
//                                         width:SizeConfig.screenWidth,
//                                         height: 50.0,
//                                         decoration: BoxDecoration(
//                                           //color: Colors.pink[300],
//                                             color: kAccentColor,
//                                             borderRadius: BorderRadius.circular(30.0),
//                                           //  border: Border.all(color: Theme.of(context).accentColor)
//                                         ),
//                                         child: GestureDetector(
//                                           onTap: (){
//                                             //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                           },
//                                           child: ListTile(
//                                             title: Center(
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(bottom: 10.0),
//                                                 child: Text(
//                                                   'Hiring',
//                                                   style: kH4DPATextStyle,
//
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       // GestureDetector(
//                                       //   onTap: () {
//                                       //     print('Functional');
//                                       //   },
//                                       //   child: Card(
//                                       //     shape: RoundedRectangleBorder(
//                                       //       borderRadius: BorderRadius.circular(10.0),
//                                       //     ),
//                                       //     elevation: 5,
//                                       //     color: Colors.white,
//                                       //     child: Padding(
//                                       //       padding: const EdgeInsets.only(bottom: 20.0),
//                                       //       child: Row(
//                                       //         children: <Widget>[
//                                       //           RawMaterialButton(
//                                       //               shape: RoundedRectangleBorder(
//                                       //                 borderRadius: BorderRadius.only(
//                                       //                     topLeft: Radius.circular(10.0),
//                                       //                     topRight: Radius.zero,
//                                       //                     bottomLeft: Radius.zero,
//                                       //                     bottomRight:
//                                       //                         Radius.circular(50.0)),
//                                       //               ),
//                                       //               onPressed: () {},
//                                       //               fillColor: Colors.grey,
//                                       //               child: Padding(
//                                       //                 padding: const EdgeInsets.only(
//                                       //                     top: 10,
//                                       //                     left: 10,
//                                       //                     right: 20,
//                                       //                     bottom: 20),
//                                       //                 child: Icon(
//                                       //                   FontAwesomeIcons.user,
//                                       //                   size: 25.0,
//                                       //                   color: Colors.white,
//                                       //                 ),
//                                       //               )),
//                                       //           Expanded(
//                                       //             child: Column(
//                                       //               children: <Widget>[
//                                       //                 Column(
//                                       //                   mainAxisAlignment: MainAxisAlignment.center,
//                                       //                   children: <Widget>[
//                                       //                     Text(
//                                       //                   'Job Seeker',
//                                       //                       style: TextStyle(
//                                       //                           color: Theme.of(context)
//                                       //                               .accentColor,
//                                       //                           fontSize: 20.0),
//                                       //                     ),
//                                       //                     Padding(
//                                       //                       padding: const EdgeInsets.only(left: 20),
//                                       //                       // child: Text(
//                                       //                       //   Strings.funCatText,
//                                       //                       //   style: TextStyle(
//                                       //                       //       color: Theme.of(context)
//                                       //                       //           .accentColor,
//                                       //                       //       fontSize: 13.0),
//                                       //                       // ),
//                                       //                     ),
//                                       //                   ],
//                                       //                 )
//                                       //               ],
//                                       //             ),
//                                       //           ),
//                                       //         ],
//                                       //       ),
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                       // GestureDetector(
//                                       //   onTap: () {
//                                       //     print('Special');
//                                       //   },
//                                       //   child: Card(
//                                       //     shape: RoundedRectangleBorder(
//                                       //       borderRadius: BorderRadius.circular(10.0),
//                                       //     ),
//                                       //     elevation: 5,
//                                       //     color: Colors.white,
//                                       //     child: Padding(
//                                       //       padding: const EdgeInsets.only(bottom: 20.0),
//                                       //       child: Row(
//                                       //         children: <Widget>[
//                                       //           RawMaterialButton(
//                                       //               shape: RoundedRectangleBorder(
//                                       //                 borderRadius: BorderRadius.only(
//                                       //                     topLeft: Radius.circular(10.0),
//                                       //                     topRight: Radius.zero,
//                                       //                     bottomLeft: Radius.zero,
//                                       //                     bottomRight:
//                                       //                         Radius.circular(50.0)),
//                                       //               ),
//                                       //               onPressed: () {},
//                                       //               fillColor:
//                                       //                   Colors.pink,
//                                       //               child: Padding(
//                                       //                 padding: const EdgeInsets.only(
//                                       //                     top: 10,
//                                       //                     left: 10,
//                                       //                     right: 20,
//                                       //                     bottom: 20),
//                                       //                 child: Icon(
//                                       //                   FontAwesomeIcons.users,
//                                       //                   size: 25.0,
//                                       //                   color: Colors.white,
//                                       //                 ),
//                                       //               )),
//                                       //           Expanded(
//                                       //             child: Column(
//                                       //               children: <Widget>[
//                                       //                 Padding(
//                                       //                   padding: const EdgeInsets.only(
//                                       //                       left: 20.0),
//                                       //                   child: Column(
//                                       //                     mainAxisAlignment: MainAxisAlignment.center,
//                                       //                     children: <Widget>[
//                                       //                       Text(
//                                       //                         'Mentor / Mentee',
//                                       //                         style: TextStyle(
//                                       //                             color: Theme.of(context)
//                                       //                                 .accentColor,
//                                       //                             fontSize: 20.0),
//                                       //                       ),
//                                       //                       // Text(
//                                       //                       //  'Individual offers professional expertise',
//                                       //                       //   style: TextStyle(
//                                       //                       //       color: Theme.of(context)
//                                       //                       //           .accentColor,
//                                       //                       //       fontSize: 13.0),
//                                       //                       // ),
//                                       //                     ],
//                                       //                   ),
//                                       //                 ),
//                                       //               ],
//                                       //             ),
//                                       //           ),
//                                       //         ],
//                                       //       ),
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                       // GestureDetector(
//                                       //   onTap: () {
//                                       //     print('Special');
//                                       //   },
//                                       //   child: Card(
//                                       //     shape: RoundedRectangleBorder(
//                                       //       borderRadius: BorderRadius.circular(10.0),
//                                       //     ),
//                                       //     elevation: 5,
//                                       //     color: Colors.white,
//                                       //     child: Padding(
//                                       //       padding: const EdgeInsets.only(bottom: 20.0),
//                                       //       child: Row(
//                                       //         children: <Widget>[
//                                       //           RawMaterialButton(
//                                       //               shape: RoundedRectangleBorder(
//                                       //                 borderRadius: BorderRadius.only(
//                                       //                     topLeft: Radius.circular(10.0),
//                                       //                     topRight: Radius.zero,
//                                       //                     bottomLeft: Radius.zero,
//                                       //                     bottomRight:
//                                       //                     Radius.circular(50.0)),
//                                       //               ),
//                                       //               onPressed: () {},
//                                       //               fillColor:
//                                       //               Colors.red[200],
//                                       //               child: Padding(
//                                       //                 padding: const EdgeInsets.only(
//                                       //                     top: 10,
//                                       //                     left: 10,
//                                       //                     right: 20,
//                                       //                     bottom: 20),
//                                       //                 child: Icon(
//                                       //                   FontAwesomeIcons.hireAHelper,
//                                       //                   size: 25.0,
//                                       //                   color: Colors.white,
//                                       //                 ),
//                                       //               )),
//                                       //           Expanded(
//                                       //             child: Column(
//                                       //               children: <Widget>[
//                                       //                 Padding(
//                                       //                   padding: const EdgeInsets.only(
//                                       //                       left: 20.0),
//                                       //                   child: Column(
//                                       //                     mainAxisAlignment: MainAxisAlignment.center,
//                                       //                     children: <Widget>[
//                                       //                       Text(
//                                       //                         'Hiring',
//                                       //                         style: TextStyle(
//                                       //                             color: Theme.of(context)
//                                       //                                 .accentColor,
//                                       //                             fontSize: 20.0),
//                                       //                       ),
//                                       //                       // Text(
//                                       //                       //   'Individual offers professional expertise',
//                                       //                       //   style: TextStyle(
//                                       //                       //       color: Theme.of(context)
//                                       //                       //           .accentColor,
//                                       //                       //       fontSize: 13.0),
//                                       //                       // ),
//                                       //                     ],
//                                       //                   ),
//                                       //                 ),
//                                       //               ],
//                                       //             ),
//                                       //           ),
//                                       //         ],
//                                       //       ),
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 12.0),
//         child: floatingActionButtonNext(
//             context, MaterialPageRoute(builder: (context) => SignInPage())),
//       ),
//     );
//   }
// }
