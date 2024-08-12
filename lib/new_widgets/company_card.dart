import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:lottie/lottie.dart';


class CompanyCard extends StatelessWidget {
  final JobDetails? jobDetails;
  final String? userId;
  CompanyCard({this.userId, this.jobDetails});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310,
        height: 168,
        // width: 288,
        // height: 180,
        margin: EdgeInsets.all(AppMargin.m14),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16),
            color: ColorManager.white,
          border: Border.all(
            color: ColorManager.pinkPrimary,
            width: AppSize.s2
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.bluePrimary,
              blurRadius: AppSize.s5,
            )
          ]
          // color: Colors.green,

        ),
        child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 40,
                    height: 40,
                    child:jobDetails!.companyLogo==StringManager.noCompanyLogoErrorHandler?
                    SizedBox(
                      height: AppSize.s50,
                      child: LottieBuilder.asset('assets/lottie_animation/job_card_view.json'),
                    )
                        : Image.network(jobDetails!.companyLogo ?? Image.asset('assets/images/splashlogo.png') as String)

                    // child: Image.network(jobDetails.companyLogo ??  Placeholder())//old tariq
                ),
                title: Column(
                    children: [
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('${jobDetails!.title ?? ""}' , style: Theme.of(context).textTheme.displaySmall),
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: FittedBox(
                      //     child: Text('${jobDetails.title ?? ""}' , style: TextStyle(
                      //       fontFamily: 'Questrial',
                      //       fontStyle: FontStyle.normal,
                      //       fontWeight: FontWeight.w400,
                      //       color: Colors.white,
                      //       fontSize: 16.0,
                      //       //fontWeight: FontWeight.w700,
                      //     ),),
                      //   ),
                      // ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('${jobDetails!.companyName ?? ""}' , style:Theme.of(context).textTheme.titleMedium,),
                      ),
                      // Align(
                      //     alignment: Alignment.topLeft,
                      //     child: FittedBox(
                      //       child: Text('${jobDetails.companyName ?? ""}'  ,
                      //         style: TextStyle(
                      //           fontFamily: 'Questrial',
                      //           fontStyle: FontStyle.normal,
                      //           fontWeight: FontWeight.w400,
                      //           color: Colors.grey[400],
                      //           fontSize: 14.0,
                      //           //fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     )),
                      SizedBox(height: 18.5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: ColorManager.bluePrimary,
                                borderRadius: BorderRadius.circular(AppSize.s5)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              // child: FittedBox(
                                child: Text(
                                  '${jobDetails!.jobType == null ? '' : jobDetails!.jobType}' ,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              // ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: ColorManager.bluePrimary,
                                borderRadius: BorderRadius.circular(AppSize.s5)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              // child: FittedBox(
                                child: Text(
                                  '${jobDetails!.type ?? " "}',
                                  style: Theme.of(context).textTheme.bodySmall
                                ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
              ),
              SizedBox(height: 33.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FittedBox(
                  //   child:
                    Text(
                      '${jobDetails!.location ?? " "}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      //   style: kTitleStyle.copyWith(color: Colors.white),
                    ),
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    // child: FittedBox(
                      child: Text(
                        '\$${jobDetails!.minSalary ?? " "} ' +
                            '- \$${jobDetails!.maxSalary ?? " "}',
                        style: Theme.of(context).textTheme.bodyLarge
                      ),
                    // ),
                  ),
                ],
              )
            ])

    );
  }
}



class AllJobCard extends StatelessWidget {
  final JobDetails? jobDetails;
  final String? userId;
  AllJobCard({this.userId, this.jobDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 300,
        height: 600,
        margin: EdgeInsets.only(right: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color:ColorManager.pinkPrimary),
          borderRadius: BorderRadius.circular(AppSize.s14),
          color: ColorManager.white,
          // color: Colors.yellow,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.black,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),

        child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 60,
                    height: 60,
                    child:jobDetails!.companyLogo==StringManager.noCompanyLogoErrorHandler?SizedBox(height: AppSize.s50,child: LottieBuilder.asset('assets/lottie_animation/job_card_view.json'),): Image.network(jobDetails!.companyLogo ?? Image.asset('assets/images/splashlogo.png') as String)),
                title: Column(
                    children: [
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        // child: FittedBox(
                          child: Text('${jobDetails!.title ?? ""}' , style: getSfRoundedBold(color: ColorManager.bluePrimary,fontSize: FontSize.s16),),
                        // ),
                      ),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.topLeft,
                          // child: FittedBox(
                            child: Text('${jobDetails!.companyName ?? ""}'  ,
                              style: getSfTextMediumStyle(color: ColorManager.pinkPrimary,fontSize: FontSize.s16),
                            ),
                          // ),
                      ),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.topLeft,
                          // child: FittedBox(
                            child: Text('Experience ${jobDetails!.experience ?? "" }' + ' Years',
                              style:getQuestrialRegularStyle(color: ColorManager.darkGrey,fontSize: FontSize.s14),
                            ),
                          // ),
                      ),
                      SizedBox(height: 50.5,),
                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: ColorManager.bluePrimary,
                                //  color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(AppSize.s5)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              // child: FittedBox(
                                child: Text(
                                  '${jobDetails!.jobType == null ? '' : jobDetails!.jobType}' ,
                                  style: getQuestrialRegularStyle(color: ColorManager.white,fontSize: FontSize.s14),
                                ),
                              // ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: ColorManager.bluePrimary,
                                borderRadius: BorderRadius.circular(AppSize.s5),),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 10.0 ,right: 7,bottom: 7),
                              // child: FittedBox(
                                child: Text(
                                  '${jobDetails!.type == null ? '' : jobDetails!.type}'
                                  , style: getQuestrialRegularStyle(color: ColorManager.white,fontSize: FontSize.s14)
                                ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(height: 33.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FittedBox(
                  //   child :
                    Text(
                      '${jobDetails!.location == null ? '' : jobDetails!.location}',
                      style: getQuestrialRegularStyle(color: ColorManager.pinkPrimary,fontSize: FontSize.s14)
                    ),
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    // child: FittedBox(
                      child: Text(
                        '\$${jobDetails!.minSalary == null ? '' : jobDetails!.minSalary} ' +
                            '- \$${jobDetails!.maxSalary == null ? '' : jobDetails!.maxSalary}',
                        style:getQuestrialRegularStyle(color: ColorManager.pinkPrimary,fontSize: FontSize.s14)
                      ),
                    // ),
                  ),
                ],
              ),
              SizedBox(height: 55,),
              Text('Available Positions: ${jobDetails!.totalPositions}' , style: getSfRoundedBold(color: ColorManager.bluePrimary,fontSize: FontSize.s20),)
            ]),
      ),
    );
  }
}
