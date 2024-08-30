import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/provider_model/about_us_state_management.dart';
import 'package:girlzwhosell/dawood/presentation/resources/assets_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/height_weight_Manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DetailContainer extends StatefulWidget {
  const DetailContainer({Key?key}):super(key:key);

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late Timer _timer;

  @override
  void initState(){
    super.initState();
    final provider = Provider.of<AboutUsStateManagement>(context, listen: false);
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      provider.changeColor();
    });
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HeightWidthManager _heightWidthManager=HeightWidthManager(context);
    return Consumer<AboutUsStateManagement>(
        builder: (context,provider,child){
          return AnimatedContainer(
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(
                  color: provider.animateColor,
                  width: AppSize.s16
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.lightGrey,
                  blurRadius: AppSize.s5,
                )
              ],
              borderRadius: BorderRadius.circular(AppPadding.p20),
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height:AppSize.s35,child: Image(image: AssetImage('assets/images/splashlogo.png'))),
                      SizedBox(width: AppSize.s4,),
                      Text(AppString.ownerName, style: Theme.of(context).textTheme.displaySmall,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height:AppSize.s50,child:LottieBuilder.asset(LottieManager.companyLocationAnimation)),
                      Text(AppString.usa,style: getSfTextSemiBoldStyle(color: ColorManager.bluePrimary,fontSize: FontSize.s12),),
                    ],
                  ),
                  SizedBox(height:_heightWidthManager.height*.3,
                    child:Image.asset('assets/images/heidisolomon-removebg-preview.png'),),
                  SizedBox(height: AppSize.s20,),
                  DefaultTextStyle(
                    style: getQuestrialRegularStyle(color: ColorManager.pinkPrimary,fontSize: FontSize.s20),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts:[
                    TypewriterAnimatedText(
                        AppString.aboutUsDetails,
                      textAlign: TextAlign.center,
                      speed: Duration(milliseconds: 50)

                    )
                      ]),),

                  // Text( maxLines: 11,
                  //   textAlign: TextAlign.justify,
                  //   overflow: TextOverflow.ellipsis,
                  //   style:
                  // ),

                ],
              ),
            ),

          );
        }) ;
  }
}


