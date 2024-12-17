import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/common_methods.dart';
import 'doctor_controller.dart';

class TreatmentController extends GetxController {
  List<String> treatmentModeList = [];
  String treatment = "";
  DoctorController doctorController = Get.find<DoctorController>();

  onChangeTreatment(value) {
    treatment = value;
    update();
  }

  Future<Map<String, dynamic>> getTreatmentModesByDoctorId(
      BuildContext context, String doctorId) async {
    treatmentModeList = [];
    update();
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/treatment-mode/detailsByDoctorId/${doctorId}'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 401) {
        // Handle unauthorized error
      } else if (response.statusCode == 400) {
        // treatment = false;
      } else {
        if (response.statusCode == 200) {
          resp = await CommonMethods.decodeStreamedResponse(response);

          // detailsId = resp["data"]["_id"];
          treatmentModeList = List<String>.from(resp['data']['treatmentMode']);
          update();
        } else {
          if (kDebugMode) {
            print(response.reasonPhrase);
          }
        }
      }
    } catch (e) {
      if (e is SocketException) {
        print('Network error: ${e.message}');
      } else {
        print('An error occurred: $e');
      }
    }
    return resp;
  }
}
