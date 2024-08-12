import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DetailsForFavJob extends StatefulWidget {
  final Job? data;
  final FavoriteJobs? favoriteJobs;
  final String? userId;

  const DetailsForFavJob({Key? key, this.data, this.favoriteJobs, this.userId}) : super(key: key);
  static final String uploadEndPoint =
      base_url+'apply_job.php';
  static final String uploadsavejob =
      base_url+'saved_jobs.php';

  @override
  _DetailsForFavJobState createState() => _DetailsForFavJobState(this.data, this.favoriteJobs, this.userId);
}

class _DetailsForFavJobState extends State<DetailsForFavJob> {
  String errMessage = 'Error Uploading Slip';
  String status = '';
  final Job? data;
  final FavoriteJobs? favoriteJobs;
  final String? userId;

  _DetailsForFavJobState(this.data, this.favoriteJobs, this.userId);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilverColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //DetailHeader(data: data),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kSpacingUnit * 2,
                    vertical: kSpacingUnit * 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/icons/chevron_left_icon.svg',
                          height: 30.sp,
                          width: 30.sp,
                        ),
                      ),
                      Text(
                        favoriteJobs!.title!,
                        style: kSubTitleTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 30.sp),
                    ],
                  ),
                ),
                //DetailContent(data: data),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: kSpacingUnit * 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kSpacingUnit * 5),
                        topRight: Radius.circular(kSpacingUnit * 5),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: kSpacingUnit * 5),
                          Center(
                            child: Column(
                              children: [
                                // SvgPicture.asset(
                                //   data.imgUrl,
                                //   height: 50.sp,
                                //   width: 50.sp,
                                // ),
                                SizedBox(height: kSpacingUnit * 2),
                                Text(
                                  favoriteJobs!.description!,
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(height: kSpacingUnit),
                                Text(
                                  favoriteJobs!.companyName!,
                                  style: kCaptionTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: kSpacingUnit * 5),
                          Text(
                            'Responsibilities',
                            style: kSubTitleTextStyle,
                          ),
                          SizedBox(height: kSpacingUnit * 2),
                          // if (favoriteJobs.description != null && favoriteJobs.description.length > 0)
                          //   ...favoriteJobs.description
                          //       .map((responsibility) => DetailItem(data: responsibility))
                          //       .toList(),
                          SizedBox(height: kSpacingUnit),
                          Text(
                            'Qualifications',
                            style: kSubTitleTextStyle,
                          ),
                          SizedBox(height: kSpacingUnit * 2),
                          // if (favoriteJobs.qualifications != null && favoriteJobs.qualifications.length > 0)
                          //   ...favoriteJobs.qualifications
                          //       .map((qualification) => DetailItem(data: qualification))
                          //       .toList(),
                          SizedBox(height: kSpacingUnit * 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //DetailFooter(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(kSpacingUnit * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [kFooterShadow],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: savejob,
                      child: Container(
                        height: kSpacingUnit * 6,
                        width: kSpacingUnit * 8,
                        decoration: BoxDecoration(
                          color: kSilverColor,
                          borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/heart_icon.svg',
                            height: 20.sp,
                            width: 20.sp,
                            color: kAccentColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: kSpacingUnit * 2),
                    Expanded(
                      child: GestureDetector(
                        onTap: applynow,
                        child: Container(
                          height: kSpacingUnit * 6,
                          decoration: BoxDecoration(
                            color: kAccentColor,
                            borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                          ),
                          child: Center(
                            child: Text(
                              'Apply Now',
                              style: kTitleTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  applynow() {

    http.post(Uri.parse(DetailsForFavJob.uploadEndPoint), body: {
      "user_id": userId,
      "job_id": favoriteJobs!.jobId,
      "emp_id": favoriteJobs!.id,
      "cover_letter": "123456",
      "applied_date": getCurrentDate(),

    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (result.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "${status}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1);
      }
    }).catchError((error) {
      setStatus(error);
    });
  }
  savejob() {

    http.post(Uri.parse(DetailsForFavJob.uploadsavejob), body: {
      "user_id": userId,
      "job_id": favoriteJobs!.jobId,

    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (result.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "${status}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1);
      }
    }).catchError((error) {
      setStatus(error);
    });
  }
  setStatus(String message) {
    setState(() {
      status = message;
    });
  }
  getCurrentDate() {
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }
}
