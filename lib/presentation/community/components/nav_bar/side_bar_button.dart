import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({
    Key? key,
    this.onPress,
    this.iconUrl,
  }) : super(key: key);

  final VoidCallback? onPress;
  final String? iconUrl;

  @override
  Widget build(BuildContext context) {
    final String iconURL = iconUrl ?? 'arrow-back-outline.png';

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
      ),
    );
  }
}
