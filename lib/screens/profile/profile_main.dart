import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:girlzwhosell/User_profile/current_password.dart';
import 'package:girlzwhosell/User_profile/user_personal_data.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/Notification_screen.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/screens/profile/cv_update.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';



class ProfileMain extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final String firstName;
  final String title;

  final List<SeekerDetails> userDetails;

  const ProfileMain({Key key,this.uName,this.password, this.user_Id, this.userDetails ,this.firstName,this.title}) : super(key: key);

  @override
  _ProfileMainState createState() => _ProfileMainState(this.uName,this.password,this.user_Id, this.userDetails);
}
class _ProfileMainState extends State<ProfileMain> {
  final uName;
  final password;
  final user_Id;


  final List<SeekerDetails> userDetails;

  _ProfileMainState(this.uName,this.password, this.user_Id, this.userDetails);


  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text('Do you want to exit this application?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              print("you choose no");
              Navigator.of(context).pop(false);
            },
            child: Text('No',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue[800],

            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
            },
            child: Text('Yes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue[800],
            ),
          )],
      ), context: context,
    ) ??
        false;
  }
  void initState(){
    super.initState();
    print('$user_Id');
    print('$uName');
    print('$password');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("My" , style: TextStyle(
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
                  child: Text("Profile" , style: TextStyle(
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
              SizedBox(height: 20,),
              Container(
                height: 80,
              //   color: Colors.yellow,
child: ListView.builder(
      itemCount: userDetails == null ? 0 : userDetails.length,
      itemBuilder: (context , index){
        return ListTile(
          leading: Container(
          //  color: Colors.yellow,
            width:80,
            height: 80,
            child: ClipOval(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.network('${userDetails[index].profilePicture }' , fit: BoxFit.cover ,width: 80,height: 80,),
              ),
            ),
          ),
          title: Text('${userDetails[index].firstname}' ,style: TextStyle(
            fontFamily: 'Poppins',
            // height: 36,
            height: 1.5,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.blue[800],
            fontSize: 24.0,
            //fontWeight: FontWeight.w700,
          ),),
          subtitle: Text('${userDetails[index].jobTitle}' ,style: TextStyle(
            fontFamily: 'Poppins',
            // height: 36,
            height: 1.5,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.pinkAccent[200],
            fontSize: 24.0,
            //fontWeight: FontWeight.w700,
          ), ),
        );
      }),
              ),

              SizedBox(height: 40,),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage(uName: uName,password: password, user_Id: user_Id,userDetails: userDetails,)));
                },
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Profile' , style: TextStyle(
                              fontFamily: 'Questrial' ,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CVUpdate(userDetails: userDetails,)));
                },
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Cv' , style: TextStyle(fontFamily: 'Questrial' ,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrentPassword(user_id: user_Id,)));
                },
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Change Password' , style: TextStyle(fontFamily: 'Questrial' , fontSize: 16, color: Colors.black , fontWeight: FontWeight.w400),),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                },
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Notifications' , style: TextStyle(
                              fontFamily: 'Questrial' ,
                              fontSize: 16, color: Colors.black ,
                              fontWeight: FontWeight.w400),),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 ,right: 12.0),
                child: Divider(color: Color.fromRGBO(238, 242, 248, 1),thickness: 1.0,),
              ),
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                child: Container(
                  width:SizeConfig.screenWidth,
                  height: 55.0,
                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Color.fromRGBO(1, 82, 174, 1),
                    borderRadius: BorderRadius.circular(5.0),
                    // border: Border.all(color: Theme.of(context).accentColor)),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _exitApp(context);
                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Logout',
                            style:  TextStyle(
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
        //bottomNavigationBar: BottomInfoBar(),
      ),
    );
  }
}
