import 'dart:convert';

import 'package:challange1/model/bank_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
final url='https://egyptrates.com/api/v1/prices/USD?token=9187A72434E5488E6CA54AF66AD34AB54109ADDFC9BF9B4F74255A0593EAA877';

  Future<BankDataList> fetchBankData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      print(response.body);
      return BankDataList.fromJson(json.decode(response.body));

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
