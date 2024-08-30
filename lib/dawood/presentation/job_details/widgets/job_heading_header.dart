import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/job_details/controller/job_details_state_Management.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/height_weight_Manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:lottie/lottie.dart';



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobHeadingHeader extends StatelessWidget {
  final JobDetails jobDetails;
  const JobHeadingHeader({Key? key, required this.jobDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeightWidthManager _heightWidthManager = HeightWidthManager(context);
    return Stack(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p8, top: AppPadding.p12),
                  child: InkWell(
                    onTap: () {
                      context.read<JobDetailsStateManagement>().showImage(jobDetails.companyLogo ?? '');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorManager.pinkPrimary, width: AppSize.s1),
                      ),
                      child: CircleAvatar(
                        radius: _heightWidthManager.width * 0.15,
                        backgroundImage: NetworkImage(jobDetails.companyLogo ?? ''),
                      ),
                    ),
                  ),
                ),
                _singleCompanyDetails(
                  LottieManager.companyBuildingAnimation,
                  jobDetails.companyName ?? " ",
                ),
                _singleCompanyDetails(
                  LottieManager.companyLocationAnimation,
                  jobDetails.location ?? " ",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    jobDetails.title ?? " ",
                    style: getSfRoundedBold(
                      color: ColorManager.bluePrimary,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  SizedBox(height: AppSize.s10),
                  jobType(jobDetails.jobType ?? " ", jobDetails.type ?? " "),
                  SizedBox(height: AppSize.s10),
                  _pay(context, '\$${jobDetails.minSalary ?? " "} - \$${jobDetails.maxSalary ?? " "}')
                ],
              ),
            ),
          ],
        ),
        // Blurred background and image display
        Consumer<JobDetailsStateManagement>(
          builder: (context, state, child) {
            return state.isBlurred
                ? BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Center(
                child: InkWell(
                  onTap: ()=>context.read<JobDetailsStateManagement>().hideImage(),
                  child: Container(
                    height: _heightWidthManager.height * 0.25,
                    width: _heightWidthManager.width ,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.pinkPrimary,
                        width: AppSize.s1
                      ),
                      image: DecorationImage(
                        image: NetworkImage(state.imageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            )
                : SizedBox.shrink(); // Do nothing when not blurred
          },
        ),
      ],
    );
  }
}


Widget _pay(BuildContext context,title){
  return Row(
    children: [
      SizedBox(height:AppSize.s50,child: LottieBuilder.asset(LottieManager.dollarAnimation)),
      Text(title,style: Theme.of(context).textTheme.displayMedium,)

    ],
  );
}

Widget jobType( String value,secondValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        decoration: BoxDecoration(
          color: ColorManager.pinkPrimary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            value,
            style: getSfTextSemiBoldStyle(
              color: ColorManager.white,
              fontSize: FontSize.s14,
            ),
          ),
        ),
      ),
      SizedBox(width: AppSize.s5,),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.pinkPrimary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              secondValue,
              style: getSfTextSemiBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s14,
              ),
            ),
          ),
        )

    ],
  );
}

Widget _singleCompanyDetails(animation, title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: AppPadding.p4),
        child: SizedBox(
            height: AppSize.s50, child: LottieBuilder.asset(animation)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: AppPadding.p4),
        child: Text(
          title,
          style: getSfTextSemiBoldStyle(
              color: ColorManager.bluePrimary, fontSize: FontSize.s14),
        ),
      )
    ],
  );
}

