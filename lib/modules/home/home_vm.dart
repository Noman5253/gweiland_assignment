import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/dash/dash_view.dart';
import 'package:gweiland/modules/eshop/eshop_view.dart';
import 'package:gweiland/modules/exchange/exchange_view.dart';
import 'package:gweiland/modules/exchange/exchange_vm.dart';
import 'package:gweiland/modules/launchpad/launchpad_view.dart';
import 'package:gweiland/modules/wallet/wallet_view.dart';
import 'package:gweiland/resources/app_routes.dart';
import 'package:gweiland/utils/bindings.dart';

class HomeVM extends GetxController {
  int selectedIndex = BottomBarSelection.exchnage;

  final pages = <String>[
    AppRoutes.eshop,
    AppRoutes.exchange,
    AppRoutes.dash,
    AppRoutes.launchPad,
    AppRoutes.wallet,
  ];

  void changePage(int index) {
    selectedIndex = index;    
    update();
    Get.toNamed(pages[index], id: 1);
  }

  GetPageRoute getEshopRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => const EShopView(),
      binding: EShopBinding(),
    );
  }

  GetPageRoute getExchangesRoute(RouteSettings settings) {
    Get.delete<ExchangeVM>(force: true);
    return GetPageRoute(
      settings: settings,
      page: () => const ExchangeView(),
      binding: ExchangeBinding(),
    );
  }

  GetPageRoute getLaunchpadRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => const LaunchpadView(),
      binding: LaunchpadBinding(),
    );
  }

  GetPageRoute getWalletRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => const WalletView(),
      binding: WalletBinding(),
    );
  }

  GetPageRoute getDashRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => const DashView(),
      binding: DashBinding(),
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.eshop) {
      return getEshopRoute(settings);
    }

    if (settings.name == AppRoutes.exchange) {
      return getExchangesRoute(settings);
    }

    if (settings.name == AppRoutes.dash) {
      return getDashRoute(settings);
    }

    if (settings.name == AppRoutes.launchPad) {
      return getLaunchpadRoute(settings);
    }

    if (settings.name == AppRoutes.wallet) {
      return getWalletRoute(settings);
    }

    return null;
  }
}

class BottomBarSelection {
  static const eshop = 0;
  static const exchnage = 1;
  static const dash = 2;
  static const launchpad = 3;
  static const wallet = 4;
}
