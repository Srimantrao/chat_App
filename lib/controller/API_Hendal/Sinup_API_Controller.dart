// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:chat_app/view/url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SinupApiController extends GetxController {
  var isLoding = false.obs;
  var Sinup_data;

  Future<void> SinupApiController_faction({
    required String fullName,
    required String email,
    required String phone,
    required String gender,
    required String address,
    required String city,
    required String state,
    required String dateOfBirth,
  }) async {
    final url = Uri.parse("https://api.baii.me/api/createglobaluser");
    final headers = {
      "AuthToken": "2ec26ad9-e039-445e-915e-zACl56sr2q",
      "Content-Type": "application/json"
    };

    final body = json.encode({
      "name": fullName,
      "email": email,
      "phone_number": phone,
      "gender": gender,
      "address": address,
      "city": city,
      "state": state,
      "date_of_birth": dateOfBirth,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print("Sign Up Successful: ${response.body}");
      } else {
        print("Sign Up Failed: ${response.statusCode} ${response.body}");

        if (response.statusCode == 401) {
          print("Unauthorized Request: Check your authorization token");
        }
      }
    } catch (e) {
      print("Error during sign up: $e");
    }
  }
}
