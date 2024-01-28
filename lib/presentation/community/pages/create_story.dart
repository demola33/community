import 'package:community/presentation/community/components/nav_bar/nav_bar.dart';
import 'package:community/presentation/shared/custom_button.dart';
import 'package:community/presentation/shared/ui_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../utils/constants.dart';

class CreateStory extends StatelessWidget {
  const CreateStory({super.key});

  static String routeName = "/create_story";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w),
            child: Column(
              children: [
                NavBar(
                  title: 'Create Story',
                  onPress: () => Get.back(),
                ),
                UIHelper.verticalSpace(15),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: kFormLabelStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Title',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: kHintColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Story',
                            style: kFormLabelStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          TextFormField(
                            minLines: 4,
                            maxLines: 10,
                            maxLength: 1000,
                            decoration: InputDecoration(
                              hintText: 'Enter Story',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: kHintColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: kHintColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photo',
                            style: kFormLabelStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  UIHelper.horizontalSpace(12),
                              itemCount: 3,
                              itemBuilder: (ctx, index) {
                                return DottedBorder(
                                  color: greyTwoBorder,
                                  strokeWidth: 1,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 50.h,
                                    horizontal: 50.w,
                                  ),
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10.r),
                                  child: Image.asset(
                                    'asset/icon_images/icon-plus.png',
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const CustomButton(label: 'Publish'),
                UIHelper.verticalSpaceMedium(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
