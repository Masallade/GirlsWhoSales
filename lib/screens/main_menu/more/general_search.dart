import 'package:flutter/material.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/new_widgets/search_widget.dart';
import 'package:girlzwhosell/user_preferences/user_pref_manager.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/views/job_detail.dart';

class JobSearchSecond extends StatefulWidget {
  final uName;
  final password;
  final user_Id;
  final String firstName;
//  final cookiee;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  final cv;
  final resume;
  JobSearchSecond(
      {this.uName,
      this.password,
      this.user_Id,
      this.firstName,
      this.jobDetails,
      this.favoriteJobs,
      this.userDetails,
      this.jobId,
      this.cv,
      this.resume});
  @override
  _JobSearchSecondState createState() => _JobSearchSecondState(
      uName: uName,
      password: password,
      user_Id: user_Id,
      firstName: firstName,
      jobDetails: jobDetails,
      favoriteJobs: favoriteJobs,
      userDetails: userDetails,
      jobId: jobId,
      cv: cv,
      resume: resume);
}

class _JobSearchSecondState extends State<JobSearchSecond> {
  final uName;
  final password;
  final user_Id;
  final String firstName;
//  final cookiee;
  final List<JobDetails> jobDetails;
  final List<FavoriteJobs> favoriteJobs;
  final List<SeekerDetails> userDetails;
  final jobId;
  final cv;
  final resume;
  _JobSearchSecondState(
      {this.uName,
      this.password,
      this.user_Id,
      this.firstName,
      this.jobDetails,
      this.favoriteJobs,
      this.userDetails,
      this.jobId,
      this.cv,
      this.resume});

  String location = '';
  List<SearchModel> joblist = [];

  void initState() {
    super.initState();

    init();
    print('searchdetailscreenCV : $cv');
    print('searchdetailscreenresume : $resume');

  }

  Future init() async {
    final search = await Requests.getSearch(location);
    if (search !=   null){
      setState(() {
        joblist = search;
      });
      // setState(() => this.joblist = search);
    }else{
      print("search result is null");
    }

  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContextcontext) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent[200],
        leading: InkWell(
            splashColor: Colors.blue[800],
            onTap: () {
              // Requests.Login(context, u_Name, password,"", false);
              SharedPreferencesManager.getTotalSavedJobs(int.tryParse(user_Id));
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Results",
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  buildSearch(),
                  buildSearch2(),
                ],
              )),
          Expanded(
            child: ListView.builder(
                itemCount: joblist != null ? joblist.length : 0,
                // itemCount: joblist.length == null ? 0 : joblist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobDetailOne(
                                      uName: uName,
                                      password: password,
                                      joblist: joblist[index],
                                      userDetails: userDetails,
                                      user_Id: user_Id,
                                      firstName: firstName,
                                      appliedStatus:
                                          jobAppliedDetailModel.applied,
                                      jobid: joblist[index].id,//jobId
                                      cv: cv,
                                      resumee: resume,
                                    )));
                      },
                      child: buildList(joblist[index]));
                }),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: location,
        hintText: 'Job Title',
        onChanged: searchData,
      );
  Widget buildSearch2() => SearchWidgettwo(
        text: location,
        hintText: 'Location',
        onChanged: searchData,
      );

  Future searchData(String query) async {
    final search = await Requests.getSearch(query);
    if (!mounted) return;
    setState(() {
      this.location = query;
      this.joblist = search;
    });
  }

  Widget buildList(SearchModel jobslist) => Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Card(
          child: ListTile(
            leading: Image.network(
              jobslist.companyLogo ?? Placeholder(),
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Align(
                alignment: Alignment.center,
                child: Text(
                  jobslist.title ?? " ",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16.0,
                    //fontWeight: FontWeight.w700,
                  ),
                )),
            subtitle: Column(
              children: [
                Text(
                  '${jobslist.experience ?? " "}',
                  style: TextStyle(
                    fontFamily: 'Questrial',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                    fontSize: 14.0,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${jobslist.location ?? " "}',
                  style: TextStyle(
                    fontFamily: 'Questrial',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                    fontSize: 14.0,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${jobslist.minSalary ?? " " + jobslist.maxSalary ?? " "}',
                  style: TextStyle(
                    fontFamily: 'Questrial',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                    fontSize: 14.0,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
