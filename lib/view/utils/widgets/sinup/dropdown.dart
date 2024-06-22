// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors

import 'package:chat_app/view/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../color.dart';

class Dropdown_menu extends StatelessWidget {
  final bool Textfild;
  final String drop_name;
  final List<DropdownMenuItem<String>>? items;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final Widget? icon;

  const Dropdown_menu({
    super.key,
    required this.Textfild,
    this.items,
    this.onTap,
    required this.drop_name,
    this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          drop_name,
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
            borderRadius: BorderRadius.circular(Get.width / 50),
            color: (Textfild) ? AppColor.Textfild_color : AppColor.text_color,
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: Get.height / 15,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width / 50),
                border: Border.all(
                  color: (Textfild)
                      ? AppColor.active_Textfild_color
                      : AppColor.deactive_Textfild_color,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: DropdownButtonFormField<String>(
                  icon: icon,
                  onTap: onTap,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  items: items,
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
