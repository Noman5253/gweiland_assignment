import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_styles.dart';

class SearchField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final double? radius;
  final TextStyle? hintStyle;
  final Widget? icon;
  final EdgeInsets? contentPadding;
  final Function(String s)? onTextChanged;

  const SearchField({
    required this.hint,
    required this.controller,
    this.onTextChanged,
    this.hintStyle,
    this.icon,
    this.contentPadding,
    this.radius = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onTextChanged,
      decoration: InputDecoration(
          fillColor: AppColors.gray5Color,
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius!.r),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius!.r),
              borderSide: BorderSide.none),
          hintText: hint ?? "",
          hintStyle: hintStyle ??
              AppStyles.interMediumStyle(
                  color: AppColors.gray30Color, fontSize: 13),
          prefixIcon: icon ??
              const Icon(
                Icons.search,
                color: AppColors.gray30Color,
              ),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h)),
    );
  }
}
