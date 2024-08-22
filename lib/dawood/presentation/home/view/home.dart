import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/home/widgets/home_header.dart';
import 'package:girlzwhosell/dawood/presentation/home/widgets/see_all_button.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/routes_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/model/search_model.dart';
import 'package:girlzwhosell/model/total_notification.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/views/job_detail.dart';
import 'package:girlzwhosell/widgets/job_card1.dart';
import '../../resources/style_manager.dart';
import '../../../../user_preferences/user_pref_manager.dart';
import '../../../../screens/main_menu/new_job_details_model.dart';
import 'package:http/http.dart' as http;
class HomeView extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;


  HomeView({Key? key,required this.currentUserDetails}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState(currentUserDetails: currentUserDetails);
}

class _HomeViewState extends State<HomeView> {
  final CurrentUserDetails currentUserDetails;
  _HomeViewState({required this.currentUserDetails});
  String? Location = '';
  String? location = '';
  List<SearchModel> joblist = [];


  @override
  void initState() {

    SharedPreferencesManager.initialize();
    SharedPreferencesManager.getTotalSavedJobs(int.tryParse(currentUserDetails.user_Id));


    print('userid${currentUserDetails.user_Id}');
    print('firstname is: ${currentUserDetails.firstName}');
    print('uName on homesearch : ${currentUserDetails.uName}');
    print('pass on homesearch : ${currentUserDetails.password}');
    //UpdateNotifiction();
    super.initState();
  }

  Future <TotalNotification?> TotalNotifiction() async {
    final url = "https://girlzwhosellcareerconextions.com/API/total_notifications.php?seeker_id=${currentUserDetails.user_Id}";
    try{
      final http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200 ){
        print('response is : ${response.body}');

        totalNotification = TotalNotification.fromJson(json.decode(response.body));
        return totalNotification;
      }
    } catch (e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: FutureBuilder(
        future:TotalNotifiction(),
        builder: (context , snapshot){
          if (snapshot.hasData) {
            Container();
            return  Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: AppSize.s5),
                    homeHeader(context: context, currentUserDetails: currentUserDetails),
                    SizedBox(height: AppSize.s18),
                    // InkWell(
                    //   splashColor: Colors.pinkAccent[200],
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => JobSearchSecond(
                    //               uName: uName,
                    //               password: password,
                    //               user_Id: user_Id,
                    //               firstName: firstName,
                    //               jobDetails: jobDetails,
                    //               favoriteJobs: favoriteJobs,
                    //               userDetails: userDetails,
                    //               jobId: jobId,
                    //               cv: cv,
                    //               resume: resume,
                    //             )));
                    //   },
                    //   child: Container(
                    //     height: 52,
                    //     margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //       color: Colors.white,
                    //       border: Border.all(color: Colors.black26),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 20),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Image.asset(
                    //           'assets/images/search.png',
                    //           color: Colors.black,
                    //         ),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         Text(
                    //           'Job Title',
                    //           style: TextStyle(
                    //               fontFamily: 'Questrial',
                    //               color: Colors.black,
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w400),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 31.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.jobForYou, style: getSfTextBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s18),
                        ),
                        seeAllButton(context: context,onTap: () {Navigator.pushNamed(context, Routes.allJobsPagePath,arguments: currentUserDetails);})
                      ],
                    ),
                    SizedBox(height: 25.5),
                    currentUserDetails.jobDetails == null
                        ? Container(
                      child: Center(
                        child: Text(AppString.noJobAvailable, style:getSfTextBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s18)),
                      ),
                    )
                        : Container(
                      width: SizeConfig.screenWidth,
                      height: 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics:
                          const PageScrollPhysics(), // this for snapping
                          itemCount: currentUserDetails.jobDetails!.length ,
                          itemBuilder: (context, index) =>  GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(
                                      uName: currentUserDetails.uName,
                                      password: currentUserDetails.password,
                                      firstName: currentUserDetails.firstName,
                                      jobDetails: currentUserDetails.jobDetails![index],
                                      userDetails: currentUserDetails.userDetails,
                                      user_Id: currentUserDetails.user_Id,
                                      appliedStatus:
                                      jobAppliedDetailModel.applied,
                                      jobid: currentUserDetails.jobDetails![index].id,//c
                                      cv: currentUserDetails.cv,
                                      resumee: currentUserDetails.resumee,
                                    ),
                                  ),
                                );
                              },
                              child: CompanyCard(
                                jobDetails: currentUserDetails.jobDetails![index],
                                userId: currentUserDetails.user_Id,
                              ))
                              // : GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => JobDetail(
                              //         uName: uName,
                              //         password: password,
                              //         firstName: firstName,
                              //         jobDetails: jobDetails![index],
                              //         userDetails: userDetails,
                              //         user_Id: user_Id,
                              //         appliedStatus:
                              //         jobAppliedDetailModel.applied,
                              //         jobid: jobDetails![index].id,//jobDetails[index].id
                              //         cv: cv,
                              //         resumee: resume,
                              //       ),
                              //     ),
                              //   );
                              // },
                              // child: CompanyCard2(
                              //   jobDetails: jobDetails![index],
                              //   userId: user_Id,
                              // ))
                      ),
                    ),
                    SizedBox(height: 31.0),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "${AppString.saved} ${AppString.jobs}",
                          style: getSfTextBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s18)
                        ),
                      ),
                seeAllButton(context: context,onTap: () {Navigator.pushNamed(context, Routes.allSavedJobsPagePath,arguments: currentUserDetails);})

                    ]),
                    SizedBox(height: 12.5),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: currentUserDetails.favoriteJobs == null//Requests.updatefavoriteJobs , favoriteJobs
                            ? Container(
                          child: Center(
                            child: Text(
                              'No Saved Jobs!',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        )
                            : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: currentUserDetails.favoriteJobs!//Requests.updatefavoriteJobs,favoriteJobs
                              .asMap()
                              .entries
                              .map(
                                (item) => Container(
                              padding: EdgeInsets.only(right: 16),
                              child: JobCard1(
                                favoriteJobs: item.value,
                                user_Id: currentUserDetails.user_Id,
                                uName: currentUserDetails.uName,
                                password: currentUserDetails.password,
                                firstName: currentUserDetails.firstName,
                                jobDetails: currentUserDetails.jobDetails,
                                userDetails: currentUserDetails.userDetails,
                                jobId: currentUserDetails.jobId,
                                cv: currentUserDetails.cv,
                                resume: currentUserDetails.resumee,
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else {
            return
               /// Container();
              Center(
                child: Text('Loading ...' ,  style: TextStyle(
                    fontFamily: 'Questrial',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent[200]

                ),),);
                //CircularProgressIndicator(color: Colors.pinkAccent[200],));
          }

        },
      ),
    );
  }
  List<New_Job_Details>? jobDetailsList;

  Future<List<New_Job_Details>?> getalljobDetails()async{
    var request = http.Request('GET', Uri.parse('https://girlzwhosellcareerconextions.com/API/jobs_filtered.php?$currentUserDetails.user_Id'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("================+++++++++++++++===============================");
      print(await response.stream.bytesToString());
      String responseBody = await response.stream.bytesToString();
      List<dynamic> jsonList = json.decode(responseBody);

      jobDetailsList = jsonList
          .map((json) => New_Job_Details.fromJson(json))
          .toList();

      return jobDetailsList;
      
    }
    else {
      print(response.reasonPhrase);
      return [];
    }

  }




}

