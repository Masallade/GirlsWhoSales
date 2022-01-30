// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/profile/contact_details/contacts_datails.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/strings.dart';
// import 'package:qjobs/widgets/bottomInfoBar.dart';
// import 'package:qjobs/widgets/header.dart';
//
// class EditContactDetails extends StatefulWidget {
//   @override
//   _EditContactDetailsState createState() => _EditContactDetailsState();
// }
//
// class _EditContactDetailsState extends State<EditContactDetails> {
//   List<Widget> _phoneWidgets = List<Widget>();
//   List<Widget> _emailWidgets = List<Widget>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: header2(context, titleText: Strings.contactDetails,),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
//               ),
//               SizedBox(height: 10.0),
//               PageTitle(
//                   titleText: 'Present Address',fontSize: 25.0
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0)
//                         ),
//                         labelText: "Ditrict*",
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
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0))
//                         ),
//                         labelText: "Police Station*",
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
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0))
//                         ),
//                         labelText: "House No./Road No./Village*",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//
//               PageTitle(
//                   titleText: 'Parmanent Address*',fontSize: 25.0
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0)
//                         ),
//                         labelText: "Ditrict*",
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
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0))
//                         ),
//                         labelText: "Police Station*",
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
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0))
//                         ),
//                         labelText: "House No./Road No./Village*",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               PageTitle(
//                   titleText: 'Mobile Number',fontSize: 25.0
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                           labelText: "Mobile Number*"
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: List.generate(_phoneWidgets.length, (i) {
//                   return _phoneWidgets[i];
//                 }),
//               ),
//               Container(
//                 height: 48.0,
//                 width: 200,
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: EdgeInsets.only(left:8.0),
//                   child: FlatButton(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           "Add Mobile Number",
//                           style: TextStyle(fontSize: 15.0),
//                         ),
//                         Icon(Icons.phone, size: 20, color: Colors.green),
//                       ],
//                     ),
//                       onPressed: () {
//                         setState(() {
//                           _phoneWidgets.add(Phone(
//                             fieldName: 'Phone Number',
//                           ),);
//                         },);
//                       },
//                     color: Colors.white,
//                     shape: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             style: BorderStyle.solid,
//                             width: 1.0,
//                             color: Colors.black54),
//                         borderRadius:
//                         new BorderRadius.circular(10.0)),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               PageTitle(
//                   titleText: 'Email Address',fontSize: 25.0
//               ),
//               SizedBox(height: 10.0),
//               Column(
//                 children: List.generate(_emailWidgets.length, (i) {
//                   return _emailWidgets[i];
//                 }),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                           labelText: "Email Address"
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 48.0,
//                 width: 200,
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: EdgeInsets.only(left:8.0),
//                   child: FlatButton(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           "Add Email Address",
//                           style: TextStyle(fontSize: 15.0),
//                         ),
//                         Icon(Icons.email, size: 20, color: Colors.green),
//                       ],
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _emailWidgets.add(Email(
//                           fieldName: 'Email Address',
//                         ),);
//                       },);
//                     },
//                     color: Colors.white,
//                     shape: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             style: BorderStyle.solid,
//                             width: 1.0,
//                             color: Colors.black54),
//                         borderRadius:
//                         new BorderRadius.circular(10.0)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//         floatingActionButton: floatingActionButtonNext(
//             context, MaterialPageRoute(builder: (context) => ContactDetails())),
//         //bottomNavigationBar: BottomInfoBar(),
//     );
//   }
// }
//
// class Phone extends StatelessWidget{
//   Phone({this.fieldName = ''});
//   final String fieldName;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//       padding: const EdgeInsets.only(top:8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           Expanded(
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                   labelText: "Mobile Number*"
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
// class Email extends StatelessWidget{
//   Email({this.fieldName = ''});
//   final String fieldName;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//       padding: const EdgeInsets.only(top:8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           Expanded(
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                   labelText: "Email Address"
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
