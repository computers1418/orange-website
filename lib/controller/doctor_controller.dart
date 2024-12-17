import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants/common_methods.dart';
import '../model/doctor_model.dart';
import 'package:http/http.dart' as http;

class DoctorController extends GetxController {
  List<DoctorModel> doctorList = [];
  DoctorModel? selectDoctor;
  DoctorModel? doctorProfile;
  var isFetching = false.obs;

  changeDoctor(DoctorModel doctor) {
    selectDoctor = doctor;
    update();
  }

  changeDoctorProfile(DoctorModel doctor) {
    doctorProfile = doctor;
    update();
  }

  Future<Map<String, dynamic>> getAllDoctorList() async {
    isFetching.value = true;
    doctorList = [];

    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request('GET',
          Uri.parse('https://api.dentistindiaplus.com:9091/api/doctor/get'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      resp = await CommonMethods.decodeStreamedResponse(response);

      if (response.statusCode == 401) {
      } else if (response.statusCode == 400) {
      } else {
        if (response.statusCode == 200) {
          if (resp["data"] != null) {
            List<dynamic> dataList = resp["data"];
            doctorList = dataList
                .map((element) => DoctorModel.fromJson(element))
                .toList();
          } else {}
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
    isFetching.value = false;
    update();
    return resp;
  }
}
