import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconURL,
    required this.width,
    required this.height,
    this.onPress,
  }) : super(key: key);

  final String iconURL;
  final double width;
  final double height;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(
        maxHeight: 24.h,
        maxWidth: 24.w,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Image.asset(
          'asset/icon_images/$iconURL',
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 12.w,
        //   vertical: 13.75.h,
        // ),
      ),
    );
  }
}
