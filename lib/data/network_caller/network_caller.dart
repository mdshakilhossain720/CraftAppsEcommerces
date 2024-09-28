import 'dart:convert';
import 'dart:developer';

import 'package:craftproject/app.dart';
import 'package:craftproject/data/model/network_response.dart';
import 'package:craftproject/presentation/screens/email_verifaction.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class NetWorkCaller {
  /// Get Method
  static Future<NetWorkResponse> getRequest({required String url}) async {
    final Response response = await get(Uri.parse(url));

    try {
      log(url);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetWorkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodeData);
      } else if (response.statusCode == 401) {
        _goToSignInScreen();
        return NetWorkResponse(
            responseCode: response.statusCode,
            isSuccess: false,
            errorMessage: "Unauthorized access. Redirecting to sign-in.");
      } else {
        return NetWorkResponse(
            responseCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      return NetWorkResponse(
          responseCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  /// Post Method

  static Future<NetWorkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    final Response response = await post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: body);
    log(response.statusCode.toString());
    log(response.body.toString());

    try {
      log(url);

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetWorkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodeData);
      } else if (response.statusCode == 401) {
        _goToSignInScreen();
        return NetWorkResponse(
            responseCode: response.statusCode,
            isSuccess: false,
            errorMessage: "Unauthorized access. Redirecting to sign-in.");
      } else {
        return NetWorkResponse(
            responseCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      return NetWorkResponse(
          responseCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  /// Route Method
  static void _goToSignInScreen() {
    Navigator.push(CraftBy.navigationkey.currentState!.context,
        MaterialPageRoute(builder: (_) => EmailVerifaction()));
  }
}
