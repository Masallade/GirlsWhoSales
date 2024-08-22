// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:qjobs/model/login_model.dart';
// import 'package:qjobs/screens/intro_pages/sign_in_page.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_content.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_header.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_popular_jobs.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_recent_jobs.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_sub_header.dart';
// import 'package:qjobs/screens/profile/dashboard.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/size_config.dart';
// import 'package:qjobs/widgets/job_card.dart';
// import 'package:qjobs/widgets/job_card1.dart';
//
//
// class HomeSearch extends StatefulWidget {
//   final user_Id;
//   final cookiee;
//
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//
//
//   const HomeSearch({Key key, this.user_Id, this.cookiee, this.jobDetails, this.favoriteJobs}) : super(key: key);
//   @override
//   _HomeSearchState createState() => _HomeSearchState(this.user_Id, this.cookiee, this.jobDetails, this.favoriteJobs);
// }
//
// class _HomeSearchState extends State<HomeSearch> {
//   final user_Id;
//   final cookiee;
//
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//
//
//   _HomeSearchState(this.user_Id, this.cookiee, this.jobDetails, this.favoriteJobs);
//   int _cardIndex = 0;
//
//   void _onExitTap(){
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius:
//                 BorderRadius.circular(20.0)), //this right here
//             child: Container(
//               height: 250,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Logout',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         color: kAccentColor,
//                         fontFamily: "SourceSansPro",
//                         fontSize: 24,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                         Text(
//                           'Are You Sure You Want To Logout The App?',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: "SourceSansPro",
//                             fontSize: 15,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 50.0,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                             child: FlatButton(
//                               child: Text('No',  style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: "SourceSansPro",
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.normal,
//                                 fontWeight: FontWeight.w500,
//                               ),),
//                               color: kAccentColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50.0,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 20.0),
//                             child: FlatButton(
//                               child: Text('Yes', style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: "SourceSansPro",
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.normal,
//                                 fontWeight: FontWeight.w500,
//                               ),),
//                               color: kAccentColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
//                                 // SystemChannels.platform
//                                 //     .invokeMethod('SystemNavigator.pop');
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//   @override
//   void initState() {
//
//     print('jobDetails${jobDetails.length}');
//     print('jobDetails${user_Id}');
//     print('jobDetails${cookiee}');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    ScreenUtil.init(context, height: 890, width: 414, allowFontScaling: true);
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Material(
//               elevation: 15.0,
//               color: Colors.red[100],
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50.0),
//                   bottomRight: Radius.circular(50.0)),
//               child: Container(
//                 height: 710.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(left: 250,top: 40.0, right: 5),
//                       child: Container(
//                         height: 50,
//                         width: 100,
//                        // color: Colors.white,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0)
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             GestureDetector(
//                               onTap: () {
//                                 print('Notifications');
//                               },
//                               child: Icon(
//                                 Icons.notifications_active,
//                                 color: kAccentColor,
//                                 //color: Colors.white,
//                                 size: 30.0,
//                               ),
//                             ),SizedBox(width: 25,),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 7.0),
//                               child: GestureDetector(
//                                 onTap: _onExitTap,
//                                 child: Icon(
//                                   Icons.exit_to_app,
//                                   color: kAccentColor,
//                                  // color: Colors.white,
//                                   size: 30.0,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     HomeHeader(),
//                   SizedBox(height: kSpacingUnit * 2),
//                     HomeSubHeader(),
//                    SizedBox(height: kSpacingUnit * 2),
//                     //HomeContent(),
//                 Flexible(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: kSilverColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(kSpacingUnit * 5),
//                   topRight: Radius.circular(kSpacingUnit * 5),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: kSpacingUnit * 5),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Popular Jobs',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "SourceSansPro",
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Text('View All',
//                               style: kCardTitleTextStyle.copyWith(
//                                 fontFamily: "SourceSansPro",
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                               )),
//                         ],
//                       ),
//                     ),
//                     //HomePopularJobs(),
//                   Container(
//                     height: 175.w,
//                     child: CarouselSlider.builder(
//                       options: CarouselOptions(
//                         height: 130.w,
//                         aspectRatio: 16 / 9,
//                         viewportFraction: 0.8,
//                         initialPage: _cardIndex,
//                         enlargeCenterPage: true,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _cardIndex = index;
//                           });
//                         },
//                       ),
//                       itemCount: jobDetails.length,
//                       itemBuilder: (BuildContext context, int index) => Container(
//                         width: double.infinity,
//                         margin: EdgeInsets.symmetric(horizontal: kSpacingUnit),
//                         child: JobCard(jobDetails: jobDetails[index], userId:user_Id),
//                       ),
//                     ),
//                   ),
//                     //SizedBox(height: kSpacingUnit * 2),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
//                       child: Text(
//                         'Recently Added',
//                         style: kSubTitleTextStyle.copyWith(
//                           color: Colors.black,
//                           fontStyle: FontStyle.normal,
//                           fontFamily: "SourceSansPro",
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                    // HomeRecentJobs(favoriteJobs: favoriteJobs),
//                 Flexible(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: favoriteJobs
//                         .asMap()
//                         .entries
//                         .map(
//                           (item) => Container(
//                         margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3).copyWith(
//                           top: item.key == 0 ? kSpacingUnit * 2 : 0,
//                           bottom: kSpacingUnit * 2,
//                         ),
//                         child: JobCard1(favoriteJobs: item.value, userId: user_Id),
//                       ),
//                     )
//                         .toList(),
//                   ),
//                 ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
