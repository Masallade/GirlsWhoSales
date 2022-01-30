// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:qjobs/screens/profile/preferred_areas/preferred_areas.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/lists.dart';
// import 'package:qjobs/utils/size_config.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// int _jobCategory;
// int _jobType;
// int _jobLocation;
// int _jobCountry;
// List<Widget> _jobCategoryWidget = List<Widget>();
// List<Widget> _jobTypeWidget = List<Widget>();
// List<Widget> _jobLocationWidget = List<Widget>();
// List<Widget> _jobCountryWidget = List<Widget>();
// class EditPreferredAreas extends StatefulWidget {
//   @override
//   _EditPreferredAreasState createState() => _EditPreferredAreasState();
// }
//
// class _EditPreferredAreasState extends State<EditPreferredAreas> {
//   var selectedItem;
//   var selectedLocation;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: header2(
//         context,
//         titleText: Strings.preferredAreas,
//       ),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                   minHeight: viewportConstraints.maxHeight,
//                   minWidth: viewportConstraints.maxWidth),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 8.0),
//                           child: Text('💼 Choose Preferred Job Categories'),
//                         ),
//                       ),
//                       Container(
//                         width: SizeConfig.screenWidth,
//                         height: 50.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7.0),
//                             border: Border.all(
//                                 color: Theme.of(context).accentColor)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               hint: Text(Strings.searchJob),
//                               value: _jobCategory == null
//                                   ? null
//                                   : Lists.jobCatagories[_jobCategory],
//                               items: Lists.jobCatagories.map((String value) {
//                                 return new DropdownMenuItem<String>(
//                                   value: value,
//                                   child: new Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _jobCategory =
//                                       Lists.jobCatagories.indexOf(value);
//                                   _jobCategoryWidget.add(JobCategory());
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Wrap(
//                           spacing: 5.0,
//                           children: List.generate(
//                             _jobCategoryWidget.length,
//                             (i) {
//                               return _jobCategoryWidget[i];
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0,),
//
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 8.0),
//                           child: Text('🏢 Choose Preferred Organization Type'),
//                         ),
//                       ),
//                       Container(
//                         width: SizeConfig.screenWidth,
//                         height: 50.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7.0),
//                             border: Border.all(
//                                 color: Theme.of(context).accentColor)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               hint: Text(Strings.searchJob),
//                               value: _jobType == null
//                                   ? null
//                                   : Lists.jobType[_jobType],
//                               items: Lists.jobType.map((String value) {
//                                 return new DropdownMenuItem<String>(
//                                   value: value,
//                                   child: new Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _jobType =
//                                       Lists.jobType.indexOf(value);
//                                   _jobTypeWidget.add(JobOrganization());
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Wrap(
//                           spacing: 5.0,
//                           children: List.generate(
//                             _jobTypeWidget.length,
//                                 (i) {
//                               return _jobTypeWidget[i];
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0,),
//
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 8.0),
//                           child: Text('📍 Choose Preferred Job Location (Inside Bangladesh)'),
//                         ),
//                       ),
//                       Container(
//                         width: SizeConfig.screenWidth,
//                         height: 50.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7.0),
//                             border: Border.all(
//                                 color: Theme.of(context).accentColor)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               hint: Text(Strings.searchJob),
//                               value: _jobLocation == null
//                                   ? null
//                                   : Lists.jobLocation[_jobLocation],
//                               items: Lists.jobLocation.map((String value) {
//                                 return new DropdownMenuItem<String>(
//                                   value: value,
//                                   child: new Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _jobLocation =
//                                       Lists.jobLocation.indexOf(value);
//                                   _jobLocationWidget.add(JobLocation());
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Wrap(
//                           spacing: 5.0,
//                           children: List.generate(
//                             _jobLocationWidget.length,
//                                 (i) {
//                               return _jobLocationWidget[i];
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0,),
//
//
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 8.0),
//                           child: Text('🌎 Choose Preferred Country'),
//                         ),
//                       ),
//                       Container(
//                         width: SizeConfig.screenWidth,
//                         height: 50.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7.0),
//                             border: Border.all(
//                                 color: Theme.of(context).accentColor)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               hint: Text(Strings.searchJob),
//                               value: _jobCountry == null
//                                   ? null
//                                   : Lists.countryTitle[_jobCountry],
//                               items: Lists.countryTitle.map((String value) {
//                                 return new DropdownMenuItem<String>(
//                                   value: value,
//                                   child: new Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _jobCountry =
//                                       Lists.countryTitle.indexOf(value);
//                                   _jobCountryWidget.add(JobCountry());
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Wrap(
//                           spacing: 5.0,
//                           children: List.generate(
//                             _jobCountryWidget.length,
//                                 (i) {
//                               return _jobCountryWidget[i];
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0,),
//                       SizedBox(
//                         height: 50,
//                       )
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
//           context, MaterialPageRoute(builder: (context) => PreferredAreas())),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
//
// class JobCategory extends StatefulWidget {
//   @override
//   _JobCategoryState createState() => _JobCategoryState();
// }
//
// class _JobCategoryState extends State<JobCategory> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return InputChip(
//       isEnabled: true,
//       backgroundColor: Theme.of(context).primaryColor,
//       deleteIconColor: Colors.white,
//       onDeleted: () {
//         setState(() {
//           _jobCategoryWidget.removeLast();
//         });
//       },
//       selectedColor: Colors.black54,
//       labelStyle: TextStyle(color: Colors.white),
//       label: Text(
//         _jobCategory == null ? null : Lists.jobCatagories[_jobCategory],
//       ),
//     );
//   }
// }
//
//
// class JobOrganization extends StatefulWidget {
//   @override
//   _JobOrganizationState createState() => _JobOrganizationState();
// }
//
// class _JobOrganizationState extends State<JobOrganization> {
//   @override
//   Widget build(BuildContext context) {
//     return InputChip(
//       isEnabled: true,
//       backgroundColor: Theme.of(context).primaryColor,
//       deleteIconColor: Colors.white,
//       onDeleted: () {
//         setState(() {
//           _jobTypeWidget.removeLast();
//         });
//       },
//       selectedColor: Colors.black54,
//       labelStyle: TextStyle(color: Colors.white),
//       label: Text(
//         _jobType == null ? null : Lists.jobType[_jobType],
//       ),
//     );
//   }
// }
//
// class JobLocation extends StatefulWidget {
//   @override
//   _JobLocationState createState() => _JobLocationState();
// }
//
// class _JobLocationState extends State<JobLocation> {
//   @override
//   Widget build(BuildContext context) {
//     return InputChip(
//       isEnabled: true,
//       backgroundColor: Theme.of(context).primaryColor,
//       deleteIconColor: Colors.white,
//       onDeleted: () {
//         setState(() {
//           _jobLocationWidget.removeLast();
//         });
//       },
//       selectedColor: Colors.black54,
//       labelStyle: TextStyle(color: Colors.white),
//       label: Text(
//         _jobLocation == null ? null : Lists.jobLocation[_jobLocation],
//       ),
//     );
//   }
// }
//
// class JobCountry extends StatefulWidget {
//   @override
//   _JobCountryState createState() => _JobCountryState();
// }
//
// class _JobCountryState extends State<JobCountry> {
//   @override
//   Widget build(BuildContext context) {
//     return InputChip(
//       isEnabled: true,
//       backgroundColor: Theme.of(context).primaryColor,
//       deleteIconColor: Colors.white,
//       onDeleted: () {
//         setState(() {
//           _jobCountryWidget.removeLast();
//         });
//       },
//       selectedColor: Colors.black54,
//       labelStyle: TextStyle(color: Colors.white),
//       label: Text(
//         _jobCountry == null ? null : Lists.countryTitle[_jobCountry],
//       ),
//     );
//   }
// }
//
//
