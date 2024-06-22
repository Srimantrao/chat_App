// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';

import 'package:chat_app/view/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShowgloabalChat extends GetxController {
  var isloading = false.obs;
  var showgloabal_data;

  Future showgloabal_Fuction() async {
    try {
      isloading.value = true;

      final responce = await http.get(
        Uri.parse(AppUrl.showglobalchat),
        headers: {
          'AuthToken': '2ec26ad9-e039-445e-915e-zACl56sr2q',
        },
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        showgloabal_data = jsonDecode(responce.body);
        print(jsonDecode(responce.body));
      } else {
        throw {
          "Error this showgloabal_data :- ${responce.body} , ${responce.statusCode}",
        };
      }
    } finally {
      isloading.value = false;
    }
  }
}
