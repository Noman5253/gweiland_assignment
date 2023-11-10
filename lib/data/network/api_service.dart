import 'dart:convert';
import 'package:gweiland/data/network/api_inteface.dart';
import 'package:gweiland/data/network/env.dart';
import 'package:http/http.dart' as http;

class ApiService extends ApiInterface {
  @override
  Future get(String endpoint, {String param=""}) async {
    //debugPrint("API $endpoint");
    //debugPrint("REQ $param");
    http.Client client = http.Client();
    http.Response response = await client.get(Uri.parse(Env.baseUrl + endpoint+param),        
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-CMC_PRO_API_KEY': Env.apikey
        });
    //debugPrint("RES ${response.body}");
    return jsonDecode(response.body);
  }

}
