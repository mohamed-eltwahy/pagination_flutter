import 'dart:convert';

import 'package:http/http.dart' as http;

import 'config.dart';
import 'models/data_model.dart';

class APIService {
  Future<DataModel> getData(pageNumber) async {
      String url = 'https://api.instantwebtools.net/v1/passenger?page=$pageNumber"&size=10';
    // String url =
    //     "/GetRadios?pageSize=15&pageNumber=$pageNumber";

    print("URL : $url");
    final response = await http.get(Config.apiURL+ url as Uri);
    if (response.statusCode == 200) {
      return DataModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
