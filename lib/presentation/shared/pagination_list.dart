import 'package:community/domain/models/story.dart';
import 'package:community/presentation/community/components/recent_story_card.dart';
import 'package:community/presentation/community/components/trending_story_card.dart';
import 'package:community/presentation/community/pages/story_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../domain/controllers/stories_controller.dart';

class PaginationList extends StatelessWidget {
  const PaginationList({
    Key? key,
    this.isTrending = false,
  }) : super(key: key);

  final bool isTrending;

  @override
  Widget build(BuildContext context) {
    StoriesController storiesController = Get.put(StoriesController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: isTrending ? 215.h : 300.h,
          width: double.infinity,
          child: PageView.builder(
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.w),
                  child: isTrending
                      ? TrendingStoryCard(
                          story: trendingStories[index],
                          onPress: () => onTap(storiesController, index),
                        )
                      : RecentStoryCard(
                          story: trendingStories[index],
                        ),
                ),
              );
            },
            itemCount: trendingStories.length,
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.85,
            ),
            onPageChanged: (index) {},
          ),
        ),
      ],
    );
  }

  void onTap(StoriesController controller, int index) {
    Get.toNamed(
      StoryDetails.routeName,
      arguments: index,
    );
  }
}
