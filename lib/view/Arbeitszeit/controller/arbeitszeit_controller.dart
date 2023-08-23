import 'dart:convert';

import 'package:get/get.dart';
import 'package:hilfedienst/app_config.dart';
import 'package:hilfedienst/data/models/patient_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArbeitzeitController extends GetxController
    with StateMixin<List<PatientModel>> {
  Rxn<PatientModel> selectedPatient = Rxn<PatientModel>();

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(AppConfig.PATIENTS), headers: {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<PatientModel> patients = [];
      for (var item in data.first) {
        patients.add(PatientModel.fromMap(item));
      }
      change(patients, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error("Error"));
    }
    super.onInit();
  }
}
