import 'package:login_test/home/data_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeData {
  Future<DataModel?> getData();
}

class HomeDataImpl extends HomeData {
  @override
  Future<DataModel?> getData() async {
    //https://run.mocky.io/v3/1319fc02-956a-4db1-b75d-e5100df82c8f
    var url =
        Uri.https('run.mocky.io', 'v3/1319fc02-956a-4db1-b75d-e5100df82c8f');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return dataModelFromJson(response.body);
    }
    return null;
  }
}
