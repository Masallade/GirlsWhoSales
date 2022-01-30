import 'package:flutter/material.dart';

Container circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.purple,
      ),
    ),
  );
}

Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.purple,
      ),
    ),
  );
}


Container welcomeProgress(){
  return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:120.0, right: 120.0),
            child: LinearProgressIndicator(
              //backgroundColor: Color(0xFFD7D7D7),
              backgroundColor: Colors.white38,
              color: Colors.redAccent,
            ),
          ),
        ],
      )
  );
}