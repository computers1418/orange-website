import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/city_model.dart';

class CityController extends GetxController {
  var rxGetList = RxStatus.empty().obs;
  List<CityModel> cities = [];
  CityModel? selectCity;

  changeCity(value) {
    selectCity = value;
    update();
  }

  // int cityIndex = 0;
  //
  // changeCityIndex(value) {
  //   cityIndex = value;
  //   update();
  // }

  Future getCitiesList() async {
    // Dio dio = Dio();

    try {
      rxGetList.value = RxStatus.loading();
      // update();
      cities.clear();

      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'GET',
          Uri.parse(
              "https://api.dentistindiaplus.com:9091/api/city/by-brand-specialization?brandId=66bf0ea1ccfc3a63d4e41cb2&specializationId=66bf13f4dd3df57c89074f39"))
        ..headers.addAll(headers);

      var response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        if (jsonResponse["data"] != null) {
          for (var city in jsonResponse["data"]) {
            cities.add(CityModel.fromJson(city));
          }
          rxGetList.value = RxStatus.success();
        } else {
          // rxGetList.value = RxStatus.loading();
          rxGetList.value = RxStatus.success();
        }
      } else {
        rxGetList.value = RxStatus.success();
      }
    } on DioException catch (e) {
    } catch (e) {}

    update();
  }
}
