import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../modules/home/home_vm.dart';
import '../../resources/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        return Container(
          margin:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: AppColors.blackColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children ?? [Container()],
          ),
        );
      },
    );
  }
}
