import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/verified_otp_model.dart';
import 'package:girlzwhosell/screens/intro_pages/Reset_password.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:http/http.dart'as http;


class PhoneVerification extends StatefulWidget {
  final String? user_Id;
  final String? Msg;
PhoneVerification({this.user_Id, this.Msg});
  @override
  _PhoneVerification createState() {
    return _PhoneVerification(user_Id: user_Id);
  }
}

class _PhoneVerification extends State<PhoneVerification> {
  String? user_Id;
  _PhoneVerification({this.user_Id});
 // VerifyPassword verifyPassword;

  bool isRemember = false;
  int themeMode = 0;
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();


  final GlobalKey<FormFieldState<String>> _formKey =
  GlobalKey<FormFieldState<String>>(debugLabel: '_formkey');
  TextEditingController _pinEditingController =
  TextEditingController(text: '');
  bool _enable = true;
   String? Pin;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                  widget.Msg ?? "",
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
                      pin=Pin!;
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    onChanged: (pin) {
                      setState(() {
                        debugPrint('onChanged execute. pin:$pin');
                      });
                      pin =Pin!;
                    },
                    onSaved: (pin) {
                      debugPrint('onSaved pin:$pin');
                      pin =Pin;
                    },
                    validator: (pin) {
                      if (pin!.isEmpty) {
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
                      if(_formKey.currentState!.validate()){
                        verifyOTP().then((value) async{
                          if(value!.status == "100") {
                            final snackBar = SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Invalid OTP!'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          if(value!.status == "200"){
                            // final snackBar = SnackBar(content: Text('OTP Verified!'));
                            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            await  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordPage(user_Id: verifyotp.userId,)));
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
    );
  }

  // ignore: missing_return
  Future <verifyOtp?> verifyOTP() async{
    final url = "https://girlzwhosellcareerconextions.com/API//verify_otp.php";
    try{
      final response = await http.post(Uri.parse(url) , body: {
        'otp': _pinEditingController.text,
      });
      if(response.statusCode == 200){
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        verifyotp = verifyOtp.fromJson(json.decode(response.body));
        return verifyotp;
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }
}
