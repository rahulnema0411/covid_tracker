import 'dart:convert';

import 'package:covidtracker/constants.dart';
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
    print('in setting data to card local');
    print(state);
    int stateNumber = getStateNumber(responseBody, state);
    print(stateNumber);
    String location = decodedData['statewise'][stateNumber]['state'];

    //TODO : make the data readable

    String confirmed =
        Essentials.toReadableInt(decodedData['statewise'][8]['confirmed']);
    String recovered =
        Essentials.toReadableInt(decodedData['statewise'][8]['recovered']);
    String deceased =
        Essentials.toReadableInt(decodedData['statewise'][8]['deaths']);

    String newConfirmed =
        Essentials.toReadableInt(decodedData['statewise'][8]['deltaconfirmed']);
    String newRecovered =
        Essentials.toReadableInt(decodedData['statewise'][8]['deltarecovered']);
    String newDeceased =
        Essentials.toReadableInt(decodedData['statewise'][8]['deltadeaths']);

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
      confirmed: Essentials.toReadableInt(confirmed.toString()),
      recovered: Essentials.toReadableInt(recovered.toString()),
      deceased: Essentials.toReadableInt(deceased.toString()),
      deathRate: Essentials.toReadableInt(deathRate.toString()),
      recoveryRate: Essentials.toReadableInt(recoveryRate.toString()),
      newRecovered: Essentials.toReadableInt(newRecovered.toString()),
      newDeaths: Essentials.toReadableInt(newDeceased.toString()),
      newConfirmed: Essentials.toReadableInt(newConfirmed.toString()),
      location: location,
      activeCases: Essentials.toReadableInt(activeCases.toString()),
      activeRate: Essentials.toReadableInt(activeRate.toString()),
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
      confirmed: Essentials.toReadableInt(confirmed.toString()),
      recovered: Essentials.toReadableInt(recovered.toString()),
      deceased: Essentials.toReadableInt(deceased.toString()),
      deathRate: Essentials.toReadableInt(deathRate.toString()),
      recoveryRate: Essentials.toReadableInt(recoveryRate.toString()),
      newRecovered: Essentials.toReadableInt(newRecovered.toString()),
      newDeaths: Essentials.toReadableInt(newDeceased.toString()),
      newConfirmed: Essentials.toReadableInt(newConfirmed.toString()),
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

  int getStateNumber(String responseBody, String state) {
    int sum = 0;
    var decodedData = jsonDecode(responseBody);
    for (int i = 0; i < 38; i++) {
      if (state.compareTo(decodedData['statewise'][i]['state']) == 0) {
        sum = i;
      }
    }
    return sum;
  }

  CardDataType get cardDataLocal => _cardDataLocal;

  CardDataType get cardDataCountry => _cardDataCountry;

  CardDataType get cardDataGlobal => _cardDataGlobal;
}
