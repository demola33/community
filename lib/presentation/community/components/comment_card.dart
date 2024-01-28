import 'package:community/presentation/shared/ui_helper.dart';
import 'package:community/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/comment.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment? comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326.h,
      padding: EdgeInsetsDirectional.all(15.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      'asset/images/${comment?.user.iconUrl ?? ''}',
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
                    'By ${comment?.user.name ?? ''}',
                    style: kFormLabelStyle.copyWith(fontSize: 14.sp),
                  ),
                  UIHelper.verticalSpace(5),
                  Text(
                    '28 minutes ago',
                    style: kCardSubTitleStyle.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
          UIHelper.verticalSpace(15),
          Text(
            comment?.text ?? '',
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
                  Image.asset('asset/icon_images/icon-reply.png'),
                  UIHelper.horizontalSpace(5),
                  Text(
                    '0',
                    style: kCardSubTitleStyle,
                  )
                ],
              ),
              UIHelper.horizontalSpace(20),
              Row(
                children: [
                  Image.asset('asset/icon_images/icon-like.png'),
                  UIHelper.horizontalSpace(5),
                  Text(
                    '${comment?.likes ?? 0}',
                    style: kCardSubTitleStyle,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
