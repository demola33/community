import 'package:community/presentation/shared/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String hintText = 'Search stories';
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: kSearchBarBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: TextField(
          cursorColor: kPrimaryLabelColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: SizedBox(
              width: 20.w,
              height: 20.w,
              child: const Icon(
                Icons.search,
                color: kPrimaryLabelColor,
                size: 16,
              ),
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  width: 30.h,
                  color: kHintColor,
                  indent: 10.h,
                  endIndent: 10.h,
                ),
                UIHelper.horizontalSpace(13.5),
                const Icon(
                  Icons.tune_outlined,
                  color: iconGrey,
                  size: 32,
                ),
              ],
            ),
            hintText: hintText,
            hintStyle: kSearchPlaceholderStyle,
          ),
        ),
      ),
    );
  }
}
