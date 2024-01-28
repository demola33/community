import 'package:community/presentation/community/components/nav_bar/side_bar_button.dart';
import 'package:community/presentation/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.title,
    this.sideBarIconUrl,
    this.hasActions = false,
    this.onPress,
  });

  final String title;
  final String? sideBarIconUrl;
  final bool hasActions;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 17.h),
      child: SizedBox(
        height: 65.h,
        width: 385.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SideBarButton(
                  onPress: onPress,
                  iconUrl: sideBarIconUrl,
                ),
                UIHelper.horizontalSpace(35),
                Text(
                  title,
                  style: kLargeTitleStyle,
                ),
              ],
            ),
            hasActions
                ? Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 0.50, color: greyBorder),
                          ),
                        ),
                        child: const Icon(
                          Icons.notifications_none_sharp,
                          color: kPrimaryLabelColor,
                          size: 19,
                        ),
                      ),
                      UIHelper.horizontalSpaceSmall(),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 0.50, color: greyBorder),
                          ),
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: kPrimaryLabelColor,
                          size: 19,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
