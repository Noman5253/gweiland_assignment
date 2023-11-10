import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gweiland/resources/app_images.dart';

import '../../modules/exchange/exchange_model/currency_list_model.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_styles.dart';
import '../common.dart';

class ListCard extends StatelessWidget {
  final Datum? data;
  final bool? isInBanner;
  final String? logo;
  final bool? is24HrChangeNegative;
  
  const ListCard(
      {this.data,
      this.isInBanner = false,
      this.logo,
      this.is24HrChangeNegative,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          logo != null
              ? Image.network(
                  logo.toString(),
                  width: 46.w,
                  height: 46.h,
                )
              : SizedBox(
                  width: 46.w,
                  height: 46.h,
                ),
          spacerW(8),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(data!.symbol.toString(),
                            style: isInBanner!
                                ? AppStyles.interBoldStyle(fontSize: 18)
                                : AppStyles.interSemiBoldStyle(fontSize: 18)),
                        spacerW(17),
                        isInBanner!
                            ? Container()
                            : is24HrChangeNegative!
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
                    spacerH(4),
                    Text(
                      data!.name.toString(),
                      style: AppStyles.interMediumStyle(
                          fontSize: 13,
                          color: isInBanner!
                              ? AppColors.blackColor
                              : AppColors.gray50Color),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${AppStrings.dollar}${data!.quote!.usd!.price!.toStringAsFixed(2)} USD",
                      style: isInBanner!
                          ? AppStyles.interBoldStyle(fontSize: 16)
                          : AppStyles.interSemiBoldStyle(fontSize: 16),
                    ),
                    spacerH(4),
                    Text(
                      "${data!.quote!.usd!.percentChange24H!.toStringAsFixed(1)}%",
                      style: AppStyles.interMediumStyle(
                          fontSize: 13,
                          color: is24HrChangeNegative!
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
  }
}
