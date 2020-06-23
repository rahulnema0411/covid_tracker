import 'dart:convert';
import 'package:covidtracker/models/table_data.dart';
import 'package:http/http.dart';

class TableDataList {
  List<TableData> _tableDataList;

  List<TableData> get tableDataList => _tableDataList;

  TableDataList(Response response) {
    String responseBody = response.body;
    _setDataToList(responseBody);
  }

  void _setDataToList(String responseBody) {
    var decodedData = jsonDecode(responseBody);

    for (int i = 0; i < 100; i++) {
      String location = decodedData['Countries'][i]['Country'];
      int confirmed = decodedData['Countries'][i]['TotalConfirmed'];
      int recovered = decodedData['Countries'][i]['TotalRecovered'];
      int deceased = decodedData['Countries'][i]['TotalDeaths'];

      _tableDataList.add(
        TableData(
          location: location,
          confirmed: confirmed,
          recovered: recovered,
          deceased: deceased,
        ),
      );
    }
  }
}
