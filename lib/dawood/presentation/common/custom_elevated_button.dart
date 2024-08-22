import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';

Widget customElevatedButton({required BuildContext context, required String title,required void Function() onPressed }){

  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), backgroundColor: ColorManager.bluePrimary,
    ),
  );
}