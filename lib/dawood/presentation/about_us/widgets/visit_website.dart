import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';

Widget visitWebsite(void Function() onTap){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(AppString.visitWebsite,style: getSfRoundedThinStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s12),),
    InkWell(
      onTap: onTap,
      child:  Container(
          decoration: BoxDecoration(
            color: ColorManager.pinkPrimary,
            borderRadius: BorderRadius.circular(AppSize.s20),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey,
                blurRadius: AppSize.s1,
              )
            ]
          ),
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Text(AppString.website,style: getSfRoundedBold(color: ColorManager.white),),
          ),
        ),
      ),
  ],
  );
}