// import 'package:flutter/material.dart';
// import 'package:girlzwhosell/utils/constants.dart';
// import 'package:girlzwhosell/utils/size_config.dart';
//
//
// class JobSearchAll extends StatefulWidget {
//   @override
//   _JobSearchAllState createState() => _JobSearchAllState();
// }
//
// class _JobSearchAllState extends State<JobSearchAll> {
//   int _jobType;
//   int _jobLocation;
//   int _jobTitle;
//
//   List<String> _selectExperience = [
//     'Less than 1 year',
//     '1 Year',
//     '3 - 5 Years',
//     '5 - 10 Years',
//     'Over 10 Years'
//   ];
//   int _defaultExperienceSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       //resizeToAvoidBottomPadding: false,
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Stack(
//           children: <Widget>[
//            // BackgroundWidget(size: size),
//             BackButtonPop(),
//             Padding(
//               padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 90.0),
//               child: LinearProgressIndicator(
//                 backgroundColor: Color(0xFFD7D7D7),
//                 valueColor: AlwaysStoppedAnimation<Color>(kAccentColor),
//                 value: 0.8,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Container(
//                 alignment: Alignment.center,
//                 height: size.height,
//                 width: size.width,
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       // Image.asset('assets/images/logo.png',
//                       //   width: 220,
//                       //   height: 100,
//                       //   fit: BoxFit.fill,
//                       // ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//
//                           Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: <Widget>[
//
//                                 // IconButton(
//                                 //   icon: new Icon(
//                                 //     Icons.account_circle,
//                                 //     color: Colors.pink,
//                                 //   ),
//                                 //   iconSize: 35.0,
//                                 //   onPressed: () {
//                                 //     Navigator.push(
//                                 //         context,
//                                 //         MaterialPageRoute(
//                                 //             builder: (context) =>
//                                 //                 SignInPage()));
//                                 //   },
//                                 // ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   Strings.searchJob,
//                                   style: TextStyle(
//                                     fontFamily: 'SourceSansPro',
//                                     fontStyle: FontStyle.normal,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: 24.0,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             width: SizeConfig.screenWidth,
//                             height: 50.0,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 border: Border.all(
//                                     color: Theme.of(context).accentColor)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                   hint: new Text(Strings.jobTypeDropdown),
//                                   value: _jobType == null
//                                       ? null
//                                       : Lists.jobType[_jobType],
//                                   items: Lists.jobType.map((String value) {
//                                     return new DropdownMenuItem<String>(
//                                       value: value,
//                                       child: new Text(value),
//                                     );
//                                   }).toList(),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _jobType = Lists.jobType.indexOf(value);
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25.0,
//                           ),
//                           Container(
//                             width: SizeConfig.screenWidth,
//                             height: 50.0,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 border: Border.all(
//                                     color: Theme.of(context).accentColor)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButtonHideUnderline(
//                                   child: DropdownButton<String>(
//                                 hint: new Text(Strings.LocationDropdown),
//                                 value: _jobLocation == null
//                                     ? null
//                                     : Lists.jobLocation[_jobLocation],
//                                 items: Lists.jobLocation.map((String value) {
//                                   return new DropdownMenuItem<String>(
//                                     value: value,
//                                     child: new Text(value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _jobLocation =
//                                         Lists.jobLocation.indexOf(value);
//                                   });
//                                 },
//                               )),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25.0,
//                           ),
//                           Container(
//                             width: SizeConfig.screenWidth,
//                             height: 50.0,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 border: Border.all(
//                                     color: Theme.of(context).accentColor)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButtonHideUnderline(
//                                   child: DropdownButton<String>(
//                                 hint: Text(Strings.jobtitle),
//                                 value: _jobTitle == null
//                                     ? null
//                                     : Lists.jobCatagories[_jobTitle],
//                                 items: Lists.jobCatagories.map((String value) {
//                                   return new DropdownMenuItem<String>(
//                                     value: value,
//                                     child: new Text(value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _jobTitle =
//                                         Lists.jobCatagories.indexOf(value);
//                                   });
//                                 },
//                               ),),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Container(
//                                     margin: const EdgeInsets.only(
//                                         left: 10.0, right: 20.0),
//                                     child: Divider(
//                                       thickness: 2.0,
//                                       color: Color(0xFFD7D7D7),
//                                     )),
//                               ),
//                               Text("Experience"),
//                               Expanded(
//                                 child: Container(
//                                     margin: const EdgeInsets.only(
//                                         left: 20.0, right: 10.0),
//                                     child: Divider(
//                                       thickness: 2.0,
//                                       color: Color(0xFFD7D7D7),
//                                     )),
//                               ),
//                             ],
//                           ),
//                           Wrap(
//                             spacing: 3.0,
//                             children: List<Widget>.generate(
//                               _selectExperience.length,
//                                   (int index) {
//                                 return ChoiceChip(
//                                   label: Text(
//                                     _selectExperience[index],
//                                     style: TextStyle(color: Colors.white, fontSize: 15.0),
//                                   ),
//                                   backgroundColor: Colors.black26,
//                                   padding: EdgeInsets.all(5.0),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5.0)),
//                                   selected: _defaultExperienceSelected == index,
//                                   selectedColor: Colors.pink,
//                                   onSelected: (bool selected) {
//                                     setState(() {
//                                       _defaultExperienceSelected = selected ? index : 0;
//                                     });
//                                   },
//                                 );
//                               },
//                             ).toList(),
//                           ),
//                         ],
//                       ),
//                       // Column(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: <Widget>[
//                       //     GestureDetector(
//                       //       onTap: () {
//                       //         print('search');
//                       //       },
//                       //       child: Container(
//                       //         width: SizeConfig.screenWidth,
//                       //         height: 50.0,
//                       //         decoration: BoxDecoration(
//                       //             borderRadius: BorderRadius.circular(5.0),
//                       //             border: Border.all(
//                       //                // color: Theme.of(context).accentColor
//                       //               color: Colors.pink,
//                       //             )),
//                       //         child: Container(
//                       //           color: Colors.pink,
//                       //           // color: Theme.of(context).accentColor,
//                       //           child: GestureDetector(
//                       //             child: ListTile(
//                       //               leading: Padding(
//                       //                 padding:
//                       //                     const EdgeInsets.only(bottom: 10.0),
//                       //                 child: Icon(
//                       //                   Icons.search,
//                       //                   color: Colors.white,
//                       //                   size: 30.0,
//                       //                 ),
//                       //               ),
//                       //               title: Center(
//                       //                 child: Padding(
//                       //                   padding: const EdgeInsets.only(
//                       //                       right: 50.0, bottom: 10.0),
//                       //                   child: Text(
//                       //                     Strings.search,
//                       //                     style: kH2WTextStyle,
//                       //                   ),
//                       //                 ),
//                       //               ),
//                       //             ),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //     ),
//                       //     SizedBox(
//                       //       height: 20.0,
//                       //     ),
//                       //     GestureDetector(
//                       //       onTap: () {
//                       //         print('hotjobs');
//                       //       },
//                       //       child: Container(
//                       //         width: SizeConfig.screenWidth,
//                       //         height: 50.0,
//                       //         decoration: BoxDecoration(
//                       //             borderRadius: BorderRadius.circular(5.0),
//                       //             border: Border.all(
//                       //                 //color: Theme.of(context).accentColor
//                       //               color: Colors.pink,
//                       //             )),
//                       //         child: Container(
//                       //           child: GestureDetector(
//                       //             child: ListTile(
//                       //               leading: Padding(
//                       //                 padding:
//                       //                     const EdgeInsets.only(bottom: 10.0),
//                       //                 child: Icon(
//                       //                   Icons.whatshot,
//                       //                   color: Color(0xFFDE1E37),
//                       //                   size: 30.0,
//                       //                 ),
//                       //               ),
//                       //               title: Center(
//                       //                 child: Padding(
//                       //                   padding: const EdgeInsets.only(
//                       //                       right: 50.0, bottom: 10.0),
//                       //                   child: Text(
//                       //                     Strings.viewNewJobs,
//                       //                     style: kH2BTextStyle,
//                       //                   ),
//                       //                 ),
//                       //               ),
//                       //             ),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //     ),
//                       //     SizedBox(
//                       //       height: 60.0,
//                       //     ),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 12.0),
//         child: floatingActionButtonNext(
//
//             context, MaterialPageRoute(builder: (context) => CustomFilePicker())),
//       ),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
