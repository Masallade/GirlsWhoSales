import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/extension_for_login.dart';
import 'package:girlzwhosell/helpers/svg/svg.dart';
import 'package:girlzwhosell/model/jobtitle_model.dart';
import 'package:girlzwhosell/model/jobtype_model.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/registration/upload_cv.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart'as http;

// ignore: must_be_immutable
class RegistrationPage extends StatefulWidget {
  String firstName;
  String firstName2;
  String email;
  String phonenno;
  String email2;
  String Password;
  String cv;
  String ExperiencenDetail;
  String resume;
  String title;
  String phone;
  String location;
  String jobtype;
  String Button;
  RegistrationPage(
      {this.firstName,
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
      this.location, this.jobtype ,this.Button});

  @override
  _RegistrationPageState createState() => _RegistrationPageState(
      firstName: firstName,
      firstName2: firstName2,
      email: email,
      phonenno: phonenno,
      email2: email2,
      Password: Password,
      cv: cv,
      ExperiencenDetail: ExperiencenDetail,
      resume: resume,
      title: title,
      phone: phone,
      location: location,
  jobtype: jobtype,Button: Button);
}

class _RegistrationPageState extends State<RegistrationPage> {
  String firstName;
  String firstName2;
  String email;
  String phonenno;
  String email2;
  String Password;
  String cv;
  List<superPowerModel> selecjobsTypes = [];
  List<jobCatagories> selectedJobTitles = [];
  String ExperiencenDetail;
  String resume;
  String title;
  String phone;
  String location;
  String jobtype;
  String Button;



  final url = "https://biitsolutions.co.uk/girlzwhosell/API/job_title.php";
  // ignore: deprecated_member_use
  List data = List(); //List of Responsebody
  // ignore: missing_return
  Future<String> getData() async{
    var res = await http.get(Uri.parse(url));
    var resbody = json.decode(res.body);
    setState(() {
      data = resbody;
    });
    print('jobtitle $resbody');
  }




  void initState(){
 super.initState();
  print('jobtitle $jobtype');
  print('jobcategories $Button');
  print('experience $ExperiencenDetail');
  }

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final phoneController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  _RegistrationPageState(
      {this.firstName,
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
        this.location,this.selecjobsTypes,this.selectedJobTitles ,this.jobtype,this.Button});

         bool _passwordVisible=false;
         bool _passwordVisible1 = false;


  var finaldate;

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
      print('date Of Birthday : $finaldate');
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
     initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                child: LinearProgressIndicator(
                  minHeight: 10.0,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                  value: 0.7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 295.0 ,right: 12.0),
                child: Text(
                  '60%',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 37,
              ),
              // PageTitle(titleText: Strings.titleText1, fontSize: 20.0, fontWeight: FontWeight.bold,),
              Text('Now, let’s get you registered.', style: HeadingStyle),
              SizedBox(
                height: 20,
              ),
              Text('Please create an account.',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: subtitleStyle),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 28),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: fname,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (String changedValue) {
                    setState(() {
                      firstName = changedValue;
                    });
                    print('firstName $firstName');
                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: Lname,
                  keyboardType: TextInputType.text,
                  // ignore: missing_return
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  // update the state variable when the text changes
                  onChanged: (String changedValue) {

                    setState(() {
                      firstName2 = changedValue;
                    });
                    print('lastname $firstName2');
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  validator: (userName) {
                    if (!isEmail(userName) && !isPhone(userName)) {
                      return 'Please enter a valid email.';
                    } else
                      return null;
                  },

                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (String changedValue) {

                    setState(() {
                      email = changedValue;

                    });
                    print('email $email');
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                      child: SvgWidget(painters: [
                        SvgPathPainter.fill()
                          ..addPath(
                              'M14.1973 0C17.398 0.00978563 19.9903 2.6212 20 5.84554L20 7.30693L19.9935 7.40366C19.9467 7.75162 19.6506 8.0198 19.2923 8.0198L19.2835 8.00198L19.1721 7.9931C19.0257 7.96959 18.8893 7.90014 18.7831 7.79319C18.6504 7.6595 18.5759 7.47817 18.5759 7.28911L18.5759 5.84554C18.5519 3.41955 16.6055 1.45879 14.1973 1.43465L5.80274 1.43465C3.39451 1.45879 1.44811 3.41955 1.42415 5.84554L1.42415 12.1545C1.44811 14.5805 3.39451 16.5412 5.80274 16.5653L14.1973 16.5653C16.6055 16.5412 18.5519 14.5805 18.5759 12.1545C18.6163 11.7891 18.923 11.5127 19.2879 11.5127C19.6529 11.5127 19.9595 11.7891 20 12.1545C19.9903 15.3788 17.398 17.9902 14.1973 18L5.80274 18C2.6 17.9951 0.00487111 15.3808 0 12.1545L0 5.84554C0 2.61714 2.59798 0 5.80274 0L14.1973 0ZM4.29443 5.38693C4.4807 5.36682 4.66718 5.4229 4.81203 5.54257L8.96948 8.85743C9.48881 9.2679 10.2193 9.2679 10.7386 8.85743L14.8518 5.54257L14.8607 5.54257L14.9474 5.48292C15.2462 5.30809 15.6345 5.3726 15.8602 5.64951C15.9785 5.798 16.0329 5.988 16.0113 6.17715C15.9897 6.36629 15.8939 6.53888 15.7452 6.65644L11.632 9.9802C10.5862 10.828 9.0954 10.828 8.04954 9.9802L3.92747 6.65644L3.85135 6.58356C3.61891 6.32594 3.59998 5.93 3.82132 5.64951C3.93771 5.50163 4.10817 5.40703 4.29443 5.38693Z')
                          ..color = Color.fromARGB(255, 112, 126, 148),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (userName) {
                    if (!isPhone(userName)) {
                      return 'Please enter a valid Phone No.';
                    } else
                      return null;
                  },

                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (String changedValue) {

                    setState(() {
                      phonenno = changedValue;

                    });
                    print('phonenno $phonenno');
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Mobile No',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                      child: Icon(Icons.phone ,  color: Color.fromARGB(255, 112, 126, 148)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: passwordcontroller,
                  obscureText: !_passwordVisible,

                  validator: (v) {
                    if (v.isValidPassword) {
                      return null;
                    } else {
                      return 'Password must contain an uppercase, \n lowercase, numeric digit and special character, \n must be 8 character';
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blue[800],
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
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
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
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

                  // update the state variable when the text changes
                  onChanged: (String changedValue) {

                    setState(() {
                      email2 = changedValue;
                    });
                    print('password $email2');
                  },
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 16),
                child: TextFormField(
                  cursorColor: Colors.pinkAccent[200],
                  controller: confirmPass,
                  obscureText: !_passwordVisible1,
                  validator: (String value) {
                    //   confirmPassword = value;
                    value = value;
                    print('confirm password is: $value');
                    if (value.isValidPassword == null) {
                      return "Please Enter Confrim Password";
                    } else if (value.isValidPassword == passwordcontroller.text) {
                      return "Password Matched";
                    } else if (value != passwordcontroller.text) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300].withOpacity(0.6),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blue[800],
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible1 = !_passwordVisible1;
                        });
                      },
                    ),

                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
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
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 12, right: 12),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 60.0,
                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomFilePicker(
                                      jobtype: jobtype,
                                      ExperiencenDetail: ExperiencenDetail,
                                      firstName: firstName,
                                      firstName2: Lname.text,
                                      email: email,
                                      email2: email2,
                                      phonenno: phonenno,
                                      Button: Button,
                                    )));
                      } else {
                        print('Try Again');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                          'Please Enter Your Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        )));
                      }
                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Next',
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
              SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?", style: subtitleStyle),
                  SizedBox(
                    width: 5.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print("Login Now");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.pinkAccent[200],
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
