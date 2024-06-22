// ignore_for_file: prefer_const_constructors

import 'package:chat_app/controller/API_Hendal/goChat%20_APi_Controller.dart';
import 'package:chat_app/controller/API_Hendal/showgloabal_chat.dart';
import 'package:chat_app/view/color.dart';
import 'package:chat_app/view/icons.dart';
import 'package:chat_app/view/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class communication extends StatefulWidget {
  final String name;

  const communication({super.key, required this.name});

  @override
  State<communication> createState() => _communicationState();
}

class _communicationState extends State<communication> {
  TextEditingController chat = Get.put(TextEditingController());

  ShowgloabalChat showchat = Get.put(ShowgloabalChat());
  GochatApiController showchats = Get.put(GochatApiController());

  @override
  void initState() {
    Future.microtask(() async {
      await showchat.showgloabal_Fuction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: Get.width / 25),
            Container(
              width: Get.width / 1.4,
              height: Get.height / 15,
              decoration: BoxDecoration(
                color: AppColor.Textfild_color,
                borderRadius: BorderRadius.circular(Get.width / 50),
                border: Border.all(
                  color: AppColor.active_Textfild_color,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: chat,
                  decoration: InputDecoration(
                    hintText: Commnications_text.Enter_The_Message,
                    hintStyle: TextStyle(
                      color: AppColor.active_Textfild_color,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(AppIcons.Vector),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(AppIcons.photo),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showchats.SinupApiController_faction(textvar: chat.text);
              },
              child: Container(
                width: Get.width / 7,
                height: Get.height / 15,
                decoration: BoxDecoration(
                  color: AppColor.active_Textfild_color,
                  borderRadius: BorderRadius.circular(Get.width / 50),
                  border: Border.all(
                    color: AppColor.active_Textfild_color,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(AppIcons.Sent),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height / 12),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.active_Textfild_color,
          title: SizedBox(
            height: Get.height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height / 80),
                    Text(
                      Commnications_text.Group_Chat,
                      style: TextStyle(
                        fontSize: Get.width / 13,
                        color: AppColor.text_color,
                        fontFamily: GoogleFonts.cherrySwash().fontFamily,
                      ),
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: Get.width / 25,
                        color: AppColor.text_color,
                        fontFamily: GoogleFonts.exo().fontFamily,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(AppIcons.fluent),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.text_color,
        ),
        child: Obx(
          () {
            if (showchat.isloading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      showchat.showgloabal_data['data'][0]['user_details'][0]
                          ['email'],
                    ),
                    Text(
                      showchat.showgloabal_data['data'][0]['user_details'][0]
                          ['email'],
                    ),
                    Text(
                      showchat.showgloabal_data['data'][0]['user_details'][0]
                          ['email'],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
