import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/exchange/exchange_vm.dart';
import 'package:gweiland/resources/app_colors.dart';
import 'package:gweiland/resources/app_images.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/resources/app_styles.dart';

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
            SizedBox(
              height: 60.h,
            ),
            Row(
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
                    SvgPicture.asset(
                      AppSvgIcons.bell,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    SvgPicture.asset(
                      AppSvgIcons.setting,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      fillColor: AppColors.gray5Color,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          borderSide: BorderSide.none),
                      hintText: AppStrings.searcHCrypto,
                      hintStyle: AppStyles.interMediumStyle(
                          color: AppColors.gray30Color, fontSize: 13),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.gray30Color,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 6.h)),
                )),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray30Color),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppSvgIcons.filter),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        AppStrings.filter,
                        style: AppStyles.interMediumStyle(
                            color: AppColors.gray30Color),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.cryptocurrency,
                          style: AppStyles.interSemiBoldStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          AppStrings.nft,
                          style: AppStyles.interSemiBoldStyle(
                              fontSize: 20, color: AppColors.gray30Color),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Row(
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
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: vm.list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              vm.imgs[vm.list[index].symbol.toString()] != null
                                  ? Image.network(
                                      vm.imgs[vm.list[index].symbol.toString()]
                                          .toString(),
                                      width: 46.w,
                                      height: 46.h,
                                    )
                                  : SizedBox(
                                      width: 46.w,
                                      height: 46.h,
                                    ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              vm.list[index].symbol.toString(),
                                              style:
                                                  AppStyles.interSemiBoldStyle(
                                                      fontSize: 18),
                                            ),
                                            SizedBox(
                                              width: 17.w,
                                            ),
                                            vm.list[index].quote!.usd!
                                                        .percentChange24H! <
                                                    0.0
                                                ? SvgPicture.asset(
                                                    AppSvgIcons.graph,
                                                    width: 63.w,
                                                    height: 24.h,
                                                  )
                                                : SvgPicture.asset(
                                                    AppSvgIcons.graphp,
                                                    width: 63.w,
                                                    height: 18.h,
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          vm.list[index].name.toString(),
                                          style: AppStyles.interMediumStyle(
                                              fontSize: 13,
                                              color: AppColors.gray50Color),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${AppStrings.dollar} ${vm.list[index].quote!.usd!.price!.toStringAsFixed(2)} USD",
                                          style: AppStyles.interSemiBoldStyle(
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          "${vm.list[index].quote!.usd!.percentChange24H!.toStringAsFixed(1)}%",
                                          style: AppStyles.interMediumStyle(
                                              fontSize: 13,
                                              color: vm.list[index].quote!.usd!
                                                          .percentChange24H! <
                                                      0.0
                                                  ? AppColors.redColor
                                                  : AppColors.greenColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }
}
