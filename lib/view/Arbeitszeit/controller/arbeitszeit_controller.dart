import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_config.dart';
import 'package:hilfedienst/data/models/patient_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArbeitzeitController extends GetxController
    with StateMixin<List<PatientModel>> {
  Rxn<PatientModel> selectedPatient = Rxn<PatientModel>();
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    getPatients();
    super.onInit();
  }

  getPatients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(AppConfig.PATIENTS), headers: {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<PatientModel> patients = [];
      for (var item in data) {
        patients.add(PatientModel.fromMap(item));
      }
      patients.sort((a, b) => a.lastName.compareTo(b.lastName));
      patients.sort((a, b) => a.firstName.compareTo(b.firstName));
      change(patients, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error("Error"));
    }
  }

  void searchPatient(String value) async {
    if (value.isNotEmpty && value == searchController.text) {
      change(
          state
              ?.where((element) =>
                  (element.firstName + element.lastName).contains(value))
              .toList(),
          status: RxStatus.success());
    } else {
      getPatients();
      change(state, status: RxStatus.success());
    }
  }
}
