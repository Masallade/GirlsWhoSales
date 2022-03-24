import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/dashboad_applied_jobs.dart';
import 'package:girlzwhosell/views/RequirementTab.dart';
import 'package:girlzwhosell/views/company_tab.dart';
import 'package:girlzwhosell/views/description_tab.dart';

class TrackApplication extends StatefulWidget {
  final AppliedJobDetails appliedJobDetails;
   TrackApplication ({Key key , this.appliedJobDetails}) : super(key: key);

  @override
  _TrackApplicationState createState() => _TrackApplicationState(appliedJobDetails: appliedJobDetails);
}

class _TrackApplicationState extends State<TrackApplication> {
  final AppliedJobDetails appliedJobDetails;
  _TrackApplicationState({this.appliedJobDetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'Job Detail',
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: DefaultTabController(
      length: 3,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            //SizedBox(height: 10.0),
            Text('You have applied for this job.' ,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black),
            ),
            SizedBox(height: 16,),
            Container(
              height: 52,
              width: 327,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 203, 47, 0.2),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: FittedBox(
                child: Text('${appliedJobDetails.msg}' ,
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.pinkAccent[200]
                ),
                ),
              ),
            ),
            Container(
            //  color: Colors.yellow,
              constraints: BoxConstraints(maxHeight: 350.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Container(
                      width: 70.0,
                      height: 70.0,
                      child: Image.network(
                          '${appliedJobDetails.companyLogo ?? Placeholder()}')),
                  SizedBox(height: 8.0),
                  Text(
                    '${appliedJobDetails.title ?? " "}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24.0,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${appliedJobDetails.companyName ?? " "} ' +
                        '\- ${appliedJobDetails.location ?? " "}',
                    style: TextStyle(
                      fontFamily: 'Questrial',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey[300],
                      fontSize: 16.0,
                      //fontWeight: FontWeight.w700,
                    ),
                    // style: kTitleStyle,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(238, 242, 248, 1.0),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 15, left: 10.0),
                          child: Text(
                            '${appliedJobDetails.jobtype ?? " "}',style: TextStyle(
                            fontFamily: 'Questrial',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(1, 82, 174, 1),
                            fontSize: 16.0,
                            //fontWeight: FontWeight.w700,
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Container(
                      //   height: 50,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //       color: Color.fromRGBO(238, 242, 248, 1.0),
                      //       borderRadius: BorderRadius.circular(12.0)),
                      //   child: Padding(
                      //     padding:
                      //     const EdgeInsets.only(top: 15, left: 10.0),
                      //     child: Text(
                      //       '${appliedJobDetails.type ?? " "}',
                      //       style: TextStyle(
                      //         fontFamily: 'Questrial',
                      //         fontStyle: FontStyle.normal,
                      //         fontWeight: FontWeight.w400,
                      //         color: Colors.blue[800],
                      //         fontSize: 16.0,
                      //         //fontWeight: FontWeight.w700,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$ ${appliedJobDetails.minSalary ?? " "} ' +
                        '\- ${appliedJobDetails.maxSalary ?? " "}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 24.0,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        // side: BorderSide(
                        //   color: Colors.black.withOpacity(.2),
                        // ),
                      ),
                      // borderRadius: BorderRadius.circular(12.0),
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.blueGrey,
                        indicatorColor: Colors.pinkAccent[200],
                        indicatorWeight: 3,
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        // indicator: BoxDecoration(
                        //   color: Colors.blue[800],
                        //   borderRadius: BorderRadius.circular(12.0),
                        // ),
                        tabs: [
                          Tab(text: "Description"),
                          Tab(text: "Requirements"),
                          Tab(text: "Company Info"),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Flexible(
              //  fit: FlexFit.loose,
              child: TabBarView(
                children: [
                  DescriptionTabFive(appliedJobDetails: appliedJobDetails),
                  RequirementsTabFive(appliedJobDetails: appliedJobDetails),
                  CompanyTabFive(appliedJobDetails: appliedJobDetails),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
