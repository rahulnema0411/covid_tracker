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

  void _setDataToCardDataLocal(String responseBody, String state) {
    var decodedData = jsonDecode(responseBody);

    String location = 'Madhya Pradesh';

    //TODO : make the data readable

    String confirmed = decodedData['statewise'][8]['confirmed'];
    String recovered = decodedData['statewise'][8]['recovered'];
    String deceased = decodedData['statewise'][8]['deaths'];

    String newConfirmed = decodedData['statewise'][8]['deltaconfirmed'];
    String newRecovered = decodedData['statewise'][8]['deltarecovered'];
    String newDeceased = decodedData['statewise'][8]['deltadeaths'];

    String activeCases = decodedData['statewise'][8]['active'];

    _cardDataLocal = CardDataType(
      confirmed: confirmed,
      recovered: recovered,
      deceased: deceased,
      newRecovered: newRecovered.toString(),
      newDeaths: newDeceased,
      newConfirmed: newConfirmed,
      location: location,
      activeCases: activeCases,
    );
  }

  void _setDataToCardDataCountry(String responseBody, String country) {
    var decodedData = jsonDecode(responseBody);

    int countryPosition = 93;

    String location = country;

    int confirmed = decodedData[93]['cases'];
    int recovered = decodedData[93]['recovered'];
    int deceased = decodedData[93]['deaths'];

    int newConfirmed = decodedData[93]['todayCases'];
    int newRecovered = decodedData[93]['todayRecovered'];
    int newDeceased = decodedData[93]['todayDeaths'];

    int activeRate = 0;
    int recoveryRate = 0;
    int deathRate = 0;

    int activeCases = decodedData[93]['active'];

    _cardDataCountry = CardDataType(
      confirmed: confirmed.toString(),
      recovered: recovered.toString(),
      deceased: deceased.toString(),
      deathRate: deathRate.toString(),
      recoveryRate: recoveryRate.toString(),
      newRecovered: newRecovered.toString(),
      newDeaths: newDeceased.toString(),
      newConfirmed: newConfirmed.toString(),
      location: location,
      activeCases: activeCases.toString(),
      activeRate: activeRate.toString(),
    );
  }

  void _setDataToCardDataGlobal(String responseBody) {
    var decodedData = jsonDecode(responseBody);

    String location = 'Global';

    int confirmed = decodedData['cases'];
    int recovered = decodedData['recovered'];
    int deceased = decodedData['deaths'];

    int newConfirmed = decodedData['todayCases'];
    int newRecovered = decodedData['todayRecovered'];
    int newDeceased = decodedData['todayDeaths'];

    int activeRate = 0;
    int recoveryRate = 0;
    int deathRate = 0;

    int activeCases = decodedData['active'];

    _cardDataGlobal = CardDataType(
      confirmed: confirmed.toString(),
      recovered: recovered.toString(),
      deceased: deceased.toString(),
      deathRate: deathRate.toString(),
      recoveryRate: recoveryRate.toString(),
      newRecovered: newRecovered.toString(),
      newDeaths: newDeceased.toString(),
      newConfirmed: newConfirmed.toString(),
      location: location,
      activeCases: activeCases.toString(),
      activeRate: activeRate.toString(),
    );
  }

  int getCountryNumber(String responseBody, String country) {
    var decodedData = jsonDecode(responseBody);
    int sum = 0;
    for (int i = 0; i < 186; i++) {
      sum++;
      if (country == decodedData['Countries'][76]['Country']) {
        break;
      }
    }
    return sum;
  }

  CardDataType get cardDataLocal => _cardDataLocal;

  CardDataType get cardDataCountry => _cardDataCountry;

  CardDataType get cardDataGlobal => _cardDataGlobal;
}
