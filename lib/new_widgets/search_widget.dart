import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:lottie/lottie.dart';

class SearchWidget extends StatefulWidget {
  final String? text;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  const SearchWidget({
    Key? key,
     this.text,
     this.onChanged,
     this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black , fontStyle: FontStyle.normal ,fontFamily: 'Questrial' , fontWeight: FontWeight.w400,fontSize: 16);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text!.isEmpty ? styleHint : styleActive;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:AppPadding.p16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: SizedBox(child: LottieBuilder.asset('assets/lottie_animation/search_icon.json'),height: AppSize.s12,),
          suffixIcon: widget.text!.isNotEmpty
              ? GestureDetector(
            child: Icon(Icons.close, color: ColorManager.white),
            onTap: () {
              controller.clear();
              widget.onChanged!('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          border: InputBorder.none,
        ),

        onChanged: widget.onChanged,
      ),
    );
  }
}


class SearchWidgettwo extends StatefulWidget {
  final String? text;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  const SearchWidgettwo({
    Key? key,
    this.text,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgettwoState createState() => _SearchWidgettwoState();
}

class _SearchWidgettwoState extends State<SearchWidgettwo> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black , fontStyle: FontStyle.normal ,fontFamily: 'Questrial' , fontWeight: FontWeight.w400,fontSize: 16);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text!.isEmpty ? styleHint : styleActive;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(

          prefixIcon: SizedBox(child: LottieBuilder.asset('assets/lottie_animation/location.json'),height: AppSize.s14,),
          suffixIcon: widget.text!.isNotEmpty
              ? GestureDetector(
            child: Icon(Icons.close, color:ColorManager.white),
            onTap: () {
              controller.clear();
              widget.onChanged!('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}

