import 'package:gweiland/modules/exchange/exchange_model/currency_list_model.dart';
import 'package:gweiland/modules/exchange/exchange_model/metadata_info_model.dart';

abstract class ExchangeRepo {
  Future<CurrencyListModel> getCurrencyList({String? endpoint,String param});
  Future<MetadataInfo> getCurrencyMetadata({ String? endpoint, String param,});
}