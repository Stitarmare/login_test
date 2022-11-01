import 'package:flutter_test/flutter_test.dart';
import 'package:login_test/home/data_model.dart';
import 'package:login_test/home/home_data.dart';
import 'package:login_test/home/home_view_model.dart';

void main() {
  HomeViewModel? homeViewModel;

  setUpAll(() {
    MockDataModel mockDataModel = MockDataModel();
    homeViewModel = HomeViewModel(mockDataModel);
  });
  test('Test api data', (() {
    homeViewModel?.dataSubject.listen(expectAsync1((e) {
      expect(e.length, homeViewModel?.listDrugData.length);
    }));
    homeViewModel?.getData();
  }));
}

class MockDataModel extends HomeData {
  @override
  Future<DataModel?> getData() async {
    String jsonString =
        "{\"problems\":[{\"Diabetes\":[{\"medications\":[{\"medicationsClasses\":[{\"className\":[{\"associatedDrug\":[{\"name\":\"asprin\",\"dose\":\"\",\"strength\":\"500mg\"}],\"associatedDrug#2\":[{\"name\":\"somethingElse\",\"dose\":\"\",\"strength\":\"500mg\"}]}],\"className2\":[{\"associatedDrug\":[{\"name\":\"asprin\",\"dose\":\"\",\"strength\":\"500mg\"}],\"associatedDrug#2\":[{\"name\":\"somethingElse\",\"dose\":\"\",\"strength\":\"500mg\"}]}]}]}],\"labs\":[{\"missing_field\":\"missing_value\"}]}],\"Asthma\":[{}]}]}";
    return dataModelFromJson(jsonString);
  }
}
