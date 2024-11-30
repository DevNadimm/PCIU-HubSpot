import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pciu_hubspot/controller/shared_preferences_controller/auth_controller_prefs.dart';
import 'package:pciu_hubspot/core/network/network_response.dart';

class NetworkCaller {
  NetworkCaller._();

  static Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse(url);
      String? token = await AuthController.getAccessToken();
      final headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      final response = await http.put(
        uri,
        body: body != null ? jsonEncode(body) : null,
        headers: headers,
      );

      _printResponse(url, response, token);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: 500,
        isSuccess: false,
        errorMessage: 'An error occurred: $e',
      );
    }
  }

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse(url);
      String? token = await AuthController.getAccessToken();
      final headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      final response = await http.post(
        uri,
        body: body != null ? jsonEncode(body) : null,
        headers: headers,
      );

      _printResponse(url, response, token);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: 500,
        isSuccess: false,
        errorMessage: 'An error occurred: $e',
      );
    }
  }

  static Future<NetworkResponse> getRequest({
    required String url,
  }) async {
    try {
      final uri = Uri.parse(url);
      String? token = await AuthController.getAccessToken();
      final headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      final response = await http.get(
        uri,
        headers: headers,
      );

      _printResponse(url, response, token);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: 500,
        isSuccess: false,
        errorMessage: 'An error occurred: $e',
      );
    }
  }

  static _printResponse(
      String url, http.Response response, String? token) {
    debugPrint(
      'URL: $url\nRESPONSE CODE: ${response.statusCode}\nTOKEN: ${token ?? "No Token"}\nBODY: ${response.body}\n',
    );
  }
}
