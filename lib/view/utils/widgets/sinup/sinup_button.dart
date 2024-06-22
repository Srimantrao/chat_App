// ignore_for_file: non_constant_identifier_names

import 'package:chat_app/view/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../icons.dart';
import '../../../string.dart';

class SinupButton extends StatefulWidget {
  final String? icons;
  final double? height_icons;
  final double? width_icons;
  final Color? color_icons;
  final String button_name;
  final void Function()? onTap;

  const SinupButton({
    super.key,
    this.icons,
    this.height_icons,
    this.width_icons,
    this.color_icons,
    required this.button_name,
    this.onTap,
  });

  @override
  State<SinupButton> createState() => _SinupButtonState();
}

class _SinupButtonState extends State<SinupButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: Get.height / 15,
        width: Get.width / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width / 25),
          color: AppColor.button_color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 20,
            vertical: Get.height / 80,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                widget.icons ?? '',
                color: widget.color_icons,
                height: widget.height_icons,
                width: widget.width_icons,
              ),
              Text(
                widget.button_name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.text_color,
                  fontSize: Get.width / 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
