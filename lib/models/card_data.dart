import 'dart:convert';

import 'package:covidtracker/models/card_data_type.dart';
import 'package:http/http.dart';

class CardData {
  CardDataType _cardDataLocal;
  CardDataType _cardDataCountry;
  CardDataType _cardDataGlobal;

  CardData.state(Response response, String ofState) {
    String responseBody = response.body;
    _setDataToCardDataLocal(responseBody, ofState);
  }

  CardData.country(Response response, String ofCountry) {
    String responseBody = response.body;
    _setDataToCardDataCountry(responseBody, ofCountry);
  }

  CardData.global(Response response) {
    String responseBody = response.body;
    _setDataToCardDataGlobal(responseBody);
  }

  void _setDataToCardDataLocal(String responseBody, String state) {}
  void _setDataToCardDataCountry(String responseBody, String country) {
    var decodedData = jsonDecode(responseBody);

    String location = country;

    int confirmed = decodedData['Countries'][country]['TotalConfirmed'];
    int recovered = decodedData['Countries'][country]['TotalRecovered'];
    int deceased = decodedData['Countries'][country]['TotalDeaths'];

    int newConfirmed = decodedData['Countries'][country]['NewConfirmed'];
    int newRecovered = decodedData['Countries'][country]['NewRecovered'];
    int newDeceased = decodedData['Countries'][country]['NewDeaths'];

    int activeRate = 0;
    int recoveryRate = 0;
    int deathRate = 0;

    int activeCases = confirmed - recovered - deceased;

    _cardDataGlobal = CardDataType(
      confirmed: confirmed as String,
      recovered: recovered as String,
      deceased: deceased as String,
      deathRate: deathRate as String,
      recoveryRate: recoveryRate as String,
      newRecovered: newRecovered as String,
      newDeaths: newDeceased as String,
      newConfirmed: newConfirmed as String,
      location: location,
      activeCases: activeCases as String,
      activeRate: activeRate as String,
    );
  }

  void _setDataToCardDataGlobal(String responseBody) {
    var decodedData = jsonDecode(responseBody);

    String location = 'Global';

    int confirmed = decodedData['Global']['TotalConfirmed'];
    int recovered = decodedData['Global']['TotalRecovered'];
    int deceased = decodedData['Global']['TotalDeaths'];

    int newConfirmed = decodedData['Global']['NewConfirmed'];
    int newRecovered = decodedData['Global']['NewRecovered'];
    int newDeceased = decodedData['Global']['NewDeaths'];

    int activeRate = 0;
    int recoveryRate = 0;
    int deathRate = 0;

    int activeCases = confirmed - recovered - deceased;

    _cardDataGlobal = CardDataType(
      confirmed: confirmed as String,
      recovered: recovered as String,
      deceased: deceased as String,
      deathRate: deathRate as String,
      recoveryRate: recoveryRate as String,
      newRecovered: newRecovered as String,
      newDeaths: newDeceased as String,
      newConfirmed: newConfirmed as String,
      location: location,
      activeCases: activeCases as String,
      activeRate: activeRate as String,
    );
  }

  CardDataType get cardDataLocal => _cardDataLocal;

  CardDataType get cardDataCountry => _cardDataCountry;

  CardDataType get cardDataGlobal => _cardDataGlobal;
}
