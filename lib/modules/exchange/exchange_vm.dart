import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/exchange/exchange_repo/exchange_repo_impl.dart';

import 'exchange_model/currency_list_model.dart';

class ExchangeVM extends GetxController {
  ExchangeRepoImpl repo = ExchangeRepoImpl();
  List<Datum> list = List.empty(growable: true);
  List<Datum> baseList = List.empty(growable: true);
  String id = "";
  HashMap<String?, String?> imgs = HashMap();
  int start = 1;
  int limit = 20;
  String cfilter = "market_cap";
  bool isLoading = true;
  TextEditingController searchCtrl = TextEditingController();

  void showLoader() {
    isLoading = true;
    update();
  }

  void hideLoader() {
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  //This runs in onInit method.
  Future<void> init() async {
    await getCurrencyList();
    getCurrencyMeta();
  }

  ///This method fetches the top currency data with filter and limit.
  Future<void> getCurrencyList() async {
    showLoader();
    await repo
        .getCurrencyList(param: "?start=$start&limit=$limit&sort=$cfilter")
        .then((response) {
      //Clearing older data    
      list.clear();
      baseList.clear();
      id = "";

      //adding data to lists.
      list.insertAll(list.length, response.data!);
      baseList.addAll(list);
      
      //getting ids of the data and storing into hashmap so that we can
      //directly get the logos from hashmap itself.
      for (int i = 0; i < list.length; i++) {
        if (!imgs.containsKey(list[i].id.toString())) {
          imgs[list[i].id.toString()] = null;
        }
        id = "$id${list[i].id},";
      }
      id = id.substring(0, id.length - 1);

      //updating state
      update();
    }).onError((error, stackTrace) {
      Get.snackbar("Api error", error.toString(), duration: const Duration(seconds: 3));
    });
    hideLoader();
  }

  ///This api fetches logos and store into the hashmap.
  Future<void> getCurrencyMeta() async {
    await repo.getCurrencyMetadata(param: "?id=$id").then((response) {
      //Getting logo images and putting in hashmap.
      response.data!.forEach((symbol, value) {
        if (imgs.containsKey(symbol) && imgs[symbol] == null) {
          imgs[symbol] = value.first.logo.toString();
        }
      });

      //updating state.
      update();
    }).onError((error, stackTrace) {
      Get.snackbar("Api error", error.toString(), duration: const Duration(seconds: 3));
    });
  }

  ///Helper method that checks if [percent_change_24h] is negative or not.
  bool is24HrChangeNegative(int index) =>
      list[index].quote!.usd!.percentChange24H! < 0.0;

  //This method locally searches in list.
  void search(String query) {
    list.clear();
    if (query.toString().trim().isEmpty) {
      list.addAll(baseList);
    } else {
      //if the query is matched in name or symbol then data is added into search.
      list.addAll(baseList.where((el) {
        return (el.name
                .toString()
                .trim()
                .toLowerCase()
                .contains(query.toString().trim().toLowerCase()) ||
            el.symbol
                .toString()
                .trim()
                .toLowerCase()
                .contains(query.toString().trim().toLowerCase()));
      }));
    }
    update();
  }

  //Refreshes the data by recalling apis
  Future<void> onRefresh() async {
    searchCtrl.clear();
    await getCurrencyList();
    getCurrencyMeta();
  }

  //Sort list using api.
  Future<void> sortBy(ExchangeVM vm, String sortBy) async {
    cfilter = sortBy;
    searchCtrl.clear();
    update();
    await getCurrencyList();
    getCurrencyMeta();
  }
}
