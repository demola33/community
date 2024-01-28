import 'package:community/presentation/community/pages/create_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../shared/custom_button.dart';
import '../../shared/ui_helper.dart';

class TimeLineCard extends StatelessWidget {
  const TimeLineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.44999998807907104),
            BlendMode.darken,
          ),
          image: const AssetImage("asset/images/image-1.png"),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 37.h,
          end: 18.w,
          start: 19.w,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Do you have a story you would like to share with the commuity?",
              style: kCardTitleStyle,
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(22),
            CustomButton(
              label: 'Create Story',
              width: 182.w,
              onPress: () => Get.toNamed(CreateStory.routeName),
            )
          ],
        ),
      ),
    );
  }
}
