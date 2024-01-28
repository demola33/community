import 'package:community/domain/controllers/story_details_controller.dart';
import 'package:community/domain/models/story.dart';
import 'package:community/presentation/community/components/comment_card.dart';
import 'package:community/presentation/community/pages/timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../shared/custom_button.dart';
import '../../shared/ui_helper.dart';
import '../components/nav_bar/nav_bar.dart';

class StoryDetails extends StatelessWidget {
  const StoryDetails({super.key});

  static String routeName = "/story_details";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoryDetailsController());
    // final Story? story = controller.story;
    final int index = controller.index ?? 0;
    final story = trendingStories[index];
    final commentLength = story.comments.length;
    final commentText =
        commentLength > 0 ? 'Comments ($commentLength)' : 'Comment';

    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w),
            child: Column(
              children: [
                NavBar(
                  title: 'Story',
                  onPress: () => Get.back(),
                ),
                UIHelper.verticalSpace(15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story.title,
                          style: kStoryCardTitleStyle.copyWith(fontSize: 18.sp),
                        ),
                        UIHelper.verticalSpace(15),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.w,
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
                            UIHelper.horizontalSpace(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'By ${story.user.name}',
                                  style:
                                      kFormLabelStyle.copyWith(fontSize: 14.sp),
                                ),
                                UIHelper.verticalSpace(5),
                                Text(
                                  '28 minutes ago',
                                  style: kCardSubTitleStyle.copyWith(
                                      fontSize: 12.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        UIHelper.verticalSpace(15),
                        Text(
                          story.text,
                          style: kBodyLabelStyle,
                        ),
                        UIHelper.verticalSpace(15),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    'asset/icon_images/fa-solid_comment.png'),
                                UIHelper.horizontalSpace(5),
                                Text(
                                  '$commentLength',
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
                        ),
                        UIHelper.verticalSpaceMedium(),
                        if (commentLength > 0) ...<Widget>[
                          Text(
                            commentText,
                            style: kStoryCardTitleStyle,
                          ),
                          UIHelper.verticalSpace(15),
                          ListView.separated(
                            itemBuilder: (context, index) {
                              final comment = story.comments[index];

                              return CommentCard(comment: comment);
                            },
                            separatorBuilder: (context, index) =>
                                UIHelper.verticalSpaceMedium(),
                            itemCount: commentLength,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                          UIHelper.verticalSpaceLarge(),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add a comment',
                              style: kFormLabelStyle,
                            ),
                            UIHelper.verticalSpaceSmall(),
                            TextFormField(
                              minLines: 4,
                              maxLines: 10,
                              maxLength: 1000,
                              decoration: InputDecoration(
                                hintText: 'Enter text',
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
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                CustomButton(
                  label: 'Publish',
                  onPress: () => Get.toNamed(Timeline.routeName),
                ),
                UIHelper.verticalSpaceMedium(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
