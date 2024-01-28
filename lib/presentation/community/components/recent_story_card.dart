import 'package:community/domain/models/story.dart';
import 'package:community/presentation/shared/ui_helper.dart';
import 'package:community/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RecentStoryCard extends StatelessWidget {
  const RecentStoryCard({Key? key, required this.story}) : super(key: key);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: story.hasImages ? 254.h : 199.h,
      width: 326.h,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsetsDirectional.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1.w, color: cardBorder),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(0, 1.h),
            blurRadius: 2.r,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.title,
            style: kStoryCardTitleStyle,
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    // image: NetworkImage(""),
                    image: AssetImage(
                      'asset/images/${story.user.iconUrl}',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Text(
                'By ${story.user.name}',
                style: kCardSubTitleStyle,
              )
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Text(
            story.text.substring(0, 100),
            style: kBodyLabelStyle,
          ),
          UIHelper.verticalSpaceSmall(),
          story.hasImages
              ? SizedBox(
                  height: 70.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Container(
                        width: 90.w,
                        height: 65.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Image.asset('asset/images/baby.png'),
                      );
                    },
                    separatorBuilder: (ctx, index) =>
                        UIHelper.horizontalSpaceSmall(),
                    itemCount: 3,
                  ),
                )
              : const SizedBox.shrink(),
          UIHelper.verticalSpaceSmall(),
          Text(
            '28 minutes ago',
            style: kCardSubTitleStyle,
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('asset/icon_images/fa-solid_comment.png'),
                  UIHelper.horizontalSpace(5),
                  Text(
                    '${story.comments.length}',
                    style: kCardSubTitleStyle,
                  )
                ],
              ),
              UIHelper.horizontalSpace(10),
              Row(
                children: [
                  Image.asset('asset/icon_images/icon-like.png'),
                  UIHelper.horizontalSpace(5),
                  Text(
                    '${story.likes}',
                    style: kCardSubTitleStyle,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
