import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/jobtitle_model.dart';
import 'package:girlzwhosell/model/jobtype_model.dart';
import 'package:girlzwhosell/model/signupotp.dart';
import 'package:girlzwhosell/model/verified_otp_model.dart';
import 'package:girlzwhosell/screens/intro_pages/Reset_password.dart';
import 'package:girlzwhosell/screens/intro_pages/user_type_copy.dart';
import 'package:girlzwhosell/screens/registration/upload_cv.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:http/http.dart'as http;
import 'package:girlzwhosell/utils/willscope.dart';
import '../../model/sign_up_user_model.dart';
import 'package:girlzwhosell/screens/intro_pages/register_success_screen.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';




class OtpVerification extends StatefulWidget {
  String city;
  String firstName;
  String firstName2;
  String email;
  String phonenno;
  String email2;
  String Password;
  String cv;
  String ExperiencenDetail;
  String nationality;
  String resume;
  String title;
  String phone;
  String location;
  String jobtype;
  String Button;
  String industry;
  String jobtypes;
  String joblevel;
  String Month;

  final String user_Id;
  final String Msg;

  OtpVerification({this.user_Id, this.Msg,this.firstName,
    this.firstName2,
    this.nationality,
    this.city,
    this.email,
    this.phonenno,
    this.email2,
    this.Password,
    this.cv,
    this.ExperiencenDetail,
    this.resume,
    this.title,
    this.phone,
    this.location, this.jobtype ,this.Button ,this.jobtypes,this.joblevel,this.industry ,this.Month});
  @override

  _PhoneVerification createState() {
    return _PhoneVerification(
      user_Id: user_Id,
      firstName: firstName,
      firstName2: firstName2,
      email: email,
      phonenno: phonenno,
      email2: email2,
      Password: Password,
      cv: cv,
      city: city,
      nationality : nationality,
      ExperiencenDetail: ExperiencenDetail,
      resume: resume,
      title: title,
      phone: phone,
      location: location,
      jobtype: jobtype,Button: Button ,jobtypes: jobtypes ,joblevel: joblevel , industry: industry ,Month:Month,);
  }

}

class _PhoneVerification extends State<OtpVerification> {
  String user_Id;
  String city;
  String firstName;
  String firstName2;
  String email;
  String phonenno;
  String email2;
  String Password;
  String cv;
  String nationality;
  List<superPowerModel> selecjobsTypes = [];
  List<jobCatagories> selectedJobTitles = [];
  String ExperiencenDetail;
  String resume;
  String title;
  String phone;
  String location;
  String jobtype;
  String Button;
  String industry;
  String jobtypes;
  String joblevel;
  String Month;


  _PhoneVerification({this.user_Id, this.firstName,
    this.city,
    this.firstName2,
    this.email,
    this.phonenno,
    this.email2,
    this.Password,
    this.cv,
    this.ExperiencenDetail,
    this.resume,
    this.title,
    this.phone,
    this.nationality,
    this.location, this.jobtype,this.Button ,this.jobtypes,this.joblevel , this.industry,this.Month,});
  // VerifyPassword verifyPassword;

  bool isRemember = false;
  int themeMode = 0;
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  // Response response1;
  // File _image;
  // FilePickerResult selectedfile;
  // Dio dio = new Dio();
  // String uploadurl = base_url +"signup.php";
  // String progress;

  final GlobalKey<FormFieldState<String>> _formKey =
  GlobalKey<FormFieldState<String>>(debugLabel: '_formkey');
  TextEditingController _pinEditingController =
  TextEditingController(text: '');
  bool _enable = true;
  String Pin;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => utils.onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
          ),
        ) ,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27.5,right: 27.5),
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 2.7,
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                Text(
                  'OTP Verification',
                  style: HeadingStyle,

                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Text(
                    '${widget.Msg}',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 85,
                    height: SizeConfig.safeBlockHorizontal * 20,
                    child: PinInputTextFormField(
                      key: _formKey,
                      pinLength: 4,
                      decoration: new BoxLooseDecoration(
                        textStyle: TextStyle(
                          height: 1.5,
                          fontSize: 24.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        strokeColorBuilder: PinListenColorBuilder(
                          Colors.black,
                          Colors.black,),
                        obscureStyle: ObscureStyle(
                          isTextObscure: false,
                          obscureText: '🤪',
                        ),
                        // hintText: _kDefaultHint,
                      ),
                      controller: _pinEditingController,
                      textInputAction: TextInputAction.go,
                      enabled: _enable,

                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.characters,
                      onSubmit: (pin) {
                        print("gtepin===$pin");
                        pin=Pin;
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
                      onChanged: (pin) {
                        setState(() {
                          debugPrint('onChanged execute. pin:$pin');
                        });
                        pin =Pin;
                      },
                      onSaved: (pin) {
                        debugPrint('onSaved pin:$pin');
                        pin =Pin;
                      },
                      validator: (pin) {
                        if (pin.isEmpty) {
                          setState(() {
                            // _hasError = true;
                          });
                        }
                        setState(() {
                          // _hasError = false;
                        });
                        return null;
                      },
                      cursor: Cursor(
                        width: 2,
                        color: Colors.black,
                        radius: Radius.circular(1),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical* 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 65, 129),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if(_formKey.currentState.validate()){
                          verifyOTP().then((value) async{
                            if(value.status == "100") {
                              final snackBar = SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Invalid OTP!'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            if(value.status == "200"){
                               Navigator.push(
                                   context, MaterialPageRoute(builder: (context) => UserType(userId: signUpverifyOtp.userId,)));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomFilePicker(
                                            jobtype: jobtype,
                                            nationality : nationality,
                                            ExperiencenDetail: ExperiencenDetail,
                                            firstName: firstName,
                                            firstName2: firstName2,
                                            email: email,
                                            email2: email2,
                                            city: city,
                                            phonenno: phonenno,
                                            Button: Button,
                                        jobtypes: jobtypes,
                                        joblevel: joblevel,
                                        industry: industry,
                                        Month: Month,
                                        userId: signUpverifyOtp.userId,
                                          )));
                            }

                          });
                        }
                      },
                      child: ListTile(
                        title: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future <SignUpverifyOtp> verifyOTP() async{
    final url = "https://girlzwhosellcareerconextions.com/API//verify_email_otp.php";
    try{
      final response = await http.post(Uri.parse(url) , body: {
        'otp': _pinEditingController.text,
      });
      if(response.statusCode == 200){
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        signUpverifyOtp = SignUpverifyOtp.fromJson(json.decode(response.body));
        // uploadResume(context);
        return signUpverifyOtp;
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }

  // Future  <RegistrationModel> uploadResume(context) async {
  //   FormData formdata = FormData.fromMap({
  //     "user_id": signUpverifyOtp.userId,//signUpverifyOtp.userId, userId
  //     "firstname": firstName,
  //     "lastname": firstName2,
  //     "email": email,
  //     "password": email2,
  //     "category": Button,
  //     "job_title": jobtype,
  //     "city": city,
  //     "experience": ExperiencenDetail,
  //     // "experience": ExperiencenDetail,
  //     // "education_level": Month,
  //     "expected_salary": "",
  //     "job_type":jobtypes,
  //     "job_level": joblevel,
  //     "job_industry":industry,
  //     "phone": phonenno,
  //     "cv": await _image == null ? "video.mp4" :  MultipartFile.fromFile(
  //         _image.path,
  //         filename: basename(_image.path)
  //       //show only filename from path
  //     ),
  //     "resume": await MultipartFile.fromFile(
  //         selectedfile.files.single.path,
  //         filename: basename(selectedfile.files.single.path)
  //       //show only filename from path
  //     ),
  //     // // "nationality" : basename(selectedfile.files.single.path),
  //   });
  //
  //   response1 = await dio.post(uploadurl,
  //     data: formdata,
  //     onSendProgress: (int sent, int total) {
  //       String percentage = (sent/total*100).toStringAsFixed(2);
  //       setState(() {
  //         progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
  //         //update the progress
  //       });
  //     },);
  //
  //   print("status code is ${response1.statusCode}");
  //
  //   if(response1.statusCode == 200){
  //     print(response1.data);
  //     print("=================Upload User Data=================");
  //     print("name : $signUpverifyOtp.userId");//signUpverifyOtp.userId  ,userId
  //     print("name : $firstName");
  //     print("lastname : $firstName2");
  //     print("nationality on upload cv: $nationality");
  //     print("city : $city");
  //     print("email : $email");
  //     print("pass : $email2");
  //     print("phone : $phonenno");
  //     print("Categoreis : $Button");
  //     print("JobTitle : $jobtype");
  //     print("JobTitle : $jobtypes");
  //     print("JobTitle : $joblevel");
  //     print("JobTitle : $industry");
  //     print("experience : ${ExperiencenDetail}");
  //     registrationModel = RegistrationModel.fromJson(json.decode(response1.data));
  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));
  //     return registrationModel;
  //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSuccessScreen()));
  //     print("hello i am successfully uploaded");
  //     //print response from server
  //   }else{
  //     print("Error during connection to server.");
  //   }
  // }
}
