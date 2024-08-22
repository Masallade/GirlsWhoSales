import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/screens/all_saved_jobs.dart';

Widget seeAllButton({required BuildContext context,required void Function() onTap}){
  return GestureDetector(
    onTap:onTap,
    child: Container(
      decoration: BoxDecoration(
          color: ColorManager.pinkPrimary,
          boxShadow: [
            BoxShadow(
              color: ColorManager.pinkPrimary,
              blurRadius: AppSize.s2,
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          'See All',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );
}