import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/user_type_copy.dart';
import 'package:girlzwhosell/utils/size_config.dart';
class successScreen extends StatefulWidget {
  @override
  _successScreenState createState() => _successScreenState();
}

class _successScreenState extends State<successScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
            ),
            // Image.network('https://www.animatedimages.org/data/media/1574/animated-success-image-0004.gif',scale: 1.0,),
            Image.asset(
              'assets/images/check.gif',scale:0.8,
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

            Text(
              "You've Successfully Registred With GirlzWhoSell \n Team GirlzWhoSell Will Contact You Soon!",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
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
              child: Container(
                width: SizeConfig.screenWidth,
                height:60.0,
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 65, 129),
                borderRadius: BorderRadius.circular(5.0),
              ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserType()));
                  },
                  child: ListTile(
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Proceed to UserPage',
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