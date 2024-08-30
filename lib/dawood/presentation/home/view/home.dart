import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/home/widgets/home_header.dart';
import 'package:girlzwhosell/dawood/presentation/home/widgets/see_all_button.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';
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
import 'package:girlzwhosell/dawood/presentation/job_details/view/job_detail.dart';
import 'package:girlzwhosell/widgets/job_card1.dart';
import 'package:lottie/lottie.dart';
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
            return  Scaffold(
              appBar: AppBar(
                title: Text(AppString.home),
              ),
              backgroundColor: Colors.white,
              body: ListView(
                scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(height: AppSize.s12),
                    homeHeader(context: context, currentUserDetails: currentUserDetails),
                    SizedBox(height: AppSize.s18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.jobForYou, style: getSfTextBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s18),
                          ),
                          seeAllButton(context: context,onTap: () {Navigator.pushNamed(context, Routes.allJobsPagePath,arguments: currentUserDetails);})
                        ],
                      ),
                    ),
                    currentUserDetails.jobDetails == null
                        ? Container(
                      child: Center(
                        child: Text(AppString.noJobAvailable, style:getSfTextBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s18)),
                      ),
                    )
                        : SizedBox(
                          height: 260,
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
                                          currentUserDetails: currentUserDetails,
                                          appliedStatus: jobAppliedDetailModel.applied,
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: CompanyCard(
                                    jobDetails: currentUserDetails.jobDetails![index],
                                    userId: currentUserDetails.user_Id,
                                  ))

                          ),
                        ),
                    SizedBox(height: 31.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text("${AppString.saved} ${AppString.jobs}",
                          style: getSfTextBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s18)),
                        seeAllButton(context: context,onTap: () {Navigator.pushNamed(context, Routes.allSavedJobsPagePath,arguments: currentUserDetails);})
                      ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: currentUserDetails.favoriteJobs == null//Requests.updatefavoriteJobs , favoriteJobs
                    ? Center(child: LottieBuilder.asset(LottieManager.noSavedJobAnimation)):
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:Row(
                          mainAxisSize: MainAxisSize.min,
                          children: currentUserDetails.favoriteJobs!//Requests.updatefavoriteJobs,favoriteJobs
                              .asMap()
                              .entries
                              .map(
                                (item) => Container(
                              padding: EdgeInsets.only(right: 16),
                              child: JobCard1(
                                favoriteJobs: item.value,
                                currentUserDetails: currentUserDetails,),
                            ),
                          ).toList(),
                        ),
                      ),
                    ),
                  ],
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

