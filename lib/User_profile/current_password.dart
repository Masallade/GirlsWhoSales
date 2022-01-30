
import 'dart:convert';
import 'package:girlzwhosell/helpers/svg/svg.dart';
import 'package:girlzwhosell/model/Current_password_model.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

class CurrentPassword extends StatefulWidget {
  final user_id;
  const CurrentPassword({Key key, this.user_id}) : super(key: key);

  @override
  _CurrentPasswordState createState() => _CurrentPasswordState(this.user_id);
}

class _CurrentPasswordState extends State<CurrentPassword> {
  final user_id;
  String current_password;
  String NewPassword;
  String confirmPassword;
  TextEditingController Currentpassword= TextEditingController();
  TextEditingController NewPass= TextEditingController();
   TextEditingController ConfirmPass= TextEditingController();
  GlobalKey <FormState> formKey = GlobalKey();
  bool _passwordVisible = false;
  _CurrentPasswordState(this.user_id);

  void initState(){
    super.initState();
    print('userid : $user_id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Change Password',style: TextStyle(
          color: Colors.black,
          height: 1.5,
          fontSize: 20.0,
          fontFamily: 'Questrial',
          fontWeight: FontWeight.w500,
        ),),


      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: Currentpassword,
                  obscureText: !_passwordVisible,
                  validator: (val) => val.length < 7
                      ? "Password should be more than 7 characters"
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),

                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color:Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
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

                    hintText: 'Current Password',
                    hintStyle:TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15.0),
                      child: SvgWidget(painters: [
                        SvgPathPainter.fill()
                          ..addPath(
                              'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
                          ..color = Color.fromARGB(255, 112, 126, 148),
                      ]),
                    ),
                  ),
                ),
              ),
              //  SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: NewPass,
                  obscureText: true,
                  validator: (val) => val.length < 7
                      ? "Your New Password should be more than 7 characters"
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color:Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
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

                    hintText: 'New Password',
                    hintStyle:TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15.0),
                      child: SvgWidget(painters: [
                        SvgPathPainter.fill()
                          ..addPath(
                              'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
                          ..color = Color.fromARGB(255, 112, 126, 148),
                      ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20, top: 20),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller:ConfirmPass,
                  obscureText: !_passwordVisible,
                  validator: (String value) {
                    confirmPassword = value;
                    print('new password is: $confirmPassword');
                    if (confirmPassword ==null) {
                      return "Please Re-Enter to confirm New Password";
                    } else if (value.length < 7) {
                      return "Password must be atleast 7 characters long";
                    } else if (value != NewPass.text) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color:Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
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

                    hintText: 'Confirm New Password',
                    hintStyle:TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15.0),
                      child: SvgWidget(painters: [
                        SvgPathPainter.fill()
                          ..addPath(
                              'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
                          ..color = Color.fromARGB(255, 112, 126, 148),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20 , right: 20),
                child: Container(
                  // width:SizeConfig.screenWidth,
                  width: SizeConfig.screenWidth,
                  height:60.0,                  decoration: BoxDecoration(
                  // color:  Colors.red[100],
                  color: Colors.pinkAccent[200],
                  borderRadius: BorderRadius.circular(5.0),
                  // border: Border.all(color: Theme.of(context).accentColor)),
                ),
                  child: GestureDetector(
                    onTap: (){
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        currentPassword().then((value) {
                          if (value.status == "100") {
                            final Snackbar = SnackBar(
                                content: Text("Fail to change Password"));
                            ScaffoldMessenger.of(context).showSnackBar(Snackbar);
                          }
                          else if(value.status == "200") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PasswordSuccess()));
                            print('Successful');
                          }
                        });
                      }
                      // } else {
                      //   print('Try Again');
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Your Data Before Proceeding Further!' , style: TextStyle(color: Colors.white,
                      //       fontSize: 15,
                      //       fontFamily: 'Poppins'
                      //   ),)));
                      // }
                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Change',
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
  Future<CurrentPasswordModel> currentPassword() async{
    final url = "https://biitsolutions.co.uk/girlzwhosell/API/change_password.php";
    try{
      final response = await http.post(Uri.parse(url) , body: {
         'user_id': user_id,
         'password':Currentpassword.text,
         'newPassword':NewPass.text,
      });
      if(response.statusCode == 200){
        print("Response is: ${user_id}");
        print("password is: ${Currentpassword.text}");
        print("newpass is: ${NewPass.text}");
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        currentPasswordModel = CurrentPasswordModel.fromJson(json.decode(response.body));
        return currentPasswordModel;
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }
}


class PasswordSuccess extends StatelessWidget {
  const PasswordSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),

            Image.asset(
              'assets/images/check-circle.gif',scale:1.0,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '''Successful!''',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.171875,
                fontSize: 24.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 34, 34, 34),

                /* letterSpacing: 0.0, */
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Text(
              '''You have successfully register yourself.''',
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20 , right: 20),
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
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                  },
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to Login',
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
    );
  }

}
