import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/path_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/http/Requests.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/new_widgets/search_widget.dart';
import 'package:girlzwhosell/user_preferences/user_pref_manager.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/dawood/presentation/job_details/view/job_detail.dart';
import 'package:lottie/lottie.dart';

import '../../../dawood/presentation/resources/color_manager.dart';
import '../../../dawood/presentation/resources/font_manager.dart';
import '../../../dawood/presentation/resources/style_manager.dart';

class JobSearchSecond extends StatefulWidget {
  CurrentUserDetails currentUserDetails;
  JobSearchSecond({required this.currentUserDetails});
  @override
  _JobSearchSecondState createState() => _JobSearchSecondState(currentUserDetails: currentUserDetails);
}

class _JobSearchSecondState extends State<JobSearchSecond> {
  CurrentUserDetails currentUserDetails;
  _JobSearchSecondState({required this.currentUserDetails});

  String location = '';
  List<SearchModel> joblist = [];

  void initState() {
    super.initState();

    init();
    print('searchdetailscreenCV : ${currentUserDetails.cv}');
    print('searchdetailscreenresume : ${currentUserDetails.resumee}');

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
        title: Text(AppString.search)),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: ColorManager.bluePrimary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSize.s14),
                      bottomRight: Radius.circular(AppSize.s14))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: buildSearch(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: buildSearch2(),
                  ),

                ],
              )),
          Expanded(
            child: ListView.builder(
                itemCount: joblist != null ? joblist.length : 0,
                // itemCount: joblist.length == null ? 0 : joblist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: GestureDetector(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetailOne(
                                        uName: currentUserDetails.uName,
                                        password: currentUserDetails.password,
                                        joblist: joblist[index],
                                        userDetails: currentUserDetails.userDetails,
                                        user_Id: currentUserDetails.user_Id,
                                        firstName: currentUserDetails.firstName,
                                        appliedStatus:
                                            jobAppliedDetailModel.applied,
                                        jobid: joblist[index].id,//jobId
                                        cv: currentUserDetails.cv,
                                        resumee: currentUserDetails.resumee,
                                      )));
                        },
                        child: buildList(joblist[index])),
                  );
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
      this.joblist = search!;
    });
  }

  Widget buildList(SearchModel jobslist) => Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Card(
          child: ListTile(

            leading: jobslist.companyLogo==PathManager.noCompanyLogoErrorHandler ?SizedBox(
              height: AppSize.s50,
              child: LottieBuilder.asset(LottieManager.jobCardViewAnimation),
            ) :Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.pinkPrimary,
                  width: 2
                ),
              ),
              child: Image.network(
                jobslist.companyLogo ?? Placeholder() as String,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
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
                  '\$${jobslist.minSalary ?? " " + jobslist.maxSalary! ?? " "}',
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
