// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../color.dart';
import '../../../string.dart';

class Textfilds extends StatelessWidget {
  final TextEditingController controller;
  final String fildname;
  final String hinttext;
  final bool Textfild;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final double? sizesheight;

  const Textfilds({
    super.key,
    required this.fildname,
    required this.hinttext,
    required this.Textfild,
    this.onTap,
    this.keyboardType,
    this.suffixIcon,
    required this.controller,
    this.sizesheight,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fildname,
          style: TextStyle(
            color: AppColor.button_color,
            fontFamily: GoogleFonts.exo().fontFamily,
            fontSize: Get.width / 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Get.height / 70),
        Container(
          height: Get.height / 14,
          width: Get.width,
          decoration: BoxDecoration(
            color: (Textfild) ? AppColor.Textfild_color : AppColor.text_color,
            borderRadius: BorderRadius.circular(
              Get.width / 40,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: Get.height / 15,
              width: Get.width,
              decoration: BoxDecoration(
                color:
                    (Textfild) ? AppColor.Textfild_color : AppColor.text_color,
                borderRadius: BorderRadius.circular(
                  Get.width / 40,
                ),
                border: Border.all(
                  color: (Textfild)
                      ? AppColor.active_Textfild_color
                      : AppColor.deactive_Textfild_color,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 40),
                child: TextField(
                  style: TextStyle(
                    fontSize: Get.width / 23,
                    fontFamily: GoogleFonts.exo().fontFamily,
                  ),
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText ?? false,
                  onTap: onTap,
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    hintText: hinttext,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

//Phone fild
class Phonefild extends StatelessWidget {
  final bool Textfild;
  final void Function()? onTap;

  const Phonefild({super.key, required this.Textfild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Sinup_String.Phone,
          style: TextStyle(
            color: AppColor.button_color,
            fontFamily: GoogleFonts.exo().fontFamily,
            fontSize: Get.width / 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Get.height / 70),
        Container(
          height: Get.height / 14,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Get.width / 50,
            ),
            color: (Textfild) ? AppColor.Textfild_color : AppColor.text_color,
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: IntlPhoneField(
              onTap: onTap,
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    (Textfild) ? AppColor.Textfild_color : AppColor.text_color,
                counterText: '',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: (Textfild)
                        ? AppColor.active_Textfild_color
                        : AppColor.deactive_Textfild_color,
                  ),
                  borderRadius: BorderRadius.circular(
                    Get.width / 50,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: (Textfild)
                        ? AppColor.active_Textfild_color
                        : AppColor.deactive_Textfild_color,
                  ),
                  borderRadius: BorderRadius.circular(
                    Get.width / 50,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
