import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gweiland/data/network/api_inteface.dart';
import 'package:gweiland/data/network/endpoints.dart';
import 'package:http/http.dart' as http;

class ApiService extends ApiInterface {
  @override
  Future get(String endpoint, {String param=""}) async {
    debugPrint("API $endpoint");
    debugPrint("REQ $param");
    
    http.Client client = http.Client();
    http.Response response = await client.get(Uri.parse(Endpoints.baseUrl + endpoint+param),        
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-CMC_PRO_API_KEY': "5a47a16b-3964-402c-9136-51b33c9f7d3a"
        });
    debugPrint("RES ${response.body}");
    return jsonDecode(response.body);
  }

}
