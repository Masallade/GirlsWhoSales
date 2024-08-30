import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/height_weight_Manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';

Widget aboutUsHeader(BuildContext context){
  HeightWidthManager _heightWidthManager=HeightWidthManager(context);
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    height: _heightWidthManager.height*.1,
    child: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayLarge as TextStyle,
        child: AnimatedTextKit(
          isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts: [
            RotateAnimatedText(AppString.something,),
            RotateAnimatedText(AppString.aboutUs,textStyle:Theme.of(context).textTheme.displayMedium as TextStyle, ),
          ],
        )),
  );
}