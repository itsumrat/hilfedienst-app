import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_config.dart';
import 'package:hilfedienst/data/models/patient_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientInfoController extends GetxController {
  Rxn<PatientModel> patientInfo = Rxn<PatientModel>();
  late final double hour;
  @override
  void onInit() async {
    patientInfo.value = Get.arguments['patient'];
    hour = Get.arguments['hour'];
    super.onInit();
  }

  Future<bool> sendBookingRequest({required File image}) async {
    if (patientInfo.value == null) return false;
    return await Get.showOverlay<bool>(
      asyncFunction: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var imageBase64Data = base64Encode(image.readAsBytesSync());
        Map<String, dynamic> body = {
          "report_date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
          "hours": hour,
          "patient_id": patientInfo.value?.id,
          'sign_image': imageBase64Data,
        };
        var response = await http.post(
          Uri.parse(AppConfig.PATIENTS_BOOKING),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Bearer ${prefs.getString("token")}',
          },
          body: jsonEncode(body),
        );
        log(response.request!.url.toString(), name: "URL");
        log(response.body, name: "Response");
        log(response.statusCode.toString(), name: "Status Code");
        log(body.toString(), name: "Reason Phrase");
        if (response.statusCode == 200 || response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      },
      loadingWidget: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
