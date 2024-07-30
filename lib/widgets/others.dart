import 'package:flutter/material.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Image companyLogo(){
  return Image(
    image: AssetImage('assets/images/logo.png'),
    height: SizeConfig.blockSizeVertical * 12,
  );
}

var alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  animationDuration: Duration(milliseconds: 400),
  isCloseButton: false,
);

 // ignore: missing_return
//  Alert onAlertWithCustomContentPressed(context) {
//   Alert(
//       context: context,
//       title: "Manage Resume",
//       style: alertStyle,
//       content: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//               height: 50,
//               // ignore: deprecated_member_use
//               child: InkWell(
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.border_color,
//                       size: 30,
//                       color: kAccentColor,
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           "Edit Resume",
//                           style: TextStyle(fontSize: 18.0, color: kPrimaryTextColor),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 onTap: () {},
//                 textColor: Colors.white,
//                 color: Colors.white,
//                 shape: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         style: BorderStyle.solid,
//                         width: 1.0,
//                         color: Colors.black),
//                     borderRadius: new BorderRadius.circular(15.0)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//               height: 50,
//               // ignore: deprecated_member_use
//               child: FlatButton(
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.upload_file,
//                       size: 30,
//                       color: kAccentColor,
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           "Upload Resume",
//                           style: TextStyle(fontSize: 18.0, color: kPrimaryTextColor),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 onPressed: () {},
//                 textColor: Colors.red[200],
//                 color: Colors.white,
//                 shape: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         style: BorderStyle.solid,
//                         width: 1.0,
//                         color: Colors.black),
//                     borderRadius: new BorderRadius.circular(15.0)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//               height: 50,
//               // ignore: deprecated_member_use
//               child: FlatButton(
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.cloud_upload,
//                       size: 30,
//                       color: kAccentColor,
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           "Upload Resume Video",
//                           style: TextStyle(fontSize: 18.0, color: kPrimaryTextColor),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 onPressed: () {},
//                 textColor: Colors.white,
//                 color: Colors.white,
//                 shape: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         style: BorderStyle.solid,
//                         width: 1.0,
//                         color: Colors.black),
//                     borderRadius: new BorderRadius.circular(15.0)),
//               ),
//             ),
//           ),
//         ],
//       ),
//       buttons: []).show();
// }