// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/home/home_vm.dart';
import 'package:gweiland/resources/app_images.dart';
import 'package:gweiland/resources/app_routes.dart';
import 'package:gweiland/resources/app_strings.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return Scaffold(
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.exchange, //profileRoute,
          onGenerateRoute: vm.onGenerateRoute,
        ),
        bottomNavigationBar: Container(
          color: AppColors.whiteColor,
          child: BottomNavBar(
            children: [
              //EShop
              BottomNavChild(
                index: BottomBarSelection.eshop,
                selectedIcon: AppPngIcons.eshop,
                isPng: true,
                title: AppStrings.eshop,
                isSelected:
                    vm.selectedIndex == BottomBarSelection.eshop ? true : false,
                onTap: () {
                  vm.selectedIndex = BottomBarSelection.eshop;
                  vm.changePage(BottomBarSelection.eshop);
                  vm.update();
                },
              ),
              SizedBox(
                width: 22.w,
              ),
              //Exchange
              BottomNavChild(
                index: BottomBarSelection.exchnage,
                selectedIcon: AppSvgIcons.exchange,
                title: AppStrings.exchanges,
                isSelected: vm.selectedIndex == BottomBarSelection.exchnage
                    ? true
                    : false,
                onTap: () {
                  vm.selectedIndex = BottomBarSelection.exchnage;
                  vm.changePage(BottomBarSelection.exchnage);
                  vm.update();
                },
              ),
              //Dashboard
              SizedBox(
                width: 14.w,
              ),
              InkWell(
                onTap: () {
                  vm.selectedIndex = BottomBarSelection.dash;
                  vm.changePage(BottomBarSelection.dash);
                  vm.update();
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: Offset(1, 1),
                    //       blurRadius: 12,
                    //       color: Colors.amber)
                    // ],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      AppPngIcons.dash,
                      width: 65.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              //Launchpad
              BottomNavChild(
                index: BottomBarSelection.launchpad,
                selectedIcon: AppSvgIcons.launchpad,
                title: AppStrings.launchpads,
                isSelected: vm.selectedIndex == BottomBarSelection.launchpad
                    ? true
                    : false,
                onTap: () {
                  vm.selectedIndex = BottomBarSelection.launchpad;
                  vm.changePage(BottomBarSelection.launchpad);
                  vm.update();
                },
              ),
              SizedBox(
                width: 22.w,
              ),
              //wallet
              BottomNavChild(
                index: BottomBarSelection.wallet,
                selectedIcon: AppSvgIcons.wallet,
                title: AppStrings.wallet,
                isSelected: vm.selectedIndex == BottomBarSelection.wallet
                    ? true
                    : false,
                onTap: () {
                  vm.selectedIndex = BottomBarSelection.wallet;
                  vm.changePage(BottomBarSelection.wallet);
                  vm.update();
                },
              )
            ],
          ),
        ),
      );
    });
  }
}

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
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
          //padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
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
                              //color: AppColors.grayColor,
                              // colorFilter: const ColorFilter.mode(
                              //     AppColors.grayColor, BlendMode.srcIn),
                            )
                          : SvgPicture.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,
                              color: AppColors.grayColor,
                              // colorFilter: const ColorFilter.mode(
                              //     AppColors.grayColor, BlendMode.srcIn),
                            )
                      : isPng!
                          ? Image.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,
                              color: AppColors.whiteColor,
                              // colorFilter: const ColorFilter.mode(
                              //     AppColors.grayColor, BlendMode.srcIn),
                            )
                          : SvgPicture.asset(
                              selectedIcon!,
                              width: 19.w,
                              height: 19.h,
                              color: AppColors.whiteColor,
                              // colorFilter: const ColorFilter.mode(
                              //     AppColors.whiteColor, BlendMode.)
                            ),
                  //const SizedBox(height: 14,),
                  SizedBox(
                    height: 5.h,
                  ),
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
