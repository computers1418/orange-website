import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/common_methods.dart';
import '../model/medicine_model.dart';
import '../model/set_problem_model.dart';
import '../model/surgery_model.dart';
import '../model/test_model.dart';

class ProblemController extends GetxController {
  List<SetProblemModel> getProblemList = [];
  List<TestModel> getTestList = [];
  List<MedicineModel> getMedicineList = [];
  List<SurgeryModel> getSurgeryList = [];
  var isFetching = false.obs;
  var testIsFetching = false.obs;
  var medicineIsFetching = false.obs;
  var surgeryIsFetching = false.obs;

  Future<Map<String, dynamic>> getAllTestList(body) async {
    testIsFetching.value = true;
    getTestList = [];
    update();
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/doctor/test/list'));

      request.headers.addAll(headers);
      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        resp = await CommonMethods.decodeStreamedResponse(response);

        if (resp["data"] != null) {
          List<dynamic> dataList = resp["data"];
          getTestList =
              dataList.map((element) => TestModel.fromJson(element)).toList();
        } else {
          // problemList = [];
        }
      } else {
        // problemList = [];
      }
    } catch (e) {}
    testIsFetching.value = false;
    update();

    return resp;
  }

  Future<Map<String, dynamic>> getAllSetProblemList(body) async {
    getProblemList = [];
    isFetching.value = true;
    update();
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/doctor/problem/list'));

      request.headers.addAll(headers);
      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        resp = await CommonMethods.decodeStreamedResponse(response);

        if (resp["data"] != null) {
          List<dynamic> dataList = resp["data"];
          getProblemList = dataList
              .map((element) => SetProblemModel.fromJson(element))
              .toList();
        } else {
          // problemList = [];
        }
      } else {
        // problemList = [];
      }
    } catch (e) {}
    isFetching.value = false;
    update();

    return resp;
  }

  Future<Map<String, dynamic>> getAllMedicineList(body) async {
    medicineIsFetching.value = true;
    getMedicineList = [];
    update();
    // problemList = [];
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/doctor/medicine/list'));

      request.headers.addAll(headers);
      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        resp = await CommonMethods.decodeStreamedResponse(response);

        if (resp["data"] != null) {
          List<dynamic> dataList = resp["data"];
          getMedicineList = dataList
              .map((element) => MedicineModel.fromJson(element))
              .toList();
        } else {
          // problemList = [];
        }
      } else {
        // problemList = [];
      }
    } catch (e) {}
    medicineIsFetching.value = false;
    update();

    return resp;
  }

  Future<Map<String, dynamic>> getAllSurgeryList(body) async {
    surgeryIsFetching.value = true;
    getSurgeryList = [];
    update();
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/doctor/surgery/list'));

      request.headers.addAll(headers);
      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        resp = await CommonMethods.decodeStreamedResponse(response);

        if (resp["data"] != null) {
          List<dynamic> dataList = resp["data"];
          getSurgeryList = dataList
              .map((element) => SurgeryModel.fromJson(element))
              .toList();
        } else {
          // problemList = [];
        }
      } else {
        // problemList = [];
      }
    } catch (e) {}
    surgeryIsFetching.value = false;
    update();

    return resp;
  }
}
