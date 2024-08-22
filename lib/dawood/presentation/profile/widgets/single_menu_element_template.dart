import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';

Widget singleMenuElement(String title, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p18,
            bottom: AppPadding.p18,
            left: AppPadding.p6,
            right: AppPadding.p6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: getSfRoundedBold(
                  color: ColorManager.bluePrimary, fontSize: FontSize.s16),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorManager.pinkPrimary,
            )
          ],
        ),
      ),
    ),
  );
}