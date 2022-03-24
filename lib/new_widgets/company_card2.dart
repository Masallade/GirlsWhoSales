import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';



class CompanyCard2 extends StatelessWidget {
  final JobDetails jobDetails;
  final String userId;
  CompanyCard2({ this.jobDetails,this.userId});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310,
        height: 168,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color.fromRGBO(189, 51, 98, 1)
          // color: Colors.blue[800],
        ),
        child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 40,
                    height: 40,
                    child: Image.network(jobDetails.companyLogo ?? Placeholder())),
                title: Column(
                    children: [
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('${jobDetails.title ?? ""}' , style: TextStyle(
                          fontFamily: 'Questrial',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 16.0,
                          //fontWeight: FontWeight.w700,
                        ),),
                      ),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('${jobDetails.companyName ?? ""}'  ,
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400],
                              fontSize: 14.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height: 18.5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 175, 195, 1),
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              child: FittedBox(
                                child: Text(
                                  '${jobDetails.jobType == null ? '' : jobDetails.jobType}' ,
                                  style: TextStyle(
                                    fontFamily: 'Questrial',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(189, 51, 98, 1),
                                    fontSize: 12.0,
                                    //fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 175, 195, 1),
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              child: FittedBox(
                                child: Text(
                                  '${jobDetails.type ?? ""}',
                                  style: TextStyle(
                                  fontFamily: 'Questrial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(189, 51, 98, 1),
                                  fontSize: 12.0,
                                  //fontWeight: FontWeight.w700,
                                ),


                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(height: 33.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child : Text(
                      '${jobDetails.location == null ? '' : jobDetails.location}',
                      style: TextStyle(
                        fontFamily: 'Questrial',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14.0,
                        //fontWeight: FontWeight.w700,
                      ),
                      //   style: kTitleStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: FittedBox(
                      child: Text(
                        '\$${jobDetails.minSalary == null ? '' : jobDetails.minSalary + "-"} ' +
                            '\$${jobDetails.maxSalary == null ? '' : jobDetails.maxSalary}',
                        style: TextStyle(
                          fontFamily: 'Questrial',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 14.0,
                          //fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]));
  }
}

class AllJobCard2 extends StatelessWidget {
  final JobDetails jobDetails;
  final String userId;
  AllJobCard2({this.userId, this.jobDetails});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 300,
        height: 300,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6)),
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(189, 51, 98, 1)
        ),
        child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 60,
                    height: 60,
                    child: Image.network(jobDetails.companyLogo ?? Placeholder())),
                title: Column(
                    children: [
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          child: Text('${jobDetails.title ?? ""}' , style: TextStyle(
                            fontFamily: 'Questrial',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16.0,
                            //fontWeight: FontWeight.w700,
                          ),),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            child: Text('${jobDetails.companyName ?? ""}'  ,
                              style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400],
                                fontSize: 14.0,
                                //fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            child: Text('Experience ${jobDetails.experience ?? "" }' + ' Years',
                              style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400],
                                fontSize: 14.0,
                                //fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                      SizedBox(height: 50.5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 175, 195, 1),
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              child: FittedBox(
                                child: Text(
                                  '${jobDetails.jobType == null ? '' : jobDetails.jobType}' ,
                                  style: TextStyle(
                                    fontFamily: 'Questrial',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(189, 51, 98, 1),
                                    fontSize: 12.0,
                                    //fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 175, 195, 1),
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              child: FittedBox(
                                child: Text(
                                  '${jobDetails.type == null ? '' : jobDetails.type}'
                                  ,                           style: TextStyle(
                                  fontFamily: 'Questrial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(189, 51, 98, 1),
                                  fontSize: 12.0,
                                  //fontWeight: FontWeight.w700,
                                ),


                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(height: 33.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      '${jobDetails.location == null ? '' : jobDetails.location}',
                      style: TextStyle(
                        fontFamily: 'Questrial',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14.0,
                        //fontWeight: FontWeight.w700,
                      ),
                      //   style: kTitleStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: FittedBox(
                      child: Text(
                        '\$${jobDetails.minSalary == null ? '' : jobDetails.minSalary } ' +
                            ' - \$${jobDetails.maxSalary == null ? '' : jobDetails.maxSalary}',
                        style: TextStyle(
                          fontFamily: 'Questrial',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 14.0,
                          //fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              FittedBox(
                child: Text('Skills: ${jobDetails.skills}' , style: TextStyle(
                    fontFamily: 'Questrial',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 50.0
                ),),
              )
            ]),
      ),
    );
  }
}

