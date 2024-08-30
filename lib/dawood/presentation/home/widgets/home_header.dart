import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/routes_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/screens/main_menu/more/general_search.dart';
import 'package:lottie/lottie.dart';

Widget homeHeader({required BuildContext context, required CurrentUserDetails currentUserDetails}){
  return InkWell(
    splashColor: Colors.blue[800],
    onTap:()=> Navigator.pushNamed(context, Routes.jobSearchPagePath,arguments: currentUserDetails),
    child: Container(
      height: AppSize.s50,
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorManager.pinkPrimary,
        boxShadow: [
          BoxShadow(
            color: ColorManager.bluePrimary,
            blurRadius: AppSize.s2
          )
        ]
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppString.searchJob, style: getSfRoundedBold(color: ColorManager.white, fontSize: FontSize.s17)),
          LottieBuilder.asset(LottieManager.searchJobAnimation)

        ],
      ),
    ),
  );
}