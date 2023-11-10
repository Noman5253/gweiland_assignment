import 'package:get/get.dart';
import 'package:gweiland/modules/eshop/eshop_vm.dart';
import 'package:gweiland/modules/exchange/exchange_vm.dart';
import 'package:gweiland/modules/home/home_vm.dart';
import 'package:gweiland/modules/launchpad/launchpad_vm.dart';
import 'package:gweiland/modules/wallet/wallet_vm.dart';

import '../modules/dash/dash_vm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeVM());
  }
}


class ExchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExchangeVM());
  }
}

class DashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashVM());
  }
}

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WalletVM());
  }
}

class LaunchpadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LaunchpadVM());
  }
}

class EShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EShopVM());
  }
}
