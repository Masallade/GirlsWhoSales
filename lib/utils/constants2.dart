
import 'package:flutter/material.dart';
import 'package:girlzwhosell/utils/constants.dart';
//H4=fontsize40, DPA= deepPurpleAccent
final kH4DPATextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: 24.0,
  //fontWeight: FontWeight.w700,
);
final HeadingStyle2 = TextStyle(
  fontFamily: 'Poppins',
  // height: 36,
  height: 1.5,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: 24.0,
  //fontWeight: FontWeight.w700,
);
final HeadingStyle = TextStyle(
  fontFamily: 'Poppins',
 // height: 36,
  height: 1.5,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 24.0,
  //fontWeight: FontWeight.w700,
);
final subtitleStyle = TextStyle(
  fontFamily: 'Questrial',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: Colors.blueGrey[300],
  fontSize: 16.0,
  //fontWeight: FontWeight.w700,
);

//H2=fontsize20, W=white
final kH2WTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);
final kH25WTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
);
final kH15WTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
);
final kH15TTextStyle = TextStyle(
  color: Colors.teal,
  fontSize: 15.0,
);

//H2=fontsize20, B=Black
final kH2BTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
);
//preferred Areas BoxDecoration;
final kBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(7.0),
    border: Border.all(color: Color(0xFF122F51)));
    //border: Border.all(color: Colors.pink));

final kH18BTextStyle = TextStyle(
 // color: Colors.black,
  color: kAccentColor,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);
//final kButtonTextStyle = TextStyle(
//  color: Colors.white,
//  fontSize: 18.0,
//);
//
//final kLabelStyle = TextStyle(
//  color: Colors.white,
//  fontWeight: FontWeight.bold,
//  fontFamily: 'OpenSans',
//);
//
//final kBoxDecorationStyle = BoxDecoration(
//  color: Colors.black54,
//  borderRadius: BorderRadius.all(Radius.circular(30.0)),
//);
//
//class BackgroundWidget extends StatelessWidget {
//  const BackgroundWidget({
//    Key key,
//    @required this.size,
//  }) : super(key: key);
//
//  final Size size;
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: new Image.asset('assets/images/bg.jpg',
//          width: size.width,
//          height: size.height,
//          fit: BoxFit.fill,
//          color: Color.fromRGBO(50, 50, 50, 0.9),
//          colorBlendMode: BlendMode.modulate),
//    );
//  }
//}
//
//const kSendButtonTextStyle = TextStyle(
//  color: Colors.lightBlueAccent,
//  fontWeight: FontWeight.bold,
//  fontSize: 18.0,
//);
//
//const kMessageTextFieldDecoration = InputDecoration(
//  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//  hintText: 'Type your message here...',
//  hintStyle: TextStyle(color: Colors.white,),
//  border: InputBorder.none,
//  focusColor: Colors.white
//);
//
//const kMessageContainerDecoration = BoxDecoration(
//  border: Border(
//    top: BorderSide(color: Colors.white, width: 2.0),
//  ),
//);
//
//const kTextFieldDecoration = InputDecoration(
//  hintText: 'Enter a value',
//  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//  border: OutlineInputBorder(
//    borderRadius: BorderRadius.all(Radius.circular(32.0)),
//  ),
//  enabledBorder: OutlineInputBorder(
//    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//    borderRadius: BorderRadius.all(Radius.circular(32.0)),
//  ),
//  focusedBorder: OutlineInputBorder(
//    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//    borderRadius: BorderRadius.all(Radius.circular(32.0)),
//  ),
//);
