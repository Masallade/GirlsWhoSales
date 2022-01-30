import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girlzwhosell/utils/constants.dart';

class SearchTag extends StatelessWidget {
  final String tag;

  const SearchTag({
    Key key,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 3.5,
      width: kSpacingUnit * 12,
      margin: EdgeInsets.only(left: kSpacingUnit),
      decoration: BoxDecoration(
        color: kAccentColor,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: kSpacingUnit),
            Text(
              tag,
              style: kCaptionTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "SourceSansPro",
                fontStyle: FontStyle.normal,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/close_icon.svg',
              height: 15.sp,
              width: 15.sp,
            ),
            SizedBox(width: kSpacingUnit * 0.5),
          ],
        ),
      ),
    );
  }
}
