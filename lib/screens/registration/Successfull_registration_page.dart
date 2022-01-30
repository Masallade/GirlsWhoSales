import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/size_config.dart';

class introSuccessScreen extends StatefulWidget {
  @override
  _introSuccessScreenState createState() => _introSuccessScreenState();
}

class _introSuccessScreenState extends State<introSuccessScreen> {
  //LoginModel loginModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),

            Image.asset(
              'assets/images/successImage.png',scale:1.0,
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
              '''Add an email and password for yourself.
Career connect has some exciting offers in
store for you!''',
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
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: Theme.of(context).accentColor)),
              ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                    // if (key.currentState.validate() && _key.currentState.validate() ) {
                    //   Requests.Login(context, userName, password, false);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return HomePage(
                    //           user_Id: loginModel.seekerDetails[0].id, cookiee: loginModel.message,
                    //           jobDetails: loginModel.jobDetails, favoriteJobs: loginModel.favoriteJobs, userDetails: loginModel.seekerDetails);
                    //     },
                    //   ),
                    // );
                    // Navigate to next page
                    // }
                  },
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to Registration',
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
