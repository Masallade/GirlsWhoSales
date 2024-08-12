import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/Requests.dart';
import '../../utils/constants.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({Key? key}) : super(key: key);

  @override
  State<SecondSplash> createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getloadinDashboard();
  }

  Future getloadinDashboard()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getBool(KeyisUserAlreadyLogin)!){
     autoLogIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // child: Text('This is a page with a white background'),
      ),
    );
  }


  autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(!prefs.getBool(KeyisUserAlreadyLogin)!)
      return;

    final String? userName = prefs.getString(keyUserName);
    final String? userPass = prefs.getString(KeyUserPassword);

    if (userName != null || userPass != null) {
      setState(() {
        // isLoggedIn = true;
        // email = userName;
        // password = userPass;
        Requests.Login(context, userName, userPass,'',false);
        print("user auto login successsfully");
      });
      return;
    }
    // else{
    //   var duration = const Duration(seconds: 0 );
    //   return Timer(duration, () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) {
    //           return SignInPage();
    //         },
    //       ),
    //     );
    //   });
    // }
  }
}
