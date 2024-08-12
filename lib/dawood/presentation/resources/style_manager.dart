
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(Color color,String fontFamily, FontWeight fontWeight, double fontSize){
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}


TextStyle getSfRoundedThinStyle({required Color color, double fontSize=FontSize.s12,}){
  return _getTextStyle(color, FontConstant.fontFamilySFRounded, FontWeightManager.sfRoundedThin, fontSize);
}

TextStyle getSfRoundedBold({required Color color, double fontSize=FontSize.s12 }){
  return _getTextStyle(color, FontConstant.fontFamilySFRounded, FontWeightManager.sfRoundedBold, fontSize);
}

TextStyle getSfRoundedHeavyStyle({required Color color, double fontSize=FontSize.s12,}){
  return _getTextStyle(color, FontConstant.fontFamilySFRounded, FontWeightManager.sfRoundedHeavy, fontSize);
}





TextStyle getSfTextRegularStyle({required Color color, double fontSize=FontSize.s12 }){
  return _getTextStyle(color, FontConstant.fontFamilySFText, FontWeightManager.sfTextRegular, fontSize);
}

TextStyle getSfTextMediumStyle({required Color color, double fontSize=FontSize.s12 }){
  return _getTextStyle(color, FontConstant.fontFamilySFText, FontWeightManager.sfTextMedium, fontSize);
}

TextStyle getSfTextBoldStyle({required Color color, double fontSize=FontSize.s12 }){
  return _getTextStyle(color, FontConstant.fontFamilySFText, FontWeightManager.sfTextBold, fontSize);
}

TextStyle getSfTextSemiBoldStyle({required Color color, double fontSize=FontSize.s12 }){
  return _getTextStyle(color, FontConstant.fontFamilySFText, FontWeightManager.sfTextSemiBold, fontSize);
}





TextStyle getQuestrialRegularStyle({required Color color, double fontSize=FontSize.s12 }){
  return _getTextStyle(color, FontConstant.fontFamilyQuestrial, FontWeightManager.questrialRegular, fontSize);
}


TextStyle getPopRegularStyle({required Color color, double fontSize=12}){
  return _getTextStyle(color, FontConstant.fontFamilyPoppins, FontWeightManager.popRegular, fontSize);

}
