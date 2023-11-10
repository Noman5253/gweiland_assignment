import 'package:flutter/material.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/resources/app_styles.dart';

class DashView extends StatelessWidget {
  const DashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.dashboard, style: AppStyles.interMediumStyle(),)));
  }
}