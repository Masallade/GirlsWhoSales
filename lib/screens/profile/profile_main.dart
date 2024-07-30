import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/User_profile/current_password.dart';
import 'package:girlzwhosell/User_profile/user_personal_data.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/profile/cv_update.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import 'help_form.dart';

class ProfileMain extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final String title;
  final profile;
  final List<SeekerDetails> userDetails;
  final city;
  String nationality;

 ProfileMain(
      {Key key,
      this.uName,
      this.password,
      this.user_Id,
      this.userDetails,
      this.firstName,
      this.title,
      this.profile,
        this.nationality,
      this.city})
      : super(key: key);

  @override
  _ProfileMainState createState() => _ProfileMainState(
      this.uName,
      this.password,
      this.user_Id,
      this.firstName,
      this.nationality,
      this.title,
      this.profile,
      this.userDetails,
      this.city);
}

class _ProfileMainState extends State<ProfileMain> {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  String nationality;
  final String title;
  final String profile;
  final String city;

  final List<SeekerDetails> userDetails;

  _ProfileMainState(this.uName, this.password, this.user_Id, this.firstName, this.nationality,
      this.title, this.profile, this.userDetails, this.city);

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
          builder: (context) => AlertDialog(
            elevation: 2.0,
         //   backgroundColor: Colors.pinkAccent.withOpacity(0.9),
            title: Text('Do you want to Log Out this application?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  print("you choose no");
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blue[800],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  logOutUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blue[800],
                ),
              )
            ],
          ),
          context: context,
        ) ??
        false;
  }

  Future logOutUser()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs != null){
      prefs.setBool(KeyisUserAlreadyLogin, false);
    }


  }


  SharedPreferences logindata;
  String username;


  @override
  void initState() {
    super.initState();
    print('${firstName}');
    print('${nationality}');
    print('${profile}');
    print('${title}');
    print('$user_Id');
    print('$uName');
    print('$password');
  //  getUserData();
  }

  void getUserData() async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return WillPopScope(
     onWillPop: ()=>_exitApp(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Requests.Login(context, uName, password, '', false);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "My",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      height: 1.5,
                      fontSize: 20.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.black,
                      height: 1.5,
                      fontSize: 24.0,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: ListTile(
                  leading: ClipOval(
                    child: InkWell(
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => EditProfilePage(
                                   uName: uName,
                                   password: password,
                                   user_Id: user_Id,
                                   profile: profile,
                                   city: city,
                                   nationality: nationality,
                                   userDetails: userDetails),
                           ));
                     },
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            fadeInCurve: Curves.easeInBack,
                            // width: 400,
                            height: 200,
                            placeholder: 'assets/images/loading.gif',
                            placeholderScale: 2.0,
                            fadeOutDuration: Duration(seconds: 2),
                            image: profile ?? Placeholder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      '${firstName ?? " "}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        height: 1.5,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    '${title ?? ""}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      height: 1.5,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: Colors.pinkAccent[200],
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                              uName: uName,
                              password: password,
                              user_Id: user_Id,
                              profile: profile,
                              city: city,
                              nationality: nationality,
                              userDetails: userDetails)
                      ));
                },
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Profile',
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Color.fromRGBO(238, 242, 248, 1),
                  thickness: 1.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CVUpdate(
                              user_id: user_Id,
                              userDetails: userDetails,
                              password: password,
                              uName: uName),
                      ),
                  );
                },
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My CV',
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Color.fromRGBO(238, 242, 248, 1),
                  thickness: 1.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurrentPassword(
                                user_id: user_Id,
                              )));
                },
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Color.fromRGBO(238, 242, 248, 1),
                  thickness: 1.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen(user_Id: user_Id)));
                },
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      totalNotification.totalCountNotf == "0" ?
                      Icon(Icons.arrow_forward_ios) :    badge.Badge(
                          position: BadgePosition.topEnd(top: -20 ,end: 10),
                          badgeStyle: BadgeStyle(badgeColor: Colors.red),
                          // badgeColor: Colors.red,
                          badgeContent: Text('${totalNotification.totalCountNotf == '0' ? '' :totalNotification.totalCountNotf}' , style: TextStyle(color: Colors.white , fontSize: 15),),
                          child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Color.fromRGBO(238, 242, 248, 1),
                  thickness: 1.0,
                ),
              ),
              //tariq  you add here
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpForm()));
                },
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Help Form',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          // totalNotification.totalCountNotf == "0" ?
                          Icon(Icons.arrow_forward_ios),
                              // :    badge.Badge(
                              // position: BadgePosition.topEnd(top: -20 ,end: 10),
                              // badgeStyle: BadgeStyle(badgeColor: Colors.red),
                              // // badgeColor: Colors.red,
                              // badgeContent: Text('${totalNotification.totalCountNotf == '0' ? '' :totalNotification.totalCountNotf}' , style: TextStyle(color: Colors.white , fontSize: 15),),
                              // child: Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Color.fromRGBO(238, 242, 248, 1),
                  thickness: 1.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "ALERT",
                    desc: "Are You Sure You Want To Delete Your Account!",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: (){
                          String Id = user_Id;
                          DeleteAccount(Id);
                        },
                        color: Color.fromRGBO(225, 50, 50, 1.0),
                      ),
                      DialogButton(
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                        // gradient: LinearGradient(colors: [
                        //   Color.fromRGBO(116, 116, 191, 1.0),
                        //   Color.fromRGBO(52, 138, 199, 1.0)
                        // ]),
                      )
                    ],
                  ).show();
                },
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delete Account',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Color.fromRGBO(238, 242, 248, 1),
                  thickness: 1.0,
                ),
              ),
              //tariq  you add here

              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 55.0,
                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Color.fromRGBO(1, 82, 174, 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                   //   logindata.setBool('login', true).whenComplete(() => _exitApp(context));
                      _exitApp(context);
                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Log Out',
                            style: TextStyle(
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
    );
  }


  Future DeleteAccount(String UserId) async {

    CircularProgressIndicator();

    var request = http.MultipartRequest('POST', Uri.parse('https://girlzwhosellcareerconextions.com/API/delete_account.php'));
    request.fields.addAll({
      'seeker_id': UserId
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      Fluttertoast.showToast(msg: "User Deleted Successfully");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SignInPage()));
      // print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
}
