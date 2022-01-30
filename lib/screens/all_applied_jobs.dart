import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';

import 'package:http/http.dart' as http;

class AllAppliedJobs extends StatefulWidget {
  final user_id;
  const AllAppliedJobs({Key key, this.user_id}) : super(key: key);

  @override
  _AllAppliedJobsState createState() =>
      _AllAppliedJobsState(user_id: user_id);
}

class _AllAppliedJobsState extends State<AllAppliedJobs> {
  final user_id;
  final List<JobDetails> jobDetails;
  _AllAppliedJobsState({this.user_id, this.jobDetails});
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
          'All Jobs',
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: SizeConfig.screenHeight,
              child: ListView.builder(
                  itemCount: jobDetails.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.grey[300]),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetail(jobDetails: jobDetails[index], user_Id:user_id),
                              ),
                            );
                          },
                          child: Card(
                            shape: Border(left: BorderSide(color: Colors.blue[800], width: 5)),
                            elevation: 1.0,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListTile(
                                // leading: Container(
                                //   height: 50,
                                //   width: 50,
                                //     child: Image.network('${base_Url + jobDetails[index].company_logo == null ? '' :base_Url + jobDetails[index].company_logo }')),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    '${jobDetails[index].title}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      //fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${jobDetails[index].experience + ' Year Experience'}',
                                      style: TextStyle(
                                        fontFamily: 'Questrial',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '\$${jobDetails[index].minSalary + '-'}' + '\$${jobDetails[index].maxSalary + '/month'}',
                                      style: TextStyle(
                                        fontFamily: 'Questrial',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}