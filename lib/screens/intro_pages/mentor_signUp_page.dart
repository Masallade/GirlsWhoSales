import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/helpers/svg/svg.dart';
import 'package:girlzwhosell/model/mentor_model.dart';
import 'package:girlzwhosell/screens/intro_pages/Success_Screen.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:http/http.dart' as http;

class MentorSignUp extends StatefulWidget {
  const MentorSignUp({Key? key}) : super(key: key);

  @override
  _MentorSignUpState createState() => _MentorSignUpState();
}

class _MentorSignUpState extends State<MentorSignUp> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final phoneController = TextEditingController();
  TextEditingController experinceController = TextEditingController();
  TextEditingController c_companyController = TextEditingController();
  TextEditingController c_RoleController = TextEditingController();


  bool isEmail(String input) => EmailValidator.validate(input);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 27.5, right: 27.5),
                child:
                Image.asset('assets/images/logo.png', scale: 2.7,),
              ),
              SizedBox(
                height: 37,
              ),
              Text('Let’s get yourself registered.', style: HeadingStyle),
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
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.pinkAccent[200],
                      controller: fname,
                      keyboardType: TextInputType.text,
                      // validate after each user interaction
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length == fname.text) {
                          return 'Please Provide Your First Name';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 18, top: 17.0, bottom: 17, right: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[300]!.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[300]!.withOpacity(0.6),
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
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 18, top: 17.0, bottom: 17, right: 18),
                          child: Image.asset('assets/images/profile.png' , color: Color.fromARGB(255, 112, 126, 148)),
                        ),
                      ),
                    ),
                  ],
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length == Lname.text) {
                      return 'Please Provide Your Last Name';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 18, top: 17.0, bottom: 17, right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
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
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 17.0, bottom: 17, right: 18),
                      child: Image.asset('assets/images/profile.png' , color: Color.fromARGB(255, 112, 126, 148),),
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
                  controller: c_companyController,
                  keyboardType: TextInputType.text,
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Provide Your Current Company";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 18, top: 17.0, bottom: 17, right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Current Company',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 17.0, bottom: 17, right: 18),
                      child: Icon(Icons.apartment_outlined , color: Color.fromARGB(255, 112, 126, 148)),
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
                  controller: c_RoleController,
                  keyboardType: TextInputType.text,
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Provide Your Current Role";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 18, top: 17.0, bottom: 17, right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Current Role',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 17.0, bottom: 17, right: 18),
                      child: Icon(Icons.emoji_people_rounded , color: Color.fromARGB(255, 112, 126, 148),),
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
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (userName) {
                    if (!isEmail(userName!) && !isPhone(userName)) {
                      return 'Please enter a valid email.';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 18, top: 17.0, bottom: 17, right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 17.0, bottom: 17, right: 18),
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
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (userName) {
                    if (!isPhone(userName!)) {
                      return 'Please enter a valid Phone No.';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 18, top: 17.0, bottom: 17, right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Contact Number',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 17.0, bottom: 17, right: 18),
                      child: Icon(
                        Icons.phone, color: Color.fromARGB(255, 112, 126, 148),
                      ),
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
                  controller: experinceController,
                  keyboardType: TextInputType.number,
                  // validate after each user interaction
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 18, top: 17.0, bottom: 17, right: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[300]!.withOpacity(0.6),
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Sale Experience',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 126, 148),

                      /* letterSpacing: 0.0, */
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 17.0, bottom: 17, right: 18),
                      child: Icon(Icons.volunteer_activism , color: Color.fromARGB(255, 112, 126, 148),),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              //button
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 12, right: 12),
                child: Container(
                  // width:SizeConfig.screenWidth,
                  width: 70,
                  height: 60.0,
                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(5.0),
                    // border: Border.all(color: Theme.of(context).accentColor)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Registration().then((value) async{
                          if(value!.status == 100) {
                            final snackBar = SnackBar(
                              behavior: SnackBarBehavior.floating,
                                content: Text('Email Already Exist'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          if(value!.status == 200){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> successScreen()));
                          }
                        });
                      } else
                        {
                        print('Try Again');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                          'Please Enter The Data Before Proceeding Further!',
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
                            'Register',
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
  Future<mentorModel?> Registration() async{
    final url = "https://girlzwhosellcareerconextions.com/API/mentor_signup.php";
    try{
      final response = await http.post(Uri.parse(url) , body: {
        "first_name": fname.text,
        "last_name": Lname.text,
        "current_company": c_companyController.text,
        "email": emailcontroller.text,
        "current_role": c_RoleController.text,
        "phone": phoneController.text,
        "experience": experinceController.text,
      });
      if(response.statusCode == 200){
        print("Response is: ${response.body}");
        print("Status Code is: ${response.statusCode}");
        mentormodel = mentorModel.fromJson(json.decode(response.body));
        return mentormodel;
      }
    }
    catch(e){
      print("Error in exception::: ${e.toString()}");
    }
  }

}
