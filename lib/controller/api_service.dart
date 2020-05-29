import 'dart:convert';

import 'package:curranceyLive/model/bank_data.dart';
import 'package:http/http.dart' as http;

import '../model/bank_data.dart';

class ApiService {


  Future<dynamic> fetchBankData({String currency}) async {

    final response = await http.get('https://egyptrates.com/api/v1/prices/$currency?token=9187A72434E5488E6CA54AF66AD34AB54109ADDFC9BF9B4F74255A0593EAA877');
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return BankDataList.fromJson(json.decode(response.body));

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
