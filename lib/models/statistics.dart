import 'dart:convert';

import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/models/table_data.dart';
import 'package:http/http.dart' as http;

import 'card_data.dart';

class Statistics {
  http.Response _responseGlobal;
  http.Response _responseNational;
  http.Response _responseStateLevel; //get table data from this one only
  http.Response _responseDistrictLevel;

  Statistics();

  Future<void> getStatistics() async {
    _responseGlobal =
        await http.get('https://corona.lmao.ninja/v2/all?yesterday');

    _responseNational =
        await http.get('https://corona.lmao.ninja/v2/countries?yesterday&sort');

    _responseStateLevel =
        await http.get('https://api.covid19india.org/data.json');

    _responseDistrictLevel =
        await http.get('https://api.covid19india.org/state_district_wise.json');
  }

  CardDataType getStateLevelStatistics(String country, String state) {
    CardData cardData = CardData.state(_responseStateLevel, state);
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

  http.Response get responseGlobal => _responseGlobal;

  http.Response get responseNational => _responseNational;

  http.Response get responseStateLevel => _responseStateLevel;

  http.Response get responseDistrictLevel => _responseDistrictLevel;

  List<TableData> getTableDataListCountry() {
    var decodedData = jsonDecode(_responseNational.body);
    List<TableData> tableDataList = [];
    for (int i = 0; i < decodedData.length; i++) {
      String location = decodedData[i]['country'];
      int confirmed = decodedData[i]['cases'];
      int recovered = decodedData[i]['recovered'];
      int deceased = decodedData[i]['deaths'];
      TableData tableData = TableData(
          location: location,
          recovered: recovered,
          confirmed: confirmed,
          deceased: deceased);
      tableDataList.add(tableData);
    }
    return tableDataList;
  }

  List<TableData> getTableDataListState() {
    var decodedData = jsonDecode(_responseStateLevel.body);
    List<TableData> tableDataList = [];
    for (int i = 0; i < decodedData['statewise'].length; i++) {
      String location = decodedData['statewise'][i]['state'];
      int confirmed = int.parse(decodedData['statewise'][i]['confirmed']);
      int recovered = int.parse(decodedData['statewise'][i]['recovered']);
      int deceased = int.parse(decodedData['statewise'][i]['deaths']);

      tableDataList.add(TableData(
          location: location,
          recovered: recovered,
          confirmed: confirmed,
          deceased: deceased));
    }
    return tableDataList;
  }

  List<TableData> getTableDataListDistrict() {
    List<TableData> tableDataList = [];
    var decodedData = jsonDecode(_responseDistrictLevel.body);
    Map<String, dynamic> aa = decodedData['Madhya Pradesh']['districtData'];
    print(aa == null);
    aa.forEach((key, value) {
      String location = key;
      var data = value;
      int confirmed = data['confirmed'];
      int recovered = data['recovered'];
      int deceased = data['deceased'];

      tableDataList.add(
        TableData(
            location: location,
            confirmed: confirmed,
            recovered: recovered,
            deceased: deceased),
      );
    });
    return tableDataList;
  }
}
