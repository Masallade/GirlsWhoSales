import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/height_weight_Manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/routes_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';


final colorizeColors = [
  ColorManager.pinkPrimary,
  ColorManager.bluePrimary,
  ColorManager.pinkPrimary.withOpacity(AppSize.s02),
  ColorManager.pinkPrimary.withOpacity(AppSize.s03),
  ColorManager.pinkPrimary.withOpacity(AppSize.s05),
  ColorManager.pinkPrimary.withOpacity(AppSize.s06),
  ColorManager.pinkPrimary.withOpacity(AppSize.s07),
  ColorManager.pinkPrimary,
];


Widget ProfileHeader({required BuildContext context,required CurrentUserDetails currentUserDetails}) {
  HeightWidthManager _heightWidthManager=HeightWidthManager(context);

  return Column(
    children: [
      SizedBox(height: AppSize.s12,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        profileImage(image: currentUserDetails.profile!,context: context),
          userDetails(context: context,name: currentUserDetails.firstName,savedJobsLength: currentUserDetails.savedJobs!.length.toString(),totalAppliedJobs: currentUserDetails.total_applied!),
        ],
      ),
      Container(height:100, width:_heightWidthManager.width,child: Expanded(child: containerSingleUserContainerElements(title: AppString.email, key: currentUserDetails.email??"not found", context: context))),
      Row(
        children: [
          Expanded(child: containerSingleUserContainerElements(title: AppString.nationality, key: currentUserDetails.nationality??"not found", context: context)),
          Expanded(child: containerSingleUserContainerElements(title: AppString.city, key: currentUserDetails.city??"not found", context: context))
        ],),
      Container(height:100, width:_heightWidthManager.width,child: Expanded(child:containerSingleUserContainerElements(title: AppString.phone, key: currentUserDetails.phoneno??"not found", context: context))),

        ],

  );
}



Widget userDetails({required BuildContext context, required String name,required String savedJobsLength,required String totalAppliedJobs}){
  HeightWidthManager _heightWidthManager=HeightWidthManager(context);

  return Column(
    children: [
      SizedBox(
        width: _heightWidthManager.width*.5,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              name,
              textAlign: TextAlign.center,
              textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                overflow: TextOverflow.ellipsis
              ),
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
        totalRepeatCount: 100,),
      ),
      SizedBox(height: _heightWidthManager.height*.02,),
      Row(

        children: [
          singleUserDetailsElements(title:AppString.savedJobs, key: savedJobsLength, context: context),
          SizedBox(width: AppSize.s16,),
          singleUserDetailsElements(title:AppString.appliedJobs, key:  totalAppliedJobs, context: context),
        ],
      )

    ],
  );
}

Widget singleUserDetailsElements({required String title, required String key, required BuildContext context}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Text(key,style: Theme.of(context).textTheme.displayMedium,),
      Text(title,style:getSfTextMediumStyle(color: ColorManager.bluePrimary))
  ]
  );
}

Widget containerSingleUserContainerElements({required String title, required String key, required BuildContext context}){
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p8),
    child: Container(
      decoration: BoxDecoration(
        color: ColorManager.pinkPrimary.withOpacity(0.1),

        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(
          color: ColorManager.pinkPrimary,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(key,style: Theme.of(context).textTheme.displayMedium!.copyWith(overflow: TextOverflow.ellipsis),),
              Text(title,style:getSfTextMediumStyle(color: ColorManager.bluePrimary))
            ]
        ),
      ),
    ),
  );
}

Widget profileImage({required String image,required BuildContext context}){
  HeightWidthManager _heightWidthManager=HeightWidthManager(context);

  return Container(
    height: _heightWidthManager.height*.15,
    width: _heightWidthManager.height*.15,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: ColorManager.pinkPrimary,
            width: AppSize.s2
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGrey,
            blurRadius: AppSize.s5,
          )
        ]
    ),
    child: ClipOval(
      child: FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        fadeInCurve: Curves.easeInBack,
        height: _heightWidthManager.height*.15,
        width: _heightWidthManager.height*.15,
        placeholder: 'assets/images/loading.gif',
        placeholderScale: 2.0,
        fadeOutDuration: Duration(seconds: 2),
        image: image ?? "",
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/loading.gif',
            fit: BoxFit.cover,
            height: _heightWidthManager.height*.15,
            width: _heightWidthManager.height*.15,
          );
        },
      ),
    ),
  );
}