// import 'package:admin/screens/main/main_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);
//
//   @override
//   _MyLoginState createState() => _MyLoginState();
// }
//
// class _MyLoginState extends State<MyLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/images/login.png',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                       top: 60.0,
//                     ),
//                     child: Text(
//                       'Prime Food \n LOGIN',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 35.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5,
//                     left: 35,
//                     right: 35,
//                   ),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           labelStyle: TextStyle(color: Colors.black),
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the password';
//                           } else if (value.length <= 6) {
//                             return 'Password must be greator than 6 digits';
//                           }
//                         },
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           labelStyle: TextStyle(color: Colors.black),
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           // hintText: 'Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 maximumSize: Size(170.0, 90.0),
//                                 minimumSize: Size(170.0, 60.0),
//                                 primary: Colors.black,
//                                 shape: StadiumBorder(),
//                               ),
//                               onPressed: ()
//                               {
//                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 //crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text('LOG IN'),
//                                   Icon(
//                                     Icons.lock,
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               )),
//                         ],
//                       ),
//                       SizedBox(height: 30.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, 'register');
//                             },
//                             child: Text(
//                               'Register',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, 'forgot');
//                             },
//                             child: Text(
//                               'Forgot password?',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/animation/animation.dart';
import 'package:admin/constants.dart';
import 'package:admin/helper/extension_for_validations.dart';
import 'package:admin/screens/LoginScreen/signupScreen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final feature = ["Sign Up as Mentor", "Sign Up as Mentee"];

  int i = 0;
 bool  _passwordVisible = false;
final GlobalKey <FormState> _formKey = GlobalKey();
String error ;

  _validateForm() {
    bool _isValid = _formKey.currentState.validate();

    if ( _isValid == false) {
      setState(() => error = "Please select an option!");
    }

    if (_isValid == true) {
      //form is valid
      print('Form Validate');
    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
         //   backgroundColor: Color(0xfffdfdfdf),
            body: i == 0
                ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          // TabBar Code
                            children: [
                              Container(
                              //  color: Colors.yellow,
                                height: height / 15,
                                width: width / 1.7,
                                child: TopAnime(
                                  2,
                                  5,
                                  child: ListView.builder(
                                    physics: ScrollPhysics(),
                                    itemCount: feature.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            i = index;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Text(
                                                feature[index],
                                                style: TextStyle(
                                                  color: i == index
                                                      ? Colors.white
                                                      : Colors.grey,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            i == index
                                                ? Container(
                                              height: 3,
                                              width: width / 9,
                                              color: Colors.white,
                                            )
                                                : Container(),


                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              // Profile
                              RightAnime(
                                1,
                                15,
                                curve: Curves.easeInOutQuad,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    color: bgColor,
                                    child: i == 0
                                        ?
                                    // Image(
                                    //   image: NetworkImage(
                                    //       "https://i.pinimg.com/564x/5d/a3/d2/5da3d22d08e353184ca357db7800e9f5.jpg"),
                                    // )
                                    Image.asset('assets/images/insta.jpeg')
                                        : Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 30,
                        ),

                        Image.asset('assets/images/finalSplash.png',
                          scale: 2.5,
                        //  color: Colors.white,
                        ),
                        // Top Text
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          width: width,
                          child: TopAnime(
                            1,
                            20,
                            curve: Curves.fastOutSlowIn,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text("Welcome,",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                    )),
                                Text(
                                  "Enter your Login Credentials below",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 14,
                        ),
                        // TextFiled
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                             //   color: Colors.yellow,
                                width: width / 1.2,
                                height: height / 3.10,
                                //  color: Colors.red,
                                child: TopAnime(
                                  1,
                                  15,
                                  curve: Curves.easeInExpo,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        cursorColor: Colors.white,
                                     validator: (v){
                                          if(v!.isValidEmail){
                                            return null;
                                          }
                                          return "please enter a valid email";

                                     },
                                        style:
                                        TextStyle(color: Colors.white),
                                        showCursor: true,
                                        decoration:
                                        kTextFiledInputDecoration,
                                      ),
                                      SizedBox(
                                        height: 18,
                                      ),
                                      TextFormField(
                                          cursorColor: Colors.white,
                                          validator: (v){
                                            if(v!.isValidPassword){
                                              return null;
                                            }
                                            return 'Password must contain an uppercase,\n lowercase, numeric digit and special character' ;
                                          },
                                          style: TextStyle(
                                              color: Colors.white),
                                          showCursor: true,
                                        decoration:
                                        kTextFiledInputDecoration.copyWith(
                                          labelText: 'Password',
                                          suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.white.withOpacity(0.3),
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible = !_passwordVisible;
                                                });
                                              },
                                            ),
                                        ),
                                      ),
                                      // FaceBook and Google ICon
                                      // TopAnime(
                                      //   1,
                                      //   10,
                                      //   child: Row(
                                      //     children: [
                                      //       IconButton(
                                      //         icon: FaIcon(
                                      //           FontAwesomeIcons.facebookF,
                                      //           size: 30,
                                      //         ),
                                      //         onPressed: () {},
                                      //       ),
                                      //       SizedBox(
                                      //         width: 15,
                                      //       ),
                                      //       IconButton(
                                      //         icon: FaIcon(
                                      //             FontAwesomeIcons
                                      //                 .googlePlusG,
                                      //             size: 35),
                                      //         onPressed: () {},
                                      //       ),
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Bottom
                  i == 0
                      ? TopAnime(
                    2,
                    20,
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      height: height / 6,
                     // color: Colors.red,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 30,
                            top: 5,
                            child: Text(
                              "Fogot Password?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              //incresing or dec the height of contaiber
                                height: height / 5.5,
                                color:
                                Colors.grey.withOpacity(0.4)),
                          ),
                          Positioned(
                            left: 260,
                            top: 2,
                            child: GestureDetector(
                              onTap: (){
                               _validateForm();
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFF5DF24C),
                                    borderRadius:
                                    BorderRadius.circular(12)),
                                width: width / 3.8,
                                height: height / 14,
                                child:Text('Sign In' ,
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                // width: width / 4,
                                // height: height / 12,
                                // child: Icon(
                                //   Icons.arrow_forward,
                                //   size: 35,
                                //   color: Colors.white,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      : SignUPScreen()
                ],
              ),
            )
                : SignUPScreen()),
      ),
    );
  }
}