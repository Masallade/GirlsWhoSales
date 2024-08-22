import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    primaryColor: ColorManager.bluePrimary,
    primaryColorLight: ColorManager.bluePrimary,
    disabledColor: ColorManager.grey1,
    colorScheme:ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.error
    ),

  splashColor: ColorManager.white,


    //************************CardView theme*****************************
    cardTheme: CardTheme(
    elevation: AppSize.s4,
    color: ColorManager.white,
    shadowColor: ColorManager.bluePrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s14),
      side: BorderSide(color: ColorManager.pinkPrimary,width: AppSize.s2)
    )
  ),
    //************************CardView theme*****End*********************



    //************************textFormField decoration*****************************
    inputDecorationTheme: InputDecorationTheme(

      contentPadding: EdgeInsets.all(AppPadding.p8),

      hintStyle: getPopRegularStyle(color: ColorManager.pinkPrimary,fontSize: FontSize.s16),
      labelStyle: getPopRegularStyle(color: ColorManager.bluePrimary),
      errorStyle: getPopRegularStyle(color: ColorManager.error),


      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white, width: AppSize.s2),
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),


      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.pinkPrimary, width: AppSize.s2),
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),


      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.pinkPrimary, width: AppSize.s2),
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s2),
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),

    ),
    //************************textFormField decoration*****End*********************



    //************************Appbar theme*****************************
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.bluePrimary,
      elevation: AppSize.s5,
      centerTitle: false,
      shadowColor: ColorManager.grey1,
      titleTextStyle: getSfRoundedHeavyStyle(color: ColorManager.white,fontSize: FontSize.s28),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.bluePrimary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      )),
    //************************Appbar theme***End***********************



    //************************Button theme*****************************
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorManager.bluePrimary,
      disabledColor: ColorManager.darkGrey,
      splashColor: ColorManager.bluePrimary,
  ),
    //************************Button theme***End***********************

      //************************Text theme*****************************
    textTheme: TextTheme(
      displayLarge: getSfRoundedHeavyStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s32),
      displayMedium: getSfRoundedBold(color: ColorManager.pinkPrimary,fontSize: FontSize.s28),
      displaySmall: getSfRoundedBold(color: ColorManager.bluePrimary,fontSize: FontSize.s16),

      titleMedium: getQuestrialRegularStyle(color: ColorManager.pinkPrimary,fontSize:FontSize.s20 ),
      titleLarge: getSfTextSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s16),

      bodySmall: getQuestrialRegularStyle(color: ColorManager.white,fontSize: FontSize.s12),
      bodyLarge: getSfTextMediumStyle(color: ColorManager.pinkPrimary,fontSize: FontSize.s18),
      bodyMedium: getQuestrialRegularStyle(color: ColorManager.black,fontSize: FontSize.s16)

    )
  );
     //************************Text theme***End***********************



}