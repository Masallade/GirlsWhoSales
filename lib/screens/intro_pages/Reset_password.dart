import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/helpers/svg/svg.dart';
import 'package:girlzwhosell/model/reset_model.dart';
import 'package:girlzwhosell/screens/intro_pages/Successfull_screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';

import 'package:http/http.dart'as http;

class ResetPasswordPage extends StatefulWidget {
  final String user_Id;
  final String Msg;
ResetPasswordPage({this.user_Id,this.Msg});
  @override
  _ResetPasswordPage createState() {
    return _ResetPasswordPage();
  }
}

class _ResetPasswordPage extends State<ResetPasswordPage> {

 // String user_Id;

  GlobalKey<FormState> _form = GlobalKey<FormState>();
  String Password;
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  String email2;
bool _passwordVisible = false;
 //_ResetPasswordPage({});
  Future<bool> _requestPop() {
    Navigator.of(context).pop();

    return new Future.value(false);
  }
  var confirmPass ='';


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
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 30.0,),
        ),
      ) ,
      body: SingleChildScrollView(
        child: Form(
          key: _form,
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
                "Reset Password",
                style: HeadingStyle,

              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  '''Your identity has been verified. 
Set your new password.''',
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

              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: !_passwordVisible,
                  validator: (val) => val.length < 7
                      ? "Password should be atleast 7 characters"
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.pinkAccent[200],
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 18, top: 15.0 ,bottom: 17 ,right: 18),
                      child: SvgWidget(painters: [
                        SvgPathPainter.fill()
                          ..addPath(
                              'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
                          ..color = Color.fromARGB(255, 112, 126, 148),
                      ]),
                    ),
                  ),
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // use the validator to return an error string (or null) based on the input text

                  // onSaved: (value) => setState(() {
                  //   print('SavedPassword: $Password');
                  //   return Password = value;
                  // }
                  // ),
                  // update the state variable when the text changes
                  onChanged: (String changedValue) {
                    email2 = changedValue;
                    setState(() {
                      email2;
                      print('password $email2');
                    });
                  },
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: TextFormField(
                  controller: _confirmPass,
                  // onChanged: (value) {
                  //   Password = value;
                  //   print("confirmpasswordis: $Password");
                  // },

                  validator:(val){
                    confirmPass= val;
                    if(passwordcontroller.text==null)
                      return 'Empty';
                    if(confirmPass!= passwordcontroller.text)
                      return 'Not Match';
                    return null;
                  },
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 18, top: 15.0 ,bottom: 17 ,right: 18),
                      child: SvgWidget(painters: [
                        SvgPathPainter.fill()
                          ..addPath(
                              'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
                          ..color = Color.fromARGB(255, 112, 126, 148),
                      ]),
                    ),
                    hintText: 'Confirm New Password',
                    hintStyle:TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.pinkAccent[200],
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color:Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    //    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 15.0 , color: Colors.black) ,
                  ),
                ),
              ),
              SizedBox(height: 28,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                child: Container(
                  // width:SizeConfig.screenWidth,
                  width: SizeConfig.screenWidth,
                  height:60.0,                  decoration: BoxDecoration(
                  // color:  Colors.red[100],
                  color: Color.fromARGB(255, 255, 65, 129),
                  borderRadius: BorderRadius.circular(5.0),
                  // border: Border.all(color: Theme.of(context).accentColor)),
                ),
                  child: GestureDetector(
                    onTap: () async{
                      if(_form.currentState.validate()){
                        resetPassword().then((value) async{
                          if(value.status == "100") {
                            final snackBar = SnackBar(content: Text('Failed to Update!'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          if(value.status == "200"){
                            // final snackBar = SnackBar(content: Text('Password Updated Successfully!!!!'));
                            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            await  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetSuccessfullScreen()));
                          }
                        });
                      }

                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,),

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

  Future<ResetPasswordModel> resetPassword() async{
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/reset_password.php";
    try{
      final response = await http.post(Uri.parse(url) , body: {
        "id": widget.user_Id,
       "password": email2,
      });
      if(response.statusCode == 200){
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        resetPasswordModel = ResetPasswordModel.fromJson(json.decode(response.body));
        return resetPasswordModel;
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }
}
