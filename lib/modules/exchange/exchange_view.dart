import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/exchange/exchange_vm.dart';
import 'package:gweiland/resources/app_colors.dart';
import 'package:gweiland/resources/app_images.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/resources/app_styles.dart';
import 'package:badges/badges.dart' as b;
import 'package:gweiland/utils/widgets/search_field.dart';

import '../../utils/common.dart';
import '../../utils/widgets/list_card.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangeVM>(builder: (vm) {
      return Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          children: [
            spacerH(60),
            _appBar(),
            spacerH(25),
            searchAndFilter(vm, context),
            spacerH(22),
            vm.isLoading
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: RefreshIndicator(
                        onRefresh: vm.onRefresh,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            _heading1(),
                            spacerH(15),
                            vm.list.isEmpty ? Container() : _topBanner(vm),
                            spacerH(20),
                            _heading2(),
                            spacerH(20),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: vm.list.length,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? Container()
                                    : ListCard(
                                        data: vm.list[index],
                                        logo: vm
                                            .imgs[vm.list[index].id.toString()],
                                        is24HrChangeNegative:
                                            vm.is24HrChangeNegative(index),
                                      );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ));
    });
  }

  Row searchAndFilter(ExchangeVM vm, context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: SearchField(
          controller: vm.searchCtrl,
          onTextChanged: (s) {
            vm.search(s);
          },
          hint: AppStrings.searcHCrypto,
        )),
        spacerW(10),
        _filterButton(vm, context)
      ],
    );
  }

  Row _heading2() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.topCryptos,
          style: AppStyles.interMediumStyle(fontSize: 18),
        ),
        Text(
          AppStrings.viewAll,
          style: AppStyles.interMediumStyle(
              fontSize: 13, color: AppColors.gray50Color),
        ),
      ],
    );
  }

  Row _heading1() {
    return Row(
      children: [
        Text(
          AppStrings.cryptocurrency,
          style: AppStyles.interSemiBoldStyle(fontSize: 20),
        ),
        spacerW(20),
        Text(
          AppStrings.nft,
          style: AppStyles.interSemiBoldStyle(
              fontSize: 20, color: AppColors.gray30Color),
        ),
      ],
    );
  }

  void _showPopupMenu(ExchangeVM vm, BuildContext? context, Offset offset) {
    double left = offset.dx;
    double top = offset.dy;
    showMenu(
      context: context!,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("market_cap")],
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("price")],
          ),
        ),
        const PopupMenuItem(
          value: 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("volume_24h")],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) async {
      if (value != null) {
        switch (value) {
          case 1:
            await vm.sortBy(vm, "market_cap");
            break;
          case 2:
            await vm.sortBy(vm, "price");
            break;
          case 3:
            await vm.sortBy(vm, "volume_24h");
            break;
        }
      }
    });
  }

  Widget _filterButton(ExchangeVM vm, BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _showPopupMenu(vm, context, details.globalPosition);
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray30Color),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppSvgIcons.filter),
              spacerW(5),
              Text(
                vm.cfilter, 
                style: AppStyles.interMediumStyle(
                  color: AppColors.gray30Color,
                ),
              )
            ],
          )),
    );
  }

  Row _appBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Row(
          children: [
            Text(
              AppStrings.exchanges.toUpperCase(),
              style: AppStyles.interSemiBoldStyle(fontSize: 20),
            )
          ],
        )),
        Row(
          children: [
            b.Badge(
              showBadge: true,
              position: b.BadgePosition.custom(bottom: 20, start: 15),
              badgeStyle: const b.BadgeStyle(badgeColor: AppColors.yellowColor),
              child: SvgPicture.asset(
                AppSvgIcons.bell,
              ),
            ),
            spacerW(16),
            SvgPicture.asset(
              AppSvgIcons.setting,
            )
          ],
        )
      ],
    );
  }

  Container _topBanner(ExchangeVM vm) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: vm.is24HrChangeNegative(0)
              ? AppColors.redColor.withOpacity(0.1)
              : AppColors.green10Color),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 26.h),
            child: ListCard(
              data: vm.list.first,
              logo: vm.imgs[vm.list.first.id.toString()],
              isInBanner: true,
              is24HrChangeNegative: vm.is24HrChangeNegative(0),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  height: 52.h,
                  // color: AppColors.redColor,
                  child: Image.asset(
                    AppPngIcons.bannerGraph,
                    fit: BoxFit.fill,
                    color: vm.is24HrChangeNegative(0)
                        ? AppColors.redColor
                        : AppColors.greenColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


