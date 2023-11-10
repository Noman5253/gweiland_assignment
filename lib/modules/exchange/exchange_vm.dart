import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/exchange/exchange_repo/exchange_repo_impl.dart';

import 'exchange_model/currency_list_model.dart';

class ExchangeVM extends GetxController {
  ExchangeRepoImpl repo = ExchangeRepoImpl();
  List<Datum> list = List.empty(growable: true);
  String sym = "";
  HashMap<String?, String?> imgs = HashMap();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    await getCurrencyList();
    getCurrencyMeta(symbols: sym);
  }

  Future<void> getCurrencyList() async {
    await repo.getCurrencyList().then((response) {
      int idx = list.length;
      sym = "";
      list.insertAll(list.length, response.data!);
      for (int i = idx; i < list.length - 1; i++) {
        if (!imgs.containsKey(list[i].symbol)) {
          imgs[list[i].symbol] = null;
        }
        sym = "$sym${list[i].symbol},";
      }
      sym = sym + list[list.length - 1].symbol.toString();

      update();
    }).onError((error, stackTrace) {
      debugPrint("error ${error.toString()}");
    });
  }

  Future<void> getCurrencyMeta({String? symbols = ''}) async {
    await repo.getCurrencyMetadata(param: "?symbol=$symbols").then((response) {
      response.data!.forEach((symbol, value) {
        if (imgs.containsKey(symbol) && imgs[symbol] == null) {
          imgs[symbol] = value.first.logo.toString();
        }
      });
      update();
    }).onError((error, stackTrace) {
      debugPrint("error ${error.toString()}");
    });
  }
}
