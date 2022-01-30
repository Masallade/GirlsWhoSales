import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';


class BlueCard extends StatelessWidget {
  final  user_Id;
  final SeekerDetails userDetails;
  BlueCard({this.user_Id,this.userDetails});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 330,
        height: 150,
        margin: EdgeInsets.only(left:15,right: 15.0),
        //padding: EdgeInsets.all(15.0),
       // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(171, 219, 227, 0.9),
          borderRadius: BorderRadius.circular(5.0),
        ),
      //  height: 150,
        //width: SizeConfig.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Applied \n Jobs',
              style: TextStyle(
                fontFamily: 'Questrial',
                color: Colors.blue[800],
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text('${userDetails.firstname}',
              style: TextStyle(
                fontFamily: 'Questrial',
                color: Colors.blue[800],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}