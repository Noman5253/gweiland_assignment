import 'package:flutter/material.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/resources/app_styles.dart';

class LaunchpadView extends StatelessWidget {
  const LaunchpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.launchpads, style: AppStyles.interMediumStyle(),)));
  }
}