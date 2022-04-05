import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girlzwhosell/model/Current_password_model.dart';
import 'package:girlzwhosell/model/check_saved_job.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/model/edit_profile_model.dart';
import 'package:girlzwhosell/model/forget_p_model.dart';
import 'package:girlzwhosell/model/job_apply_detail_model.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/mentor_model.dart';
import 'package:girlzwhosell/model/reset_model.dart';
import 'package:girlzwhosell/model/sign_up_user_model.dart';
import 'package:girlzwhosell/model/user_update_profile.dart';
import 'package:girlzwhosell/model/verified_otp_model.dart';
import 'package:girlzwhosell/utils/demo_localization.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final kSpacingUnit = 10.00.w;

const String base_url = "https://biitsolutions.co.uk/girlzwhosell/API/";

JobAppliedDetailModel jobAppliedDetailModel =JobAppliedDetailModel();
CheckSaved checkSaved = CheckSaved();
ForgetPasswordModel forgetPasswordModel =ForgetPasswordModel();
verifyOtp verifyotp =verifyOtp();
ResetPasswordModel resetPasswordModel = ResetPasswordModel();
CurrentPasswordModel currentPasswordModel =CurrentPasswordModel();
EditProfileModel editProfileModel = EditProfileModel();
SeekerDetails seekerDetails = SeekerDetails();
SharedPreferences prefs;




mentorModel mentormodel = mentorModel();
RegistrationModel registrationModel = RegistrationModel();
AppliedJobDetails appliedJobDetail = AppliedJobDetails();
fetchAppliedJobsModel fetchAppliedJobs = fetchAppliedJobsModel();
UserProfile userprofile  = UserProfile();

  dataSuccessfullyLoaded(BuildContext context, String title, String body, String button) {
// flutter defined function
showDialog(
context: context,
builder: (BuildContext context) {
// return object of type Dialog
return AlertDialog(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(20.0))
),
backgroundColor: Colors.grey,
title: new Text(title),
content: new Text(body),
actions: <Widget>[
// usually buttons at the bottom of the dialog
// ignore: deprecated_member_use
new FlatButton(
child: Container(
margin: EdgeInsets.symmetric(vertical: 10),
padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

decoration: BoxDecoration(
color: Colors.blueGrey,
borderRadius: BorderRadius.circular(18),
),
child: new Text(
button, style: TextStyle(color: Colors.black),)
),
onPressed: () {
Navigator.of(context).pop();
},
),
],
);
},
);
}
  showDialogCustom(BuildContext context, String title, String body, String button) {
// flutter defined function
showDialog(
context: context,
builder: (BuildContext context) {
// return object of type Dialog
return AlertDialog(
title: new Text(title),
content: new Text(body),
actions: <Widget>[
// usually buttons at the bottom of the dialog
// ignore: deprecated_member_use
new FlatButton(
child: new Text(button),
onPressed: () {
Navigator.of(context).pop();
},
),
],
);
},
);
}
  Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
return showDialog<void>(
context: context,
barrierDismissible: false,
builder: (BuildContext context) {
return new WillPopScope(
onWillPop: () async => false,
child: SimpleDialog(
key: key,
backgroundColor: Colors.black54,
children: <Widget>[
Center(
child: Column(children: [
CircularProgressIndicator(),
SizedBox(
height: 10,
),
Text(
"Please Wait....",
style: TextStyle(color: Colors.blueAccent),
)
]),
)
]));
});
}
  String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}















const kSilverColor = const Color(0xFFF6F7FB);
const kAccentColor = const Color(0xFFED5575);
const kPrimaryTextColor = const Color(0xFF211D42);
const kSecondaryTextColor = const Color(0xFFB9B8CD);
final kCardShadow = BoxShadow(
  color: Colors.black,
  blurRadius: 20.w,
  offset: Offset(10.w, 10.w),
);

final kFooterShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.10),
  blurRadius: 50.w,
  offset: Offset(0, -10.w),
);

final kHeadingTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontFamily: 'SF Pro Rounded',
  fontSize: 34.sp,
  fontWeight: FontWeight.w100,
);
final TermsCondition = TextStyle(
  color: Colors.blue,
  fontStyle: FontStyle.normal,
  fontFamily: 'Questrial',
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
final kTitleTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 17.sp,
  fontWeight: FontWeight.w500,
);

final kSubTitleTextStyle = TextStyle(
  color: Colors.black,
  fontStyle: FontStyle.normal,
  fontFamily: "SourceSansPro",
  fontSize: 16,
  fontWeight:
  FontWeight.w500,

);

final kCardTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 15.sp,
  fontWeight: FontWeight.w500,
);

final kBodyTextStyle = TextStyle(
  color: kPrimaryTextColor,
 // color: Colors.black,
  fontWeight: FontWeight.w500,
  fontFamily: "SourceSansPro",
  fontStyle: FontStyle.normal,
  fontSize: 15,
);

final kCaptionTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 12.sp,
);


FloatingActionButton floatingActionButtonNext(BuildContext context, MaterialPageRoute pageRoute) {
  return FloatingActionButton(
    backgroundColor: Colors.red,
    onPressed: () {
      Navigator.push(context, pageRoute);
    },
    child: Icon(
      Icons.arrow_forward,
      size:30.0,
    ),
  );
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: new Image.asset('assets/images/back3.jpg',
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
          color: Color.fromRGBO(255, 255, 255, 0.5),
         colorBlendMode: BlendMode.modulate
          ),
    );
  }
}

class BackButtonPop extends StatelessWidget {
  const BackButtonPop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 30.0,),
        ),
      ),
    );
  }
}


class BackButtonPop2 extends StatelessWidget {
  const BackButtonPop2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}


class PageTitle extends StatelessWidget {
  PageTitle({this.titleText,this.fontSize,this.colour, this.fontStyle , this.fontWeight});

  final String titleText;
  final fontSize;
  final Color colour;
  final FontStyle  fontStyle ;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text(
                    titleText,
                    style: TextStyle(
                      //  color: Theme.of(context).accentColor,
                        fontFamily: "SourceSansPro",
                        fontSize: fontSize,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonInputForm extends StatelessWidget {

  CommonInputForm({this.labelText});

  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      width: SizeConfig.screenWidth,
      height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: kAccentColor
              //   ),
              //   borderRadius:
              //   BorderRadius.all(Radius.circular(10.0)),
              // ),
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
             color: Colors.blue[800],
    ),
    ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue[800],
                  width: 2.0,
                ),
              ),
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 15.0 , color: Colors.black) ,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImageContainer extends StatelessWidget {

  ProfileImageContainer({this.height,this.width,this.backgroundImage});
  final double height;
  final double width;
  final ImageProvider backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        backgroundImage: backgroundImage,
      ),
    );
  }
}

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomeClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//Reuse all about Preferred Area;
class RowPreferredAreas extends StatelessWidget {
  RowPreferredAreas({this.label,this.icon});

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0)),
        icon,
        Text(
            label,
            style: TextStyle(fontSize: 15)
        ),
      ],
    );
  }
}
class PaddingPreferredAreas extends StatelessWidget {
  PaddingPreferredAreas({this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:45.0,top: 10.0),
      child: Container(
        child: Text(
          label,
          style: TextStyle(fontSize: 15),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
class ButtonPaddingPreferredAreas extends StatelessWidget {
  ButtonPaddingPreferredAreas({this.label,this.onPressed});
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left:45.0, top: 10.0),
        child: Container(
          alignment: Alignment.centerLeft,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.lightBlue,
          ),
        )
    );
  }
}
class RowAreas extends StatelessWidget {

  RowAreas({this.label, this.onPressed});
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // ignore: deprecated_member_use
        RaisedButton(
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.cancel),
              ),
            ],
          ),
          onPressed: onPressed,
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ],
    );
  }
}
class ContainerPreferredAreas extends StatelessWidget {

  ContainerPreferredAreas({this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            label,
            style: TextStyle(color: Colors.black38)
        ),
      ),
    );
  }
}
class PaddingEditAreas extends StatelessWidget {

  PaddingEditAreas({this.label, this.onPressed,  this.icon});
  final String label;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(icon,color: Colors.black),
              onPressed: onPressed),
          Text(label)
        ],
      ),
    );
  }
}

//Reuse all about career & application;
class ContainerCareer extends StatelessWidget {

  ContainerCareer({this.initValue});
  final String initValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:40.0),
      child: Container(
        height: 120,
        child: TextFormField(
          initialValue: initValue,
          readOnly: true,
          autofocus: false,
          maxLines: 5,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class ProfileInputField extends StatelessWidget {

  ProfileInputField({this.initValue});
  final String initValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:45.0),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        initialValue: initValue,
        readOnly: true,
        autofocus: false,
        maxLines: 2,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class TextEditingCareer extends StatelessWidget {

  TextEditingCareer({this.label, this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: Colors.blueAccent,),
        hintText: label,
      ),
    );
  }
}
class TextFormFieldEdit extends StatelessWidget {

  TextFormFieldEdit({this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        labelText: label,
      ),
    );
  }
}
class ReuseExpanded extends StatelessWidget {

  ReuseExpanded({this.label, this.colour, this.onPressed, this.colours});
  final String label;
  final Color colour;
  final Color colours;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // ignore: deprecated_member_use
        child: RaisedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(color: colour, fontWeight: FontWeight.bold),
            ),
            color: colours,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )
        )
    );
  }
}

//Reuse all about Contact details;
class ContainerContact extends StatelessWidget {

  ContainerContact({this.hintText, this.icon});
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          hintText: hintText,
        ),
      ),
    );
  }
}
class ContainerEdit extends StatelessWidget {

  ContainerEdit({this.labelText, this.icon, this.onPressed});
  final String labelText;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 200,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left:8.0),
        // ignore: deprecated_member_use
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                labelText,
                style: TextStyle(fontSize: 15.0),
              ),
              Icon(icon, size: 20, color: Colors.blueAccent),
            ],
          ),
          onPressed: onPressed,
          color: Colors.white,
          shape: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: Colors.black54),
              borderRadius:
              BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}


//Reuse all about PersonalDetails;
class ExpandedPersonal extends StatelessWidget {

  ExpandedPersonal({this.labelText, this.colour, this.colours});
  final String labelText;
  final Color colour;
  final Color colours;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: (){},
          child: Text(
            labelText,
            style: TextStyle(color: colour, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: colours,
        )
    );
  }
}
class ReExpanded extends StatelessWidget {

  ReExpanded({this.hint, this.icon});
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon,color: Colors.lightBlue),
          hintText: "National Id No",
        ),
      ),
    );
  }
}

class FieldTitleWithIcon extends StatelessWidget {

  FieldTitleWithIcon({this.title,this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(width: 1.0,),
        Text(title,style: TextStyle(fontSize: 13.0),),
      ],
    );
  }
}

