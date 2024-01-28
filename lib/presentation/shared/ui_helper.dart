import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  // Vertical spacing. Adjust to your liking.
  static final double _verticalSpaceSmall = 10.0.h;
  static final double _verticalSpaceMedium = 30.0.h;
  static final double _verticalSpaceLarge = 60.0.h;

  // Horizontal spacing . Adjust to your liking.
  static final double _horizontalSpaceSmall = 10.0.w;
  static final double _horizontalSpaceMedium = 30.0.w;
  static final double _horizontalSpaceLarge = 60.0.w;

  /// Returns a [SizedBox] equal to the [height] supplied
  static SizedBox verticalSpace(double height) {
    return SizedBox(height: height);
  }

  /// Returns a [SizedBox] with height set to [_verticalSpaceSmall]
  static SizedBox verticalSpaceSmall() {
    return verticalSpace(_verticalSpaceSmall);
  }

  /// Returns a [SizedBox] with height set to [_verticalSpaceMedium]
  static SizedBox verticalSpaceMedium() {
    return verticalSpace(_verticalSpaceMedium);
  }

  /// Returns a [SizedBox] with height set to [_verticalSpaceLarge]
  static SizedBox verticalSpaceLarge() {
    return verticalSpace(_verticalSpaceLarge);
  }

  /// Returns a [SizedBox] equal to the [width] supplied
  static SizedBox horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  /// Returns a [SizedBox] with height set to [_horizontalSpaceSmall]
  static SizedBox horizontalSpaceSmall() {
    return horizontalSpace(_horizontalSpaceSmall);
  }

  /// Returns a [SizedBox] with height set to [_horizontalSpaceMedium]
  static SizedBox horizontalSpaceMedium() {
    return horizontalSpace(_horizontalSpaceMedium);
  }

  /// Returns a [SizedBox] with height set to [_horizontalSpaceLarge]
  static SizedBox horizontalSpaceLarge() {
    return horizontalSpace(_horizontalSpaceLarge);
  }
}
