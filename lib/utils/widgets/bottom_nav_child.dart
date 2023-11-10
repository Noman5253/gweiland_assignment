import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gweiland/resources/app_styles.dart';
import 'package:gweiland/utils/common.dart';

import '../../modules/home/home_vm.dart';
import '../../resources/app_colors.dart';

class BottomNavChild extends StatelessWidget {
  const BottomNavChild({
    required this.selectedIcon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.index,
    this.isPng = false,
    Key? key,
  }) : super(key: key);

  final String? selectedIcon;
  final String? title;
  final bool? isSelected;
  final VoidCallback? onTap;
  final int? index;
  final bool? isPng;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        return InkWell(
            onTap: onTap,
            child: Container(
              color: AppColors.blackColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isSelected!
                      ? isPng!
                          ? Image.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,
                            )
                          : SvgPicture.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,                          
                              colorFilter: const ColorFilter.mode(
                                  AppColors.grayColor, BlendMode.srcIn),
                            )
                      : isPng!
                          ? Image.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,                           
                            )
                          : SvgPicture.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.whiteColor, BlendMode.srcIn)
                            ),
                  
                  spacerH(5),
                  Text(
                    title!,
                    style: AppStyles.interSemiBoldStyle(
                        fontSize: 10.2,
                        color: isSelected!
                            ? AppColors.whiteColor
                            : AppColors.grayColor),
                  )
                ],
              ),
            ));
      },
    );
  }
}
