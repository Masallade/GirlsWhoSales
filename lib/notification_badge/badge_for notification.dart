import 'package:flutter/material.dart';
class NotificationBadge extends StatelessWidget {
  NotificationBadge({Key? key , this.totalNotifications}) : super(key: key);
final int? totalNotifications;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.pinkAccent[200],
        shape:BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("$totalNotifications" , style: TextStyle(color: Colors.white , fontFamily: 'Poppins' , fontSize: 20),),
        ),
      ),

    );
  }
}
