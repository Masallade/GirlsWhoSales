import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/registration/create_account_page.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/lists.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/utils/strings.dart';


class SkillPage extends StatefulWidget {
  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            BackgroundWidget(size: size),
            BackButtonPop(),
            SizedBox(height: 5.0,),
            Container(
              alignment: Alignment.center,
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only( left: 50.0, right: 50.0,top: 80,bottom: 10),
                    child: LinearProgressIndicator(
                      backgroundColor: Color(0xFFD7D7D7),
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.green),
                      value: 0.4,
                    ),
                  ),
                  PageTitle(titleText: Strings.titleText2, fontSize: 25.0,),
                  Container(
                    height: SizeConfig.screenHeight*.8,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex:3,
                          child: ListView.builder(
                            itemCount: Lists.jobCatagories.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(top:0.0 ,bottom:5.0 ,left: 15.0,right: 15.0),
                                child: Container(
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: Theme.of(context).accentColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:5.0),
                                    child: ListTile(
                                      title: Text('${Lists.jobCatagories[index]}',style: TextStyle(fontSize: 18.0),),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: floatingActionButtonNext(
            context, MaterialPageRoute(builder: (context) => CreateAccountPage())),
      ),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
