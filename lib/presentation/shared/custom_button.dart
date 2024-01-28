import 'package:community/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.width,
    this.onPress,
  });

  final double? width;
  final String label;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width ?? 390.w,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: kButtonTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
