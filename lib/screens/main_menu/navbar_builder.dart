// import 'package:qjobs/model/login_model.dart';
// import 'package:qjobs/screens/main_menu/more/home.dart';
// import 'package:qjobs/screens/profile/dashboard.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/widgets/bottom_nav_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:qjobs/screens/main_menu/home_search.dart';
// import 'package:qjobs/screens/main_menu/more_settings.dart';
// import 'package:qjobs/screens/main_menu/dashboard.dart';
// import 'package:qjobs/screens/main_menu/about_us.dart';
//
//
// class HomePage extends StatefulWidget {
//   final user_Id;
//   final cookiee;
//
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//   final List<SeekerDetails> userDetails;
//
//
//
//   const HomePage({Key key, this.user_Id, this.cookiee, this.jobDetails, this.favoriteJobs, this.userDetails}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState(this.user_Id, this.cookiee, this.jobDetails, this.favoriteJobs, this.userDetails);
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final user_Id;
//   final cookiee;
//
//   final List<JobDetails> jobDetails;
//   final List<FavoriteJobs> favoriteJobs;
//   final List<SeekerDetails> userDetails;
//
//   _HomePageState(this.user_Id, this.cookiee, this.jobDetails, this.favoriteJobs, this.userDetails);
//
//   PageController pageController;
//   int pageIndex = 0;
//   onPageChanged(int pageIndex) {
//     setState(() {
//       this.pageIndex = pageIndex;
//     });
//   }
//
//   onItemSelected(int pageIndex) {
//     pageController.animateToPage(
//       pageIndex,
//       duration: Duration(milliseconds: 100),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: <Widget>[
//           HomeSearch(user_Id: user_Id, jobDetails: jobDetails, favoriteJobs: favoriteJobs),
//           Profile(),
//           Shortlisted(),
//           // ProfileMain(user_Id: user_Id, userDetails: userDetails),
//           //HotJobs(),
//           MoreSettings(),
//         ],
//         controller: pageController,
//         physics: NeverScrollableScrollPhysics(),
//         onPageChanged: onPageChanged,
//       ),
//       bottomNavigationBar: BottomNavBar(
//         onItemSelected: onItemSelected,
//         items: [
//           BottomNavBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//             activeColor: kAccentColor,
//           ),
//           BottomNavBarItem(
//               icon: Icon(Icons.apps),
//               title: Text('Dashboard'),
//               activeColor: kAccentColor,
//           ),
//           BottomNavBarItem(
//               icon: Icon(Icons.notifications_active_rounded),
//               title: Text('Notifications'),
//               activeColor: kAccentColor,
//           ),
//           // BottomNavBarItem(
//           //     icon: Icon(Icons.whatshot),
//           //     title: Text('Hot Jobs'),
//           //     activeColor: Colors.blue[900]
//           // ),
//           BottomNavBarItem(
//               icon: Icon(Icons.account_box),
//               title: Text('User Info'),
//               activeColor: kAccentColor,
//           ),
//
//
//           BottomNavBarItem(
//               icon: Icon(FontAwesomeIcons.ellipsisH),
//               title: Text('More'),
//               activeColor: kPrimaryTextColor
//           ),
//         ],
//       ),
//     );
//   }
// }
