import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';

Widget ProfileHeader({required BuildContext context,required String image, required String name, required String title}) {
  return ListTile(
    leading: ClipOval(
      child: ClipOval(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            fadeInCurve: Curves.easeInBack,
            height: AppSize.s300,
            placeholder: 'assets/images/loading.gif',
            placeholderScale: 2.0,
            fadeOutDuration: Duration(seconds: 2),
            image: image ,
          ),
        ),
      ),
    ),
    title: Text('${name}', style: Theme.of(context).textTheme.displayLarge),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppString.jobPrefer,
          style: getSfRoundedBold(
              color: ColorManager.bluePrimary, fontSize: FontSize.s18),
        ),
        Text('${title}',
            style: getSfTextMediumStyle(
                color: ColorManager.pinkPrimary, fontSize: FontSize.s16)),
      ],
    ),
    trailing: GestureDetector(
        onTap: (){},
        child: LottieBuilder.asset(lottieManager.editProfileAnimation)),
  );

}