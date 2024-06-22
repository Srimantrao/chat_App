// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:chat_app/view/url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SinupApiController extends GetxController {
  var isLoding = false.obs;
  var Sinup_data;

  Future SinupApiController_faction({
    required String FullName,
    required String Phone,
    required String Email,
    required String Password,
    required String Address,
  }) async {
    try {
      if (kDebugMode) {
        print('FirstName :- $FullName');
        print('Phonenumber :- $Phone');
        print('LastName :- $Email');
        print('Email :- $Password');
        print('Password :- $Address');
      }

      Map<String, dynamic> body = {
        'name': FullName,
        'phone_number': Phone,
        'email': Email,
        'address': Address,

      };

      if (kDebugMode) {
        print(body);
      }

      final responce = await http.post(
        Uri.parse(AppUrl.createglobaluser),
        headers: {
         'AuthToken' : '2ec26ad9-e039-445e-915e-zACl56sr2q'
        },
        body: body,
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        Sinup_data = jsonDecode(responce.body);
        if (kDebugMode) {
          print("Sinup Data :-$Sinup_data");
        }
      } else {
        throw {
          "Sinup Data Error this :- ${responce.statusCode} , ${responce.body}"
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print("Sinup Data Error = $e");
      }
    } finally {
      isLoding.value = false;
    }
  }
}
