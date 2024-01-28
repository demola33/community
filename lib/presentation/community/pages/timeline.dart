import 'package:community/presentation/community/components/nav_bar/nav_bar.dart';
import 'package:community/presentation/community/components/search_field_widget.dart';
import 'package:community/presentation/shared/pagination_list.dart';
import 'package:community/presentation/shared/ui_helper.dart';
import 'package:community/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/icon_button.dart';
import '../components/timeline_card.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  static String routeName = "/timeline";

  @override
  Widget build(BuildContext context) {
    const String iconURL = 'icon-expand.png';
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w),
                child: Column(
                  children: [
                    NavBar(
                      title: 'Community',
                      sideBarIconUrl: 'icon-sidebar.png',
                      hasActions: true,
                      onPress: () {},
                    ),
                    UIHelper.verticalSpace(11),
                    const SearchFieldWidget(),
                    UIHelper.verticalSpaceMedium(),
                    const TimeLineCard(),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trending stories',
                            style: kTitleStyle,
                          ),
                          Row(
                            children: [
                              Text(
                                'See All',
                                style: kSubTitleStyle,
                              ),
                              UIHelper.horizontalSpace(5),
                              CustomIconButton(
                                iconURL: iconURL,
                                width: 20.w,
                                height: 20.h,
                              )
                            ],
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20),
                      const PaginationList(isTrending: true),
                      UIHelper.verticalSpace(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent stories',
                            style: kTitleStyle,
                          ),
                          Row(
                            children: [
                              Text(
                                'See All',
                                style: kSubTitleStyle,
                              ),
                              UIHelper.horizontalSpace(5),
                              CustomIconButton(
                                iconURL: iconURL,
                                width: 20.w,
                                height: 20.h,
                              )
                            ],
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20),
                      const PaginationList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
