import 'package:gweiland/data/network/api_service.dart';
import 'package:gweiland/modules/exchange/exchange_model/currency_list_model.dart';
import 'package:gweiland/modules/exchange/exchange_model/metadata_info_model.dart';
import 'package:gweiland/modules/exchange/exchange_repo/exchange_repo.dart';

import '../../../data/network/endpoints.dart';

class ExchangeRepoImpl extends ExchangeRepo {
  ApiService apiService = ApiService();

  @override
  Future<CurrencyListModel> getCurrencyList({String? endpoint, String param=""}) async{
    return CurrencyListModel.fromJson(
        await apiService.get(endpoint ?? Endpoints.cryptocurrency+Endpoints.listings+Endpoints.latest, param: param));
  }

  @override
  Future<MetadataInfo> getCurrencyMetadata({String? endpoint, String param=""}) async {
    return MetadataInfo.fromJson(
        await apiService.get(endpoint ?? Endpoints.cryptocurrency+Endpoints.info, param: param));
  }
  
}
