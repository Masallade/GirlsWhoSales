// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/intro_pages/job_search_all.dart';
// import 'package:qjobs/screens/main_menu/more/setting_details/app_notifications.dart';
// import 'package:qjobs/screens/main_menu/more/setting_details/change_password.dart';
//
// class Settings extends StatefulWidget {
//   @override
//   _SettingsState createState() => _SettingsState();
// }
//
// class _SettingsState extends State<Settings> {
//
//   void _onExitTap(){
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return SimpleDialog(
//             title: Column(
//               children: [
//                 Text(
//                   'Are you sure you want to sign out',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     SizedBox(
//                       child: FlatButton(
//                         child: Text('CANCEL',style: TextStyle(color: Colors.indigo)),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       child: FlatButton(
//                         child: Text('OK',style: TextStyle(color: Colors.indigo)),
//                         onPressed: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder:
//                               (context)=>JobSearchAll()));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//         backgroundColor: Colors.red[200],
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.notifications, color: Colors.black,),
//               title: Text(
//                 'Notification Settings',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               onTap: (){
//                 Navigator.push(context,
//                     MaterialPageRoute(builder:
//                     (context)=>AppNotifications()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.lock, color: Colors.black,),
//               title: Text(
//                 'Changed Password',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               onTap: (){
//                 Navigator.push(context,
//                 MaterialPageRoute(builder:
//                 (context)=>ChangePassword()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app, color: Colors.black,),
//               title: Text(
//                 'Sign Out',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               onTap: _onExitTap,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
