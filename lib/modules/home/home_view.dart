import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/home/home_vm.dart';
import 'package:gweiland/resources/app_images.dart';
import 'package:gweiland/resources/app_routes.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/utils/common.dart';
import 'package:gweiland/utils/widgets/bottom_nav_child.dart';
import 'package:gweiland/utils/widgets/bottom_navbar.dart';

import '../../resources/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return Scaffold(
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.exchange,
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
                  vm.onTap(BottomBarSelection.eshop);
                },
              ),
              spacerW(22),
              //Exchange
              BottomNavChild(
                index: BottomBarSelection.exchnage,
                selectedIcon: AppSvgIcons.exchange,
                title: AppStrings.exchanges,
                isSelected: vm.selectedIndex == BottomBarSelection.exchnage
                    ? true
                    : false,
                onTap: () {
                  vm.onTap(BottomBarSelection.exchnage);
                },
              ),
              //Dashboard
              spacerW(14),
              InkWell(
                onTap: () {
                  vm.onTap(BottomBarSelection.dash);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
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
              spacerW(14),
              //Launchpad
              BottomNavChild(
                index: BottomBarSelection.launchpad,
                selectedIcon: AppSvgIcons.launchpad,
                title: AppStrings.launchpads,
                isSelected: vm.selectedIndex == BottomBarSelection.launchpad
                    ? true
                    : false,
                onTap: () {
                  vm.onTap(BottomBarSelection.launchpad);
                },
              ),
              spacerW(22),

              //wallet
              BottomNavChild(
                index: BottomBarSelection.wallet,
                selectedIcon: AppSvgIcons.wallet,
                title: AppStrings.wallet,
                isSelected: vm.selectedIndex == BottomBarSelection.wallet
                    ? true
                    : false,
                onTap: () {
                  vm.onTap(BottomBarSelection.wallet);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
