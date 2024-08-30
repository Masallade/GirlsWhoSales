// import 'package:favorite_button/favorite_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// import 'package:girlzwhosell/user_preferences/user_pref_manager.dart';
//
// Widget jobAppBar(BuildContext context){
//   return AppBar(
//     elevation: 0,
//     actions: [
//       GestureDetector(
//         onTap: (){
//           alreadySavedJob().then((value) async {
//             if (value.status == 200) {
//               showToast(
//                 'This is normal toast with animation',
//                 context: context,
//                 animation: StyledToastAnimation.scale,
//               );
//               showToast(
//                 "You've Already Saved \n this Job",
//                 context: context,
//                 fullWidth: true,
//                 backgroundColor: Colors.pinkAccent[200],
//                 animation: StyledToastAnimation.slideFromBottomFade,
//                 reverseAnimation: StyledToastAnimation.fade,
//                 position: StyledToastPosition.left,
//                 animDuration: Duration(seconds: 2),
//                 duration: Duration(seconds: 4),
//                 curve: Curves.elasticOut,
//                 reverseCurve: Curves.linear,
//               );
//             }
//             if (value.status == 100) {
//               savejob().whenComplete(() => ShowsavedJobs(context));
//             }
//           }
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: FavoriteButton(
//             isFavorite: getJobStatus(),//getLikeStatus()
//             valueChanged: (newIsLiked) {
//               isLiked = newIsLiked;
//               print('Is Favorite : $isLiked');
//               if (getJobStatus() == true) {//getLikeStatus()
//                 IsButton == false;
//                 isLiked = false;
//                 Unsavejob();
//
//               } else {
//                 isLiked = true;
//                 savejob();
//               }
//
//               setState(() {
//                 SharedPreferencesManager.setUserPref("${user_Id}_${jobid}",isLiked);
//                 //added for update lists
//                 Requests.updatefavoriteJob(context,user_Id.toString());
//               });
//
//             },
//           ),
//           // child: Icon(Icons.save_alt,//old code tariq
//           // color: Colors.pink,),
//         ),
//       ),
//     ],
//     leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.black,
//           //  color: kBlack,
//         ),
//         onPressed: () {
//           SharedPreferencesManager.getTotalSavedJobs(int.tryParse(user_Id));
//           Navigator.pop(context);
//           print("hereeererrere");
//         }
//       // onPressed: () => Navigator.pop(context),
//     ),
//     title: Text(
//       '${jobDetails!.companyName ?? " "}',
//       style: TextStyle(
//         fontFamily: 'Poppins',
//         fontStyle: FontStyle.normal,
//         fontWeight: FontWeight.w500,
//         color: Colors.black,
//         fontSize: 20.0,
//       ),
//     ),
//     centerTitle: true,
//   ),
// }