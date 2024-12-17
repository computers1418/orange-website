import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../constants/common_methods.dart';
import '../model/schedule_model.dart';

class SetScheduleController extends GetxController {
  List<Datum> schduleList = [];

  RxBool isDataLoading = true.obs;

  Future<Map<String, dynamic>> getScheduleByDate(
      body, BuildContext context) async {
    schduleList = [];
    isDataLoading.value = true;
    update();

    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/doctor/schedule/getByDate'));

      request.headers.addAll(headers);

      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      resp = await CommonMethods.decodeStreamedResponse(response);
      print("ssdsdsd======${response.statusCode}");
      if (response.statusCode == 401) {
        schduleList = [];
      } else if (response.statusCode == 400) {
        schduleList = [];
      } else {
        if (response.statusCode == 200) {
          if (resp["data"] is List) {
            List<dynamic> dataList = resp["data"];
            schduleList = dataList.expand((innerList) {
              return (innerList as List)
                  .map<Datum>((data) => Datum.fromJson(data))
                  .toList();
            }).toList();
          } else {
            schduleList = [];
          }
        } else {
          schduleList = [];
        }
      }
    } catch (e) {}
    isDataLoading.value = false;
    update();
    return resp;
  }
}
