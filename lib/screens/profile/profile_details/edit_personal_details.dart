// import 'package:flutter/material.dart';
// import 'package:girlzwhosell/model/login_model.dart';
// import 'package:girlzwhosell/screens/profile/profile_details/personal_details.dart';
// import 'package:girlzwhosell/utils/constants.dart';
// import 'package:girlzwhosell/utils/strings.dart';
// import 'package:girlzwhosell/widgets/header.dart';
// import 'package:intl/intl.dart';
//
//
// class EditPersonalDetails extends StatefulWidget {
//
//
//   final List<SeekerDetails> userDetails;
//
//   const EditPersonalDetails({Key key, this.userDetails}) : super(key: key);
//   @override
//   _EditPersonalDetailsState createState() => _EditPersonalDetailsState(this.userDetails);
// }
//
// class _EditPersonalDetailsState extends State<EditPersonalDetails> {
//
//
//   final List<SeekerDetails> userDetails;
//   DateTime _date = DateTime.now();
//    String userUpdate =
//       'http://ecowhites.com/girlswhosell/API/user_update.php';
//
//   _EditPersonalDetailsState(this.userDetails);
//
//   Future<Null> selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//       context: context,
//       initialDate: _date,
//       firstDate: DateTime(1970),
//       lastDate: DateTime(2100),
//     );
//     if (_date != null && picked != _date) {
//       setState(() {
//         _date = picked;
//       });
//     }
//   }
//    String firstName = "";
//    String lastName = "";
//    String fatherName = "";
//    String motherName = "";
//    String dob = "";
//    String religion = "";
//    String gender = "";
//    String maritalStatus = "";
//    String nationality = "";
//    String nid = "";
//
//  // List<String> _selectGender = ['♂ Male', '♀ Female', ' ⚧  Other'];
//   //int _defaultGenderChoiceIndex;
//
//   List<String> _selectMaritalStatus = ['Single', 'Married', 'Unmarried'];
//   int _defaultMaritalStatusIndex;
//   String errMessage = 'Error Uploading Slip';
//   String status = '';
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //_defaultGenderChoiceIndex = 0;
//     _defaultMaritalStatusIndex = 0;
//   }
//   setStatus(String message) {
//     setState(() {
//       status = message;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     String _formatDate = DateFormat.yMMMd().format(_date);
//     TextEditingController _textFieldController = TextEditingController();
//     return Scaffold(
//       appBar: header2(
//         context,
//         titleText: Strings.personalDetails,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (val){
//                         firstName = val;
//                       },
//                       controller: _textFieldController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         labelText: "First Name",
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (val){
//                         lastName = val;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0))),
//                         labelText: "Last Name",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (val){
//                         fatherName = val;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0))),
//                         labelText: "Father's Name",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (val){
//                         motherName = val;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0))),
//                         labelText: "Mother's Name",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: _InputDropdown(
//                       labelText: "Date of Birth",
//                       valueText: _formatDate,
//                       onPressed: () {
//                         selectDate(context);
//                       },
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   // Expanded(
//                   //   child: TextFormField(
//                   //     onChanged: (val){
//                   //       religion = val;
//                   //     },
//                   //     decoration: InputDecoration(
//                   //       border: OutlineInputBorder(
//                   //           borderRadius:
//                   //               BorderRadius.all(Radius.circular(10.0))),
//                   //       labelText: "Religion",
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               // SizedBox(height: 10.0),
//               // PageTitle(titleText: 'Gender', fontSize: 20.0),
//               SizedBox(height: 10.0),
//               // Wrap(
//               //   spacing: 5.0,
//               //   children: List<Widget>.generate(
//               //     3,
//               //     (int index) {
//               //       return ChoiceChip(
//               //         label: Text(
//               //           _selectGender[index],
//               //           style: TextStyle(color: Colors.white, fontSize: 15.0),
//               //         ),
//               //         backgroundColor: Colors.black26,
//               //         padding: EdgeInsets.all(5.0),
//               //         shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadius.circular(5.0)),
//               //         selected: _defaultGenderChoiceIndex == index,
//               //         selectedColor: Theme.of(context).primaryColor,
//               //         onSelected: (bool selected) {
//               //           setState(() {
//               //             _defaultGenderChoiceIndex = selected ? index : 0;
//               //             gender = _selectGender[index];
//               //           });
//               //         },
//               //       );
//               //     },
//               //   ).toList(),
//               // ),
//               // SizedBox(height: 10.0),
//               PageTitle(titleText: 'Marital Status', fontSize: 20.0),
//               SizedBox(height: 10.0),
//               Wrap(
//                 spacing: 5.0,
//                 children: List<Widget>.generate(
//                   3,
//                       (int index) {
//                     return ChoiceChip(
//                       label: Text(
//                         _selectMaritalStatus[index],
//                         style: TextStyle(color: Colors.white, fontSize: 15.0),
//                       ),
//                       backgroundColor: Colors.black26,
//                       padding: EdgeInsets.all(5.0),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5.0)),
//                       selected: _defaultMaritalStatusIndex == index,
//                       selectedColor: Colors.red[200],
//                       onSelected: (bool selected) {
//                         setState(() {
//                           _defaultMaritalStatusIndex = selected ? index : 0;
//                           maritalStatus = _selectMaritalStatus[index];
//                         });
//                       },
//                     );
//                   },
//                 ).toList(),
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (val){
//                         nationality = val;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0))),
//                         labelText: "Nationality*",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       onChanged: (val){
//                         nid = val;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0))),
//                         labelText: "National Id",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: FloatingActionButton(
//           backgroundColor: Colors.red[200],
//           onPressed: () {
//             uploadPersonalDetails();
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => PersonalDetail(
//                   firstName:firstName,
//                   lastName:lastName,
//                   fatherName:fatherName,
//                   motherName:motherName,
//                   dob:_formatDate,
//                   religion:religion,
//                   gender:gender,
//                   maritalStatus:maritalStatus,
//                   nationality:nationality,
//                   nid:nid
//                 )));
//           },
//           child: Icon(
//             Icons.upload_rounded,
//             size: 40.0,
//           ),
//         ),
//       ),
//       //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
//   uploadPersonalDetails() {
//
//     // http.post(Uri.parse(userUpdate), body: {
//     //   "id": userDetails[0].id,
//     // "firstname": firstName,
//     // "lastname": lastName,
//     // "father_name": fatherName,
//     // "mother_name": motherName,
//     // "dob": _date,
//     // "marital_status": maritalStatus,
//     // "nationality": nationality,
//     // //"nid": nid,
//     //
//     // }).then((result) {
//     //   setStatus(result.statusCode == 200 ? result.body : errMessage);
//     //   if (result.statusCode == 200) {
//     //     Fluttertoast.showToast(
//     //         msg: "${status}",
//     //         toastLength: Toast.LENGTH_LONG,
//     //         gravity: ToastGravity.SNACKBAR,
//     //         timeInSecForIosWeb: 1);
//     //   }
//     // }).catchError((error) {
//     //   setStatus(error);
//     // });
//
//     print('user_name${userDetails[0].id}');
//     print('user_name${firstName}');
//     print('user_name${lastName}');
//     print('user_name${fatherName}');
//     print('user_name${motherName}');
//     print('user_name${maritalStatus}');
//     print('user_name${_date}');
//     print('user_name${nationality}');
//   }
// }
//
// class _InputDropdown extends StatelessWidget {
//   const _InputDropdown(
//       {Key key, this.child, this.labelText, this.valueText, this.onPressed,this.onChanged})
//       : super(key: key);
//
//   final String labelText;
//   final String valueText;
//   final VoidCallback onPressed;
//   final VoidCallback onChanged;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return new InkWell(
//       onTap: onPressed,
//       child: InputDecorator(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0))),
//           labelText: labelText,
//         ),
//         child: new Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             new Text(valueText),
//             new Icon(Icons.calendar_today,
//                 color: Theme.of(context).brightness == Brightness.light
//                     ? Colors.grey.shade700
//                     : Colors.white70),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
