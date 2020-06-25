import 'package:covidtracker/models/card_data_type.dart';
import 'package:http/http.dart' as http;
import 'card_data.dart';

class Statistics {
  http.Response _responseGlobal;
  http.Response _responseNational;
  http.Response _responseStateLevel;
  http.Response _responseStateLevel1;

  Statistics();

  Future<void> getStatistics() async {
    _responseGlobal =
        await http.get('https://corona.lmao.ninja/v2/all?yesterday');

    _responseNational =
        await http.get('https://corona.lmao.ninja/v2/countries?yesterday&sort');

    _responseStateLevel = await http
        .get('https://covid-19india-api.herokuapp.com/v2.0/state_data');
    _responseStateLevel1 =
        await http.get('https://api.covid19india.org/data.json');
  }

  CardDataType getStateLevelStatistics(String country, String state) {
    CardData cardData =
        CardData.state(_responseStateLevel, _responseStateLevel1, state);
    return cardData.cardDataLocal;
  }

  CardDataType getCountryStatistics(String country) {
    CardData cardData = CardData.country(_responseNational, country);
    return cardData.cardDataCountry;
  }

  CardDataType getGlobalStatistics() {
    CardData cardData = CardData.global(_responseGlobal);
    return cardData.cardDataGlobal;
  }
}
