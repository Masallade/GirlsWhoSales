import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_elevated_button.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> customAlertDialog({required BuildContext context,required String title, required void Function()onYes , required void Function()onNO}) {
  return showDialog(
    builder: (context) => AlertDialog(
      elevation: 2.0,
      title: Text(title,style: Theme.of(context).textTheme.displayMedium,),
      actions: <Widget>[
        customElevatedButton(context:context,title: AppString.no, onPressed:onNO ),
        customElevatedButton(context:context,title: AppString.yes,onPressed: onYes)
      ],
    ),
    context: context,
  ).then((value) => value as bool) ??
      false as Future<bool>;
}

Future logOutUser()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if(prefs != null){
    prefs.setBool(KeyisUserAlreadyLogin, false);
  }


}
