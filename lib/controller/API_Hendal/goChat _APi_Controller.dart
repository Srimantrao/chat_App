// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:chat_app/view/icons.dart';
import 'package:chat_app/view/url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GochatApiController extends GetxController {
  var isloding = false.obs;
  var data;

  Future SinupApiController_faction({required String textvar}) async {
    try {
      if (kDebugMode) {
        print('text :- $textvar');
      }

      Map<String, dynamic> body = {
        'name': textvar,
      };

      if (kDebugMode) {
        print(body);
      }

      final responce = await http.post(
        Uri.parse(AppUrl.createglobaluser),
        headers: {'AuthToken': '2ec26ad9-e039-445e-915e-zACl56sr2q'},
        body: body,
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        data = jsonDecode(responce.body);
        if (kDebugMode) {
          print("Data :-$data");
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
      isloding.value = false;
    }
  }
}
