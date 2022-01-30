import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';


class PinkCard extends StatelessWidget {
  final  user_Id;
  final SeekerDetails userDetails;
  PinkCard({this.user_Id,this.userDetails});
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 330,
      height: 150,
     // margin: EdgeInsets.only(right: 15.0),
     // padding: EdgeInsets.all(15.0),
    //  padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.pink[100].withOpacity(0.7),
              borderRadius: BorderRadius.circular(5.0),
            ),
      //      height: 150,
        //    width: SizeConfig.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Saved \n Jobs',
                  style: TextStyle(
                    fontFamily: 'Questrial',
                    color: Colors.pinkAccent[200],
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('${userDetails.firstname}',
                  style: TextStyle(
                    fontFamily: 'Questrial',
                    color: Colors.pinkAccent[200],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}

