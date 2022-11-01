import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import 'data_model.dart';
import 'home_data.dart';

class HomeViewModel {
  HomeData homeData;
  HomeViewModel(this.homeData);
  PublishSubject<String> timeSubject = PublishSubject<String>();
  PublishSubject<List<AssociatedDrug>> dataSubject =
      PublishSubject<List<AssociatedDrug>>();
  List<AssociatedDrug> listDrugData = [];
  void getDate() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    timeSubject.add(formattedDate);
  }

  void getData() async {
    DataModel? data = await homeData.getData();
    if (data != null) {
      if (kDebugMode) {
        data.problems?.forEach((problem) {
          problem.diabetes?.forEach((diabete) {
            diabete.medications?.forEach((element) {
              element.medicationsClasses?.forEach((medicationsClasse) {
                listDrugData.addAll(getDrug(medicationsClasse));
                dataSubject.add(listDrugData);
              });
            });
          });
        });
      }
    }
  }

  List<AssociatedDrug> getDrug(MedicationsClass medicationsClass) {
    List<AssociatedDrug> list = [];
    medicationsClass.className?.forEach((element) {
      list.addAll(element.associatedDrug ?? []);
      list.addAll(element.associatedDrug2 ?? []);
    });
    medicationsClass.className2?.forEach((element) {
      list.addAll(element.associatedDrug ?? []);
      list.addAll(element.associatedDrug2 ?? []);
    });

    return list;
  }
}
