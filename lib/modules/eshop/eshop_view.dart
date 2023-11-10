import 'package:flutter/material.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/resources/app_styles.dart';

class EShopView extends StatelessWidget {
  const EShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.eshop, style: AppStyles.interMediumStyle(),)));
  }
}