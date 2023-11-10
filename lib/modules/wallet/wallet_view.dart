import 'package:flutter/material.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/resources/app_styles.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.wallet, style: AppStyles.interMediumStyle(),)));
  }
}