import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girlzwhosell/model/job.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';



class DetailsForJobDetail extends StatefulWidget {
  final Job? data;
  final JobDetails? jobDetails;
  final String? userId;


  const DetailsForJobDetail({Key? key, this.data, this.jobDetails, this.userId}) : super(key: key);
  static final String uploadEndPoint =
      base_url+'apply_job.php';

  static final String uploadsavejob =
      base_url+'saved_jobs.php';

  @override
  _DetailsForJobDetailState createState() => _DetailsForJobDetailState(this.data, this.jobDetails, this.userId);
}

class _DetailsForJobDetailState extends State<DetailsForJobDetail> {
   String errMessage = 'Error Uploading Slip';
   String status = '';
   final Job? data;
  final JobDetails? jobDetails;
  final String? userId;

   _DetailsForJobDetailState(this.data, this.jobDetails, this.userId);



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
              jobDetails!.title!,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: kSpacingUnit * 5),
                          SvgPicture.asset(
                            jobDetails!.companyLogo != null ? jobDetails!.companyLogo! : "",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          Text(
                            'Location',
                            style: kSubTitleTextStyle,
                          ),
                          Text(
                            jobDetails!.location!,
                            style: kCaptionTextStyle,
                          ),
                          SizedBox(height: kSpacingUnit * 2),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  children: [
                                    Text(
                                      'Salary',
                                      style: kSubTitleTextStyle,
                                    ),
                                    SizedBox(width: kSpacingUnit * 6),
                                    Text(
                                      jobDetails!.minSalary!,
                                      style: kTitleTextStyle,
                                    ),
                                    SizedBox(width: kSpacingUnit * 2),
                                    Text(
                                      '-',
                                      style: kSubTitleTextStyle,
                                    ),
                                    SizedBox(width: kSpacingUnit * 2),
                                    Text(
                                      jobDetails!.maxSalary!,
                                      style: kTitleTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(height: kSpacingUnit * 2),
                                Row(
                                  children: [
                                    Text(
                                      'Experience',
                                      style: kSubTitleTextStyle,
                                    ),
                                    SizedBox(width: kSpacingUnit * 6),
                                    Text(
                                      jobDetails!.experience!,
                                      style: kTitleTextStyle,
                                    ),

                                  ],
                                ),
                                SizedBox(height: kSpacingUnit * 2),
                                Row(
                                  children: [
                                    Text(
                                      'Total Positions',
                                      style: kSubTitleTextStyle,
                                    ),
                                    SizedBox(width: kSpacingUnit *4),
                                    Text(
                                      jobDetails!.totalPositions!,
                                      style: kTitleTextStyle,
                                    ),

                                  ],
                                ),
                                SizedBox(height: kSpacingUnit * 2),
                                Text(
                                  'Skills',
                                  style: kSubTitleTextStyle,
                                ),
                                Text(
                                  jobDetails!.skills!,
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(height: kSpacingUnit * 2),
                                Text(
                                  'Qualifications',
                                  style: kSubTitleTextStyle,
                                ),
                                SizedBox(width: kSpacingUnit * 4),
                                Text(
                                  jobDetails!.requiredEducation!,
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(height: kSpacingUnit * 2),
                                Text(
                                  'Responsibilities',
                                  style: kSubTitleTextStyle,
                                ),
                                Text(
                                  jobDetails!.description!,
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(height: kSpacingUnit * 6),

                              ],
                            ),
                          ),
                          // SizedBox(height: kSpacingUnit * 5),
                          //
                          // SizedBox(height: kSpacingUnit * 2),
                          // // if (favoriteJobs.description != null && favoriteJobs.description.length > 0)
                          // //   ...favoriteJobs.description
                          // //       .map((responsibility) => DetailItem(data: responsibility))
                          // //       .toList(),
                          // SizedBox(height: kSpacingUnit),
                          // Text(
                          //   'Qualifications',
                          //   style: kSubTitleTextStyle,
                          // ),
                          // SizedBox(height: kSpacingUnit * 2),
                          // // if (favoriteJobs.qualifications != null && favoriteJobs.qualifications.length > 0)
                          // //   ...favoriteJobs.qualifications
                          // //       .map((qualification) => DetailItem(data: qualification))
                          // //       .toList(),
                          // SizedBox(height: kSpacingUnit * 15),
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

    http.post(Uri.parse(DetailsForJobDetail.uploadEndPoint), body: {
      "user_id": userId,
      "job_id": jobDetails!.id,
      "emp_id": jobDetails!.employerId,
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

     http.post(Uri.parse(DetailsForJobDetail.uploadsavejob), body: {
       "user_id": userId,
       "job_id": jobDetails!.id,

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
