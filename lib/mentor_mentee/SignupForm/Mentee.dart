// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin/animation/animation.dart';
import 'package:admin/screens/LoginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';


class SignUPScreen extends StatefulWidget {
  SignUPScreen({Key? key}) : super(key: key);

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final feature = ["Login", "Sign Up"];

  int i = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          extendBody: true,
          //  backgroundColor: Color(0xfffdfdfdf),
            body: i == 1
                ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        // TabBar Code
                        Row(children: [
                          Container(
                            height: height / 15,
                            width: width / 1.7,
                            child: TopAnime(
                              2,
                              5,
                              child: ListView.builder(
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

                                        ///TabunderLine
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
                                width: 60,
                                height: 60,
                                color: Colors.red[400],
                                child: i == 0
                                    ? Image(
                                  image: NetworkImage(
                                      "https://i.pinimg.com/564x/5d/a3/d2/5da3d22d08e353184ca357db7800e9f5.jpg"),
                                )
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
                                RichText(
                                  text: TextSpan(
                                    text: "Hello ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Beautiful,",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Enter your information below to get Registered with Prime Food Distribution",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),





                        SizedBox(
                          height: height / 18,
                        ),





                        // TextFiled
                        Container(
                          width: width / 1.2,
                          height: height / 2.55,
                          child: TopAnime(
                            1,
                            16,
                            curve: Curves.easeInExpo,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  // readOnly: true, // * Just for Debug
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  showCursor: true,
                                  //cursorColor: mainColor,
                                  decoration: kTextFiledInputDecoration,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextField(
                                  // readOnly: true, // * Just for Debug
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    showCursor: true,
                                    //cursorColor: mainColor,
                                    decoration: kTextFiledInputDecoration
                                        .copyWith(labelText: "Password")),
                                SizedBox(
                                  height: 25,
                                ),
                                TextField(
                                  // readOnly: true, // * Just for Debug
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  showCursor: true,
                                  //cursorColor: mainColor,
                                  decoration:
                                  kTextFiledInputDecoration.copyWith(
                                      labelText: "Confirm Password"),
                                ),





                                SizedBox(
                                  height: 5,
                                ),




                                // FaceBook and Google ICon
                                // TopAnime(
                                //   1,
                                //   11,
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
                                //             FontAwesomeIcons.googlePlusG,
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
                  ),




                  // Bottom
                  i == 1
                      ? TopAnime(
                    2,
                    29,
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      height: height / 6,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 43),
                            child: Container(
                                height: height / 9,
                                color:
                                Colors.grey.withOpacity(0.4)),
                          ),
                          Positioned(
                            left: 260,
                            top: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFF5DF24C),
                                    borderRadius:
                                    BorderRadius.circular(12)),
                                width: width / 3.8,
                                height: height / 14,
                                child:Text('Sign Up' ,
                                  textAlign: TextAlign.center,
                                  style:
                                TextStyle(
                                    color: Colors.white,
                                    fontSize: 20),
                                ),
                                // Icon(
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
                      : LoginScreen()
                ],
              ),
            )
                : LoginScreen()
        ),
      ),
    );
  }
}