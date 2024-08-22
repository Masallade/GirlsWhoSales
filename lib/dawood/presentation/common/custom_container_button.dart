import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/utils/size_config.dart';

Widget customContainerButton(String title, void Function() onTap){
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Container(
          width: SizeConfig.screenWidth,
          height: AppSize.s50,
          decoration: BoxDecoration(
            color: ColorManager.bluePrimary,
            borderRadius: BorderRadius.circular(AppSize.s5),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey,
                blurRadius: AppSize.s2
              )
            ]
          ),
          child: GestureDetector(
              onTap: onTap,
              child: ListTile(
                  title: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p10),
                      child: Text(title, style: getSfRoundedBold(color: ColorManager.white,fontSize: FontSize.s20),),
                    ),
                  )))));
}