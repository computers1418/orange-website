import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/common_methods.dart';

class ConsultationController extends GetxController {
  String consultationId = "";

  Future<Map<String, dynamic>> createConsult(
      body, context, VoidCallback callback) async {
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/user/consultation/createconsult'));

      request.headers.addAll(headers);

      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      resp = await CommonMethods.decodeStreamedResponse(response);
      if (response.statusCode == 401) {
      } else if (response.statusCode == 403) {
        // showToast(fToast, resp["message"], true);
        Fluttertoast.showToast(
            msg: resp["message"], toastLength: Toast.LENGTH_LONG);
      } else {
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: resp["message"], toastLength: Toast.LENGTH_LONG);
          consultationId = resp["data"]["_id"];
          update();
          callback();
          // callback(resp["data"]);
        } else {
          Fluttertoast.showToast(
              msg: resp["message"], toastLength: Toast.LENGTH_LONG);
          if (kDebugMode) {
            print(response.reasonPhrase);
          }
        }
      }
    } catch (e) {}
    return resp;
  }

  Future<Map<String, dynamic>> requestNewOtp(
      context, VoidCallback callback) async {
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/user/consultation/requestNewOtp'));

      request.headers.addAll(headers);

      request.body = jsonEncode({"consultationId": consultationId});

      http.StreamedResponse response = await request.send();
      resp = await CommonMethods.decodeStreamedResponse(response);
      if (response.statusCode == 401) {
      } else if (response.statusCode == 403) {
        // showToast(fToast, resp["message"], true);
        Fluttertoast.showToast(
            msg: resp["message"], toastLength: Toast.LENGTH_LONG);
      } else {
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: resp["message"], toastLength: Toast.LENGTH_LONG);
          callback();
        } else {
          Fluttertoast.showToast(
              msg: resp["message"], toastLength: Toast.LENGTH_LONG);
          if (kDebugMode) {
            print(response.reasonPhrase);
          }
        }
      }
    } catch (e) {}
    return resp;
  }

  Future<Map<String, dynamic>> otpVerification(
      otp, context, VoidCallback callback) async {
    Map<String, dynamic> body = {"consultationId": consultationId, "otp": otp};
    Map<String, dynamic> resp = {};
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'PUT',
          Uri.parse(
              'https://api.dentistindiaplus.com:9091/api/user/consultation/otpverification'));

      request.headers.addAll(headers);

      request.body = jsonEncode(body);

      http.StreamedResponse response = await request.send();
      resp = await CommonMethods.decodeStreamedResponse(response);
      if (response.statusCode == 401) {
      } else if (response.statusCode == 403) {
        Fluttertoast.showToast(
            msg: resp["message"], toastLength: Toast.LENGTH_LONG);
      } else {
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: resp["message"], toastLength: Toast.LENGTH_LONG);

          callback();
        } else {
          Fluttertoast.showToast(
              msg: resp["message"], toastLength: Toast.LENGTH_LONG);
          if (kDebugMode) {
            print(response.reasonPhrase);
          }
        }
      }
    } catch (e) {}
    return resp;
  }
}
