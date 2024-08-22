import 'package:flutter/material.dart';

class ColorManager{
  static final Color bluePrimary=HexColor.fromHex('#1565C0');
  static final Color pinkPrimary=HexColor.fromHex('#FF007F');
  static final Color white=HexColor.fromHex('#ffffff');
  static final Color grey1=HexColor.fromHex('#707070');
  static final Color error=HexColor.fromHex('#e61f34');
  static final Color darkGrey=HexColor.fromHex('#525252');
  static final Color lightGrey=HexColor.fromHex('#A0A1A3');
  static final Color black=HexColor.fromHex('#000000');
}

extension HexColor on Color{
  static  Color fromHex(String hexColor){
    hexColor=hexColor.replaceAll('#', '');
    if(hexColor.length==6){
      hexColor='FF$hexColor';
    }
    return Color(int.parse(hexColor,radix: 16));
  }

}