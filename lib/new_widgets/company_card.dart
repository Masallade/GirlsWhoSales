import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';


class CompanyCard extends StatelessWidget {
  final JobDetails jobDetails;
  final String userId;
  CompanyCard({this.userId, this.jobDetails});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 288,
        height: 180,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
         color: Color.fromRGBO(1, 82, 174, 1)
          // color: Colors.blue[800],
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                  width: 40,
                  height: 40,
                  child: Image.network(jobDetails.companyLogo ?? Image.asset('assets/images/splashlogo.png'))),
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
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 201, 254, 1),
                              //  color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                            child: Text(
                              '${jobDetails.jobType == null ? '' : jobDetails.jobType}' ,
                              style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(1, 82, 174, 1),
                                fontSize: 12.0,
                                //fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 50,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(154, 201, 254, 1),
                              //  color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                            child: Text(
                              '${jobDetails.type ?? " "}',
                              style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 82, 174, 1),
                              fontSize: 12.0,
                            ),


                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(height: 18.5),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       '${jobDetails.location ?? " "}',
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
                     Align(
                       alignment: Alignment.topLeft,
                       child: Text(
                         '\$${jobDetails.minSalary ?? " "} ' +
                             '- \$${jobDetails.maxSalary ?? " "}',
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
          ],
        )
      ])

      ));
  }
}

class AllJobCard extends StatefulWidget {
  final JobDetails jobDetails;
  final String userId;
  AllJobCard({this.userId, this.jobDetails});

  @override
  State<AllJobCard> createState() => _AllJobCardState();
}

class _AllJobCardState extends State<AllJobCard> {


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 300,
        height: 280,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[300].withOpacity(0.6)),
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(1, 82, 174, 1)
        ),
        child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 60,
                    height: 60,
                    child: Image.network(widget.jobDetails.companyLogo ?? Image.asset('assets/images/splashlogo.png'))),
                title: Column(
                    children: [
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('${widget.jobDetails.title ?? ""}' , style: TextStyle(
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
                          child: Text('${widget.jobDetails.companyName ?? ""}'  ,
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400],
                              fontSize: 14.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Experience ${widget.jobDetails.experience ?? "" }' + ' Years',
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400],
                              fontSize: 14.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height: 50.5,),
                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(154, 201, 254, 1),
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              child: Text(
                                '${widget.jobDetails.jobType == null ? '' : widget.jobDetails.jobType}' ,
                                style: TextStyle(
                                  fontFamily: 'Questrial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(1, 82, 174, 1),
                                  fontSize: 12.0,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(154, 201, 254, 1),
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              child: Text(
                                '${widget.jobDetails.type == null ? '' : widget.jobDetails.type}'
                                ,                           style: TextStyle(
                                fontFamily: 'Questrial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(1, 82, 174, 1),
                                fontSize: 12.0,
                                //fontWeight: FontWeight.w700,
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
                  Text(
                    '${widget.jobDetails.location == null ? '' : widget.jobDetails.location}',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\$${widget.jobDetails.minSalary == null ? '' : widget.jobDetails.minSalary} ' +
                          '- \$${widget.jobDetails.maxSalary == null ? '' : widget.jobDetails.maxSalary}',
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
                ],
              ),
              SizedBox(height: 35,),
              Text('Skills: ${widget.jobDetails.skills}' , style: TextStyle(
                  fontFamily: 'Questrial',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 14.0
              ),)
            ]),
      ),
    );
  }
}
