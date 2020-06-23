import 'dart:convert';
import 'package:covidtracker/models/card_data_type.dart';
import 'package:http/http.dart' as http;

import 'card_data.dart';

class Statistics {
  CardData _cardData;

  Statistics();

  Future<void> getStatistics() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');
    //print(response.body);

    String data = response.body;
    var decodedData = jsonDecode(data);

    print(decodedData['Countries'][100]['Country']);
  }

  Future<CardDataType> getCountryStatistics(String country) async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');

    CardData cardData = CardData.country(response, country);
    return cardData.cardDataCountry;
  }

  Future<CardDataType> getGlobalStatistics() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');

    CardData cardData = CardData.global(response);
    return cardData.cardDataGlobal;
  }
}
