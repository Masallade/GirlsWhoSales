// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:qjobs/screens/main_menu/more/general_search.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/widgets/search_control.dart';
// import 'package:qjobs/widgets/search_tag.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// class HomeSubHeader extends StatelessWidget {
//   const HomeSubHeader({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               //SearchControl(),
//               Expanded(
//                 child: SearchControl(),
//               ),
//               SizedBox(width: kSpacingUnit * 2),
//               GestureDetector(
//                 onTap: (){
//                         Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                         builder: (context) {
//                         return JobSearchSecond();
//                         },
//                         ),
//                         );
//                         },
//                 child: SvgPicture.asset(
//                   'assets/icons/slider_icon.svg',
//                   height: 25.sp,
//                   width: 25.sp,
//                   color: kAccentColor,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: kSpacingUnit * 2),
//           Row(
//             children: [
//               SearchTag(tag: 'Singapore'),
//               SearchTag(tag: 'London'),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   abc(){
//
//
//   }
// }
