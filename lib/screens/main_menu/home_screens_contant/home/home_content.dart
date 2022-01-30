// import 'package:flutter/material.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_popular_jobs.dart';
// import 'package:qjobs/screens/main_menu/home_screens_contant/home/home_recent_jobs.dart';
// import 'package:qjobs/utils/constants.dart';
//
// class HomeContent extends StatelessWidget {
//   const HomeContent({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Flexible(
//       child: Container(
//         decoration: BoxDecoration(
//           color: kSilverColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(kSpacingUnit * 5),
//             topRight: Radius.circular(kSpacingUnit * 5),
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: kSpacingUnit * 5),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Popular Jobs',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontFamily: "SourceSansPro",
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text('View All',
//                         style: kCardTitleTextStyle.copyWith(
//                           fontFamily: "SourceSansPro",
//                           fontStyle: FontStyle.normal,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                     )),
//                   ],
//                 ),
//               ),
//               HomePopularJobs(),
//               //SizedBox(height: kSpacingUnit * 2),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
//                 child: Text(
//                   'Recently Added',
//                   style: kSubTitleTextStyle.copyWith(
//                     color: Colors.black,
//                     fontStyle: FontStyle.normal,
//                     fontFamily: "SourceSansPro",
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               HomeRecentJobs(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
