import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/screens/main_menu/home_screens_contant/detail/detailsFor_JobDetail.dart';
import 'package:girlzwhosell/utils/constants.dart';

class JobCard extends StatelessWidget {
  final Job? data;
  final JobDetails? jobDetails;
  final String? userId;


  const JobCard({Key? key, this.data, this.jobDetails, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        boxShadow: [kCardShadow],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,

        openElevation: 0,
        openBuilder: (context, action) {
          return DetailsForJobDetail(jobDetails: jobDetails, userId:userId);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 125.w,
            padding: EdgeInsets.all(kSpacingUnit * 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // SvgPicture.asset(
                    //   data.imgUrl,
                    //   height: 30.sp,
                    //   width: 30.sp,
                    // ),
                    SizedBox(width: kSpacingUnit),
                    Text(
                      jobDetails!.title!,
                      //data.companyName,
                      style: kCardTitleTextStyle,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/heart_icon.svg',
                      height: 20.sp,
                      width: 20.sp,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  jobDetails!.experience!,
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontFamily: "SourceSansPro",
                    fontSize: 15,
                    fontWeight:
                    FontWeight.w500,
                  ),
                ),
                SizedBox(height: kSpacingUnit * 0.5),
                Text(
                  jobDetails!.location!,
                  style: kCaptionTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
