import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:girlzwhosell/dawood/data/already_applied_job_details_version.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_container_button.dart';
import 'package:girlzwhosell/screens/apply_jjob_detail_screen.dart';

Widget applyButton({required BuildContext context,required CurrentUserDetails currentUserDetails, required int index,required int appliedStatus }){
  return customContainerButton(appliedStatus == 1 ? "Already Applied" : "Apply", () async {
    alreadyappliedJobDetailsVersion(userID: currentUserDetails.user_Id,jobDetailsID: currentUserDetails.jobDetails![index].id).then((value) async {
      if (value.status == 200) {
        showToast(
          'This is normal toast with animation',
          context: context,
          animation: StyledToastAnimation.scale,
        );
        showToast(
          "You've Already Applied \n For this Job",
          context: context,
          fullWidth: true,
          backgroundColor: Colors.pinkAccent[200]!.withOpacity(0.6),
          animation: StyledToastAnimation.slideFromBottomFade,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.left,
          animDuration: Duration(seconds: 2),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      }
      if (value.status == 100) {
        // final snackBar = SnackBar(content: Text('Email Sent!!!!'));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JobApply(
                    uName: currentUserDetails.uName,
                    password: currentUserDetails.password,
                    jobDetails: currentUserDetails.jobDetails![index],
                    userDetails: currentUserDetails.userDetails,
                    user_Id: currentUserDetails.user_Id,
                    firstName: currentUserDetails.firstName,
                    cv: currentUserDetails.cv,
                    resumee: currentUserDetails.resumee)));
      }
    });
  },);
}