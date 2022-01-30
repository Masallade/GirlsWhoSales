import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Shortlisted extends StatefulWidget {
  @override
  _ShortlistedState createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       // appBar: header(context,titleText: 'Notifications'),
       body:SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 60,),
             Padding(
               padding: const EdgeInsets.only(left: 20.0),
               child: Align(
                   alignment:Alignment.topLeft,
                   child: Text('Something' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: Colors.blue[800]),)),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20.0),
               child: Align(
                   alignment:Alignment.topLeft,
                   child: Text('About Us', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins',
                       fontSize: 24 ,color: Colors.pinkAccent[200]),)),
             ),
             SizedBox(height: 40,),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Container(
                 height: 400,
                 decoration: BoxDecoration(
                   color: Colors.blue[50],
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: ListTile(
                   leading: CircleAvatar(
                     child: Image.asset('assets/images/splashlogo.png'),backgroundColor: Colors.transparent,),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('jessica K.' , style: TextStyle(fontFamily: 'Poppins',color: Colors.black,),),
            )  ,
                  Icon(Icons.workspaces_outline),
            ],
            ),
                   subtitle: Column(
                     children: [
                       Row(
                         children: [
                           SizedBox(height: 5,),
                           Image.asset('assets/images/location.png'),
                           SizedBox(width: 10,),
                           Text('USA'),
                         ],
                       ),
                      SizedBox(height: 20,),
                       Text('Brands shoot done! Looking forward to the holidays with my family' ,style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w300, color: Colors.black),),
                       SizedBox(height: 30,),

                       Image.asset('assets/images/medal_badge.png')


                     ],
                   ),


                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Container(
                 height: 400,
                 decoration: BoxDecoration(
                   color: Colors.blue[50],
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: ListTile(
                   leading: CircleAvatar(child: Image.asset('assets/images/splashlogo.png'),backgroundColor: Colors.transparent,),
                   title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('jessica K.' , style: TextStyle(fontFamily: 'Poppins',color: Colors.black,),)  ,
                       Icon(Icons.workspaces_outline),
                     ],
                   ),
                   subtitle: Column(
                     children: [
                       Row(
                         children: [
                           SizedBox(height: 5,),
                           Image.asset('assets/images/location.png'),
                           SizedBox(width: 10,),
                           Text('USA'),
                         ],
                       ),
                       SizedBox(height: 20,),
                       Text('Brands shoot done! Looking forward to the holidays with my family' ,style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w300, color: Colors.black),),
                       SizedBox(height: 30,),

                       Image.asset('assets/images/medal_badge.png')


                     ],
                   ),


                 ),
               ),
             )
           ],
         ),
       ),
      ),
    );
  }
}

