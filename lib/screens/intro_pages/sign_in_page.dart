import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/helpers/svg/svg.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/screens/intro_pages/Forget_password.dart';
import 'package:girlzwhosell/screens/intro_pages/user_type_copy.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String userName;
  String password;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _passwordVisible = false;

  final _key = GlobalKey<FormFieldState>();
  final key = GlobalKey<FormFieldState>();

  bool isEmail(String input) => EmailValidator.validate(input);
  bool isPhone(String input) => RegExp(
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
  ).hasMatch(input);

  ///For AutoLogin

  bool remember = false;
  bool isLoggedIn = false;


  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String token1;
  Future getToken() async{
    await _firebaseMessaging.getToken().then((token) {
      print(" Token is :$token");
      setState(() {
        token1 = token;
      });
    } );
  }




  String txt = 'Hi there! Welcome';
  String txt2 = "we're so happy to see you!";

  bool ViewWidget= false;
  void show(){

    setState(() {
      ViewWidget=true;
    });

  }
  void hide(){

    setState(() {
      ViewWidget=false;

    });

  }

  void initState() {
    super.initState();
    getToken();
 //   print(uName);
   // print(pass);
  }
  void _doSomething() {
    setState(() {
      txt = 'Welcome';
      txt2 = 'Please Enter Your Registered \n Email And Password';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool passwordVisible =false;
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: GestureDetector(
    //     onTap: () => FocusScope.of(context).unfocus(),
    //     child: SingleChildScrollView(
    //     //  physics: AlwaysScrollableScrollPhysics(),
    //       child: Column(
    //         children: [
    //           SizedBox(height: 80,),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 27.5,right: 27.5),
    //             child: Image.asset(
    //               'assets/images/logo.png',scale:2.5,
    //             ),
    //           ),
    //           SizedBox(height: 40,),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 30.0 , right: 30.0),
    //             child: Text(txt, style: HeadingStyle,),
    //           ),
    //           SizedBox(height: 20,),
    //           Align(
    //               alignment: Alignment.center,
    //               child: Padding(
    //                 padding: const EdgeInsets.only(left: 35.0 , right: 35.0),
    //                 child: Text(txt2 ,style: subtitleStyle, textAlign: TextAlign.center,),
    //               )),
    //           SizedBox(height: 30,),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 12.0 , right: 12,),
    //             child:
    //        //     !isLoggedIn ?
    //             TextFormField(
    //               cursorColor: Colors.pinkAccent[200],
    //               onTap: (){
    //                 _doSomething();
    //               },
    //               onChanged: (value) {
    //                 userName = value;
    //               },
    //               key: key,
    //               validator: (userName) {
    //                 if (!isEmail(userName) && !isPhone(userName)) {
    //                   return  'Please enter a valid email or phone number.';
    //                 } else
    //                   return null;
    //               },
    //
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
    //                 prefixIcon: Padding(
    //                   padding: const EdgeInsets.only(left: 18, top: 15.0 ,bottom: 17 ,right: 18),
    //                   child: SvgWidget(painters: [
    //                     SvgPathPainter.fill()
    //                       ..addPath(
    //                           'M14.1973 0C17.398 0.00978563 19.9903 2.6212 20 5.84554L20 7.30693L19.9935 7.40366C19.9467 7.75162 19.6506 8.0198 19.2923 8.0198L19.2835 8.00198L19.1721 7.9931C19.0257 7.96959 18.8893 7.90014 18.7831 7.79319C18.6504 7.6595 18.5759 7.47817 18.5759 7.28911L18.5759 5.84554C18.5519 3.41955 16.6055 1.45879 14.1973 1.43465L5.80274 1.43465C3.39451 1.45879 1.44811 3.41955 1.42415 5.84554L1.42415 12.1545C1.44811 14.5805 3.39451 16.5412 5.80274 16.5653L14.1973 16.5653C16.6055 16.5412 18.5519 14.5805 18.5759 12.1545C18.6163 11.7891 18.923 11.5127 19.2879 11.5127C19.6529 11.5127 19.9595 11.7891 20 12.1545C19.9903 15.3788 17.398 17.9902 14.1973 18L5.80274 18C2.6 17.9951 0.00487111 15.3808 0 12.1545L0 5.84554C0 2.61714 2.59798 0 5.80274 0L14.1973 0ZM4.29443 5.38693C4.4807 5.36682 4.66718 5.4229 4.81203 5.54257L8.96948 8.85743C9.48881 9.2679 10.2193 9.2679 10.7386 8.85743L14.8518 5.54257L14.8607 5.54257L14.9474 5.48292C15.2462 5.30809 15.6345 5.3726 15.8602 5.64951C15.9785 5.798 16.0329 5.988 16.0113 6.17715C15.9897 6.36629 15.8939 6.53888 15.7452 6.65644L11.632 9.9802C10.5862 10.828 9.0954 10.828 8.04954 9.9802L3.92747 6.65644L3.85135 6.58356C3.61891 6.32594 3.59998 5.93 3.82132 5.64951C3.93771 5.50163 4.10817 5.40703 4.29443 5.38693Z')
    //                       ..color = Color.fromARGB(255, 112, 126, 148),
    //                   ]),
    //                 ),
    //                 hintText: 'Email',
    //                 // fillColor: Colors.grey.withOpacity(1) ,
    //
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                   borderSide: BorderSide(
    //                     color: Colors.blueGrey[300],
    //                   ),
    //                 ),
    //
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                   borderSide: BorderSide(
    //                     color: Colors.blueGrey[300],
    //                   ),
    //                 ),
    //               //  labelText: 'Username, Email or Mobile No',
    //                 hintStyle: TextStyle(fontSize: 15 , color: Colors.blueGrey[300],fontFamily: 'Questrial') ,
    //               ),
    //             )
    //       //           : Text('You_are_logged_in',
    //       // //        getTranslated(context, 'You_are_logged_in_as'),
    //       // style: TextStyle(color: Colors.green),),
    //           ),
    //       //    SizedBox(height: 5,),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 12.0 , right: 12, top: 16),
    //             child:
    //             //!isLoggedIn ?
    //             TextFormField(
    //               controller: passwordController,
    //               cursorColor: Colors.pinkAccent[200],
    //               obscureText: !_passwordVisible,
    //               onChanged: (value) {
    //                 password = value;
    //               },
    //               key: _key,
    //               // validator: (password) {
    //               // if (password.isEmpty) {
    //               // return "Please Enter Password";
    //               // } else if (password.length > 9) {
    //               // return "Password must be atleast greater than 7 characters";
    //               //    } else
    //               //     return null;
    //               // },
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
    //                 prefixIcon: Padding(
    //                   padding: const EdgeInsets.only(left: 18, top: 15.0,bottom: 17 ,right: 18),
    //                   child: SvgWidget(painters: [
    //                     SvgPathPainter.fill()
    //                       ..addPath(
    //                           'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
    //                       ..color = Color.fromARGB(255, 112, 126, 148),
    //                   ]),
    //                 ),
    //                 hintText: 'Password',
    //                 suffixIcon: IconButton(
    //                   icon: Icon(
    //                     // Based on passwordVisible state choose the icon
    //                     _passwordVisible
    //                         ? Icons.visibility
    //                         : Icons.visibility_off,
    //                          color: Colors.blue[800],
    //                   ),
    //                   onPressed: () {
    //                     // Update the state i.e. toogle the state of passwordVisible variable
    //                     setState(() {
    //                       _passwordVisible = !_passwordVisible;
    //                     });
    //                   },
    //                 ),
    //
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                   borderSide: BorderSide(
    //                     color: Colors.blueGrey[300],
    //                   ),
    //                 ),
    //
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                   borderSide: BorderSide(
    //                     color: Colors.blueGrey[300],
    //                   ),
    //                 ),
    //              //   labelText: 'Password',
    //                 hintStyle: TextStyle(fontSize: 15.0 , color: Colors.blueGrey[300],fontFamily: 'Questrial') ,
    //               ),
    //             ),
    //             //: Text(''),
    //           ), SizedBox(height: 10,),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 12.0 , right: 12, top: 16),
    //             child: FlutterPwValidator(
    //               controller: passwordController,
    //               minLength: 8,
    //               uppercaseCharCount: 2,
    //               numericCharCount: 3,
    //               specialCharCount: 1,
    //               width: 400,
    //               height: 150,
    //               onSuccess: () {
    //                 print("Matched");
    //                 Scaffold.of(context).showSnackBar(new SnackBar(
    //                     content: new Text("Password is matched")));
    //               },
    //             ),
    //           ),
    //           SizedBox(height: 16,),
    //           //isLoggedIn ?
    //           // GestureDetector(
    //           //   onTap: () => logout(),
    //           //   //     Navigator.push(
    //           //   //   context,
    //           //   //   MaterialPageRoute(
    //           //   //       builder: (context) => ForgotPasswordScreen()),
    //           //   // ),
    //           //   child: Text(
    //           //   'Use_another_account',
    //           //     //  getTranslated(context, 'Use_another_account'),
    //           //     style: TextStyle(decoration: TextDecoration.underline),
    //           //   ),
    //           // ),
    //               //: Text(''),
    //               //,
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.only(right: 12.0),
    //               child: Align(
    //                 alignment: Alignment.topRight,
    //                 child: Text(
    //                   Strings.forgetUsername,style: TextStyle(
    //                   color: Colors.pinkAccent[200],
    //                   fontWeight: FontWeight.w400,
    //                   fontFamily: "Questrial",
    //                   fontStyle: FontStyle.normal,
    //                   fontSize: 16,
    //
    //                 ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //          // SizedBox(height: 28,),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 28 ),
    //             child: Container(
    //               width:SizeConfig.screenWidth,
    //               height: 55.0,
    //               decoration: BoxDecoration(
    //                 // color:  Colors.red[100],
    //                 color: Colors.pinkAccent[200],
    //                 borderRadius: BorderRadius.circular(5.0),
    //                 // border: Border.all(color: Theme.of(context).accentColor)),
    //               ),
    //               child: GestureDetector(
    //                 onTap: () {
    //
    //                   if (key.currentState.validate() && _key.currentState.validate() ) {
    //
    //                     //bool sign_in_succesful = await
    //
    //                     Requests.Login(context, userName, password,token1, false);
    //
    //                     // print('userNameLoginppage : $userName');
    //                     // print('Pasword: $password');
    //                     // print(password);
    //
    //                    //    isLoggedIn ? logout() : loginUser();
    // // if(sign_in_succesful) {
    // //                       loginUser();
    // //
    // //                       Navigator.push(
    // //                         context,
    // //                         MaterialPageRoute(
    // //                           builder: (context) {
    // //                             return HomePage();
    // //                           },
    // //                         ),
    // //                       );
    // //                     }
    //                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));  // Navigate to next page
    //                   }
    //                 },
    //                 child: ListTile(
    //                   title: Center(
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(bottom: 10.0),
    //                       child: Text(
    //                         'Login',
    //                         style:  TextStyle(
    //                           fontFamily: 'Poppins',
    //                           fontStyle: FontStyle.normal,
    //                           fontWeight: FontWeight.w500,
    //                           color: Colors.white,
    //                           fontSize: 17.0,
    //                           //fontWeight: FontWeight.w700,
    //                         ),
    //
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 60,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 "Don't have an account?",
    //                 style: TextStyle(
    //                   color: Colors.blueGrey[300],
    //                   fontFamily: "Questrial",
    //                   fontSize: 16,
    //                   fontStyle: FontStyle.normal,
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //               ),
    //
    //               SizedBox(
    //                 width: 5.0,
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                   print("Register Now");
    //                   // Navigator.push(
    //                   //     context,
    //                   //     MaterialPageRoute(
    //                   //         builder: (context) => NamePage()));
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => UserType()));
    //                 },
    //                 child: Text(
    //                   Strings.createAccount,
    //                     style: TextStyle(
    //                 color: Colors.blue[800],
    //                   fontWeight: FontWeight.w400,
    //                   fontFamily: "Questrial",
    //                   fontStyle: FontStyle.normal,
    //                   fontSize: 16,
    //
    //                 ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //        SizedBox(height: 75,),
    //        // Padding(
    //        //   padding: const EdgeInsets.only(left: 121.0 ,right: 121),
    //        //   child: Container(
    //        //       decoration: BoxDecoration(
    //        //         borderRadius: BorderRadius.only(topRight:Radius.circular(20) , topLeft:Radius.circular(20) )
    //        //       ),
    //        //       child: Divider(thickness: 8, color: Colors.black,height: 5,)),
    //        // )
    //        //    new Container(
    //        //      width: 134,
    //        //        height: 30,
    //        //        decoration: new BoxDecoration(
    //        //            color: Colors.black,
    //        //            borderRadius: new BorderRadius.only(
    //        //              topLeft: const Radius.circular(40.0),
    //        //              topRight: const Radius.circular(40.0),
    //        //            )
    //        //        ),
    //        //    ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: hide,
      child: Scaffold(
       backgroundColor: Colors.white,
        body: new Stack(
            children: [
              Column(
                children: [
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                          child: Image.asset(
                            'assets/images/logo.png',scale:2.5,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0 , right: 30.0),
                          child: Text(txt, style: HeadingStyle,),
                        ),
                        SizedBox(height: 15,),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35.0 , right: 35.0),
                              child: Text(txt2 ,style: subtitleStyle, textAlign: TextAlign.center,),
                            )),
                        SizedBox(height: 30,),
                  Flexible(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: new Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Padding(
                                  padding: const EdgeInsets.only(left: 12.0 , right: 12.0,),
                                  child:
                             //     !isLoggedIn ?
                                  TextFormField(
                                    cursorColor: Colors.pinkAccent[200],
                                    onTap: (){
                                      _doSomething();
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    key: key,
                                    validator: (userName) {
                                      if (!isEmail(userName) && !isPhone(userName)) {
                                        return  'Please enter a valid email or phone number.';
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 18, top: 15.0 ,bottom: 17 ,right: 18),
                                        child: SvgWidget(painters: [
                                          SvgPathPainter.fill()
                                            ..addPath(
                                                'M14.1973 0C17.398 0.00978563 19.9903 2.6212 20 5.84554L20 7.30693L19.9935 7.40366C19.9467 7.75162 19.6506 8.0198 19.2923 8.0198L19.2835 8.00198L19.1721 7.9931C19.0257 7.96959 18.8893 7.90014 18.7831 7.79319C18.6504 7.6595 18.5759 7.47817 18.5759 7.28911L18.5759 5.84554C18.5519 3.41955 16.6055 1.45879 14.1973 1.43465L5.80274 1.43465C3.39451 1.45879 1.44811 3.41955 1.42415 5.84554L1.42415 12.1545C1.44811 14.5805 3.39451 16.5412 5.80274 16.5653L14.1973 16.5653C16.6055 16.5412 18.5519 14.5805 18.5759 12.1545C18.6163 11.7891 18.923 11.5127 19.2879 11.5127C19.6529 11.5127 19.9595 11.7891 20 12.1545C19.9903 15.3788 17.398 17.9902 14.1973 18L5.80274 18C2.6 17.9951 0.00487111 15.3808 0 12.1545L0 5.84554C0 2.61714 2.59798 0 5.80274 0L14.1973 0ZM4.29443 5.38693C4.4807 5.36682 4.66718 5.4229 4.81203 5.54257L8.96948 8.85743C9.48881 9.2679 10.2193 9.2679 10.7386 8.85743L14.8518 5.54257L14.8607 5.54257L14.9474 5.48292C15.2462 5.30809 15.6345 5.3726 15.8602 5.64951C15.9785 5.798 16.0329 5.988 16.0113 6.17715C15.9897 6.36629 15.8939 6.53888 15.7452 6.65644L11.632 9.9802C10.5862 10.828 9.0954 10.828 8.04954 9.9802L3.92747 6.65644L3.85135 6.58356C3.61891 6.32594 3.59998 5.93 3.82132 5.64951C3.93771 5.50163 4.10817 5.40703 4.29443 5.38693Z')
                                            ..color = Color.fromARGB(255, 112, 126, 148),
                                        ]),
                                      ),
                                      hintText: 'Email',
                                      // fillColor: Colors.grey.withOpacity(1) ,

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey[300],
                                        ),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey[300],
                                        ),
                                      ),
                                    //  labelText: 'Username, Email or Mobile No',
                                      hintStyle: TextStyle(fontSize: 15 , color: Colors.blueGrey[300],fontFamily: 'Questrial') ,
                                    ),
                                  )
                            //           : Text('You_are_logged_in',
                            // //        getTranslated(context, 'You_are_logged_in_as'),
                            // style: TextStyle(color: Colors.green),),
                                ), //    SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0 , right: 12, top: 16),
                          child: TextFormField(
                      controller: passwordController,
                      cursorColor: Colors.pinkAccent[200],
                      obscureText: !_passwordVisible,
                      onTap: show,
                      onChanged: (value) {
                        password = value;
                      },
                      key: _key,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18, top: 17.0 ,bottom: 17 ,right: 18),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 18, top: 15.0,bottom: 17 ,right: 18),
                          child: SvgWidget(painters: [
                            SvgPathPainter.fill()
                              ..addPath(
                                  'M8.51321 0C11.48 0 13.897 2.378 13.897 5.301L13.897 6.898C15.697 7.519 17 9.188 17 11.169L17 15.458C17 17.963 14.9286 20 12.3826 20L8.94213 20C8.52134 20 8.17984 19.664 8.17984 19.25C8.17984 18.836 8.52134 18.5 8.94213 18.5L12.3531 18.5C14.0586 18.5 15.4449 17.136 15.4449 15.458C15.4449 15.406 15.4642 15.361 15.4754 15.313L15.4754 11.169C15.4754 9.491 14.0881 8.127 12.3826 8.127L4.61742 8.127C2.91193 8.127 1.52457 9.491 1.52457 11.169L1.52457 15.313C1.53474 15.361 1.55405 15.406 1.55405 15.458C1.55405 17.136 2.94141 18.5 4.6469 18.5C5.06768 18.5 5.40918 18.836 5.40918 19.25C5.40918 19.664 5.06768 20 4.6469 20L4.62657 19.998C4.62352 19.998 4.62047 20 4.61742 20C2.07139 20 0 17.963 0 15.458L0 11.169C0 9.188 1.30198 7.519 3.102 6.898L3.102 5.301C3.11521 2.363 5.53013 0 8.48984 0L8.51321 0ZM8.4998 11.4528C8.92058 11.4528 9.26208 11.7888 9.26208 12.2028L9.26208 14.4238C9.26208 14.8378 8.92058 15.1738 8.4998 15.1738C8.07901 15.1738 7.73751 14.8378 7.73751 14.4238L7.73751 12.2028C7.73751 11.7888 8.07901 11.4528 8.4998 11.4528ZM8.51016 1.5L8.49289 1.5C6.36763 1.5 4.63673 3.194 4.62657 5.284L4.62657 6.627L12.3724 6.627L12.3724 5.301C12.3724 3.205 10.6395 1.5 8.51016 1.5Z')
                              ..color = Color.fromARGB(255, 112, 126, 148),
                          ]),
                        ),
                        hintText: 'Password',
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

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[300],
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[300],
                          ),
                        ),
                     //   labelText: 'Password',
                        hintStyle: TextStyle(fontSize: 15.0 , color: Colors.blueGrey[300],fontFamily: 'Questrial') ,
                      ),
                    ),),
                          new SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  Strings.forgetUsername,style: TextStyle(
                                  color: Colors.pinkAccent[200],
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Questrial",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0 , right: 12, top: 16),
                            child: Visibility(
                              visible: ViewWidget,
                              child: new FlutterPwValidator(
                                controller: passwordController,
                                minLength: 8,
                                specialCharCount: 1,
                                width: 400,
                                height: 70,
                                onSuccess: () {
                                  print("Matched");
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 28 ),
                            child: Container(
                              width:SizeConfig.screenWidth,
                              height: 55.0,
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent[200],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  if (key.currentState.validate() && _key.currentState.validate() ) {
                                    Requests.Login(context, userName, password, token1, false);
                                  }
                                },
                                child: ListTile(
                                  title: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        'Log In',
                                        style:  TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          //fontWeight: FontWeight.w700,
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
                ],
              ),
            ]
        ),
      bottomNavigationBar:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontFamily: "Questrial",
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {
              print("Register Now");
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => NamePage()));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserType()));
            },
            child: Text(
              Strings.createAccount,
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.w400,
                fontFamily: "Questrial",
                fontStyle: FontStyle.normal,
                fontSize: 16,

              ),
            ),
          ),
        ],
      ),
      ),
    );

  }
}






