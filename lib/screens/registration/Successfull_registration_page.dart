import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/User_profile/user_personal_data.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/size_config.dart';

class introSuccessScreen extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final List<SeekerDetails> userDetails;
  introSuccessScreen({this.uName,this.password ,this.user_Id ,this.userDetails});
  @override
  _introSuccessScreenState createState() => _introSuccessScreenState(uName: uName ,password: password , user_Id: user_Id , userDetails: userDetails);
}

class _introSuccessScreenState extends State<introSuccessScreen> {
  final uName;
  final password;
  final user_Id;
  final List<SeekerDetails> userDetails;
  _introSuccessScreenState ({this.uName,this.password ,this.user_Id ,this.userDetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            Image.asset(
              'assets/images/check-circle.gif',scale:0.8,
            ),
            SizedBox(
              height: 37,
            ),
            SizedBox(
              width: 200,
              child: DefaultTextStyle(
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 34, 34, 34),

                  /* letterSpacing: 0.0, */
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText('Successful' ,
                      duration: Duration(seconds: 5) ,
                      textStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 34, 34, 34),),
                    )],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Text('''Your Profile Has Been Updated.! \n Track Your Profile On Dashboard''',
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
              padding: const EdgeInsets.only(top: 20.0, left: 12 , right: 12),
              child: InkWell(
                onTap: (){
                  Requests.Login(context, uName, password, '', false).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context){
                    return EditProfilePage(uName: uName,password: password,user_Id: user_Id,userDetails: userDetails,);
                  })));
                },
                child: Container(
                  // width:SizeConfig.screenWidth,
                  width: SizeConfig.screenWidth,
                  height:60.0,
                  decoration: BoxDecoration(
                  // color:  Colors.red[100],
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(5.0),
                  // border: Border.all(color: Theme.of(context).accentColor)),
                ),
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to Profile',
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
