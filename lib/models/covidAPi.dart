import 'dart:convert';

import 'package:boboboe/models/global.dart';
import 'package:http/http.dart' as http;

class CovidApi {
  Global global = new Global();

  Future<void> getGlobalData() async {
    String globalDataUrl = "https://thevirustracker.com/free-api?global=stats";
    var response = await http.get(globalDataUrl);

    var jsonData = jsonDecode(response.body);

    if (jsonData['stat'] == '"ok') {
      jsonData["results"].forEach((element) {
        global = new Global(
            total_cases: element["total_cases"],
            total_affected_countries: element["total_affected_countries"],
            total_deaths: element["total_deaths"],
            total_recovered: element["total_recovered"],
            total_unresolved: element["total_unresolved"]);
      });
    }
  }
}
