// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
// import 'language_proficiency.dart';
//
//
// class AddLanguageProficiency extends StatefulWidget {
//   @override
//   _AddLanguageProficiencyState createState() =>
//       _AddLanguageProficiencyState();
// }
//
// class _AddLanguageProficiencyState extends State<AddLanguageProficiency> {
//
//   List<String> _selectReadingChoice = ['High', 'Medium', 'Low'];
//   int _defaultReadingChoiceIndex;
//   List<String> _selectWritingChoice = ['High', 'Medium', 'Low'];
//   int _defaultWritingChoiceIndex;
//   List<String> _selectSpeakingChoice = ['High', 'Medium', 'Low'];
//   int _defaultSpeakingChoiceIndex;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _defaultReadingChoiceIndex = 0;
//     _defaultWritingChoiceIndex = 0;
//     _defaultSpeakingChoiceIndex = 0;
//   }
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
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Container(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       TextField(
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.teal,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: "Language*",
//                             labelText: 'Language*',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.blueAccent, width: 32.0),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                           )),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             'Reading*',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       Wrap(
//                         spacing: 5.0,
//                         children: List<Widget>.generate(
//                           3,
//                               (int index) {
//                             return ChoiceChip(
//                               label: Text(
//                                 _selectReadingChoice[index],
//                                 style: TextStyle(color: Colors.white, fontSize: 15.0),
//                               ),
//                               backgroundColor: Colors.black26,
//                               padding: EdgeInsets.all(5.0),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0)),
//                               selected: _defaultReadingChoiceIndex == index,
//                               selectedColor: Theme.of(context).primaryColor,
//                               onSelected: (bool selected) {
//                                 setState(() {
//                                   _defaultReadingChoiceIndex = selected ? index : 0;
//                                 });
//                               },
//                             );
//                           },
//                         ).toList(),
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             'Writing*',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       Wrap(
//                         spacing: 5.0,
//                         children: List<Widget>.generate(
//                           3,
//                               (int index) {
//                             return ChoiceChip(
//                               label: Text(
//                                 _selectWritingChoice[index],
//                                 style: TextStyle(color: Colors.white, fontSize: 15.0),
//                               ),
//                               backgroundColor: Colors.black26,
//                               padding: EdgeInsets.all(5.0),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0)),
//                               selected: _defaultWritingChoiceIndex == index,
//                               selectedColor: Theme.of(context).primaryColor,
//                               onSelected: (bool selected) {
//                                 setState(() {
//                                   _defaultWritingChoiceIndex = selected ? index : 0;
//                                 });
//                               },
//                             );
//                           },
//                         ).toList(),
//                       ),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             'Speaking*',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       Wrap(
//                         spacing: 5.0,
//                         children: List<Widget>.generate(
//                           3,
//                               (int index) {
//                             return ChoiceChip(
//                               label: Text(
//                                 _selectSpeakingChoice[index],
//                                 style: TextStyle(color: Colors.white, fontSize: 15.0),
//                               ),
//                               backgroundColor: Colors.black26,
//                               padding: EdgeInsets.all(5.0),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0)),
//                               selected: _defaultSpeakingChoiceIndex == index,
//                               selectedColor: Theme.of(context).primaryColor,
//                               onSelected: (bool selected) {
//                                 setState(() {
//                                   _defaultSpeakingChoiceIndex = selected ? index : 0;
//                                 });
//                               },
//                             );
//                           },
//                         ).toList(),
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
//           context, MaterialPageRoute(builder: (context) => LanguageProficiency())),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
