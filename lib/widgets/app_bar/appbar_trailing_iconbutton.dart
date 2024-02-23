import 'package:flutter/material.dart';
import 'package:new_test_project/widgets/custom_icon_button.dart';
import 'package:new_test_project/widgets/custom_image_view.dart';

import '../../core/image_constant.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbutton extends StatelessWidget {
  AppbarTrailingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 23,
          width: 23,
          child: CustomImageView(
            imagePath: ImageConstant.imgPlus,
          ),
        ),
      ),
    );
  }
}
