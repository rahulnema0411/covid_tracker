import 'dart:convert';
import 'file:///F:/AndroidStudioProjects/foundOnGit/covid_tracker/lib/models/card_data_type.dart';

import 'package:http/http.dart' as http;

class Statistics {
  Statistics();

  void getStatistics() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');
    //print(response.body);

    String data = response.body;
    var decodedData = jsonDecode(data);

    print(decodedData['Countries'][100]['Country']);
  }

  void getGlobalStatistics() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');

    String data = response.body;
    var decodedData = jsonDecode(data);
  }
}
