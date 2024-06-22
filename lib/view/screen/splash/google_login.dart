// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:chat_app/controller/animations/animations.dart';
import 'package:chat_app/view/color.dart';
import 'package:chat_app/view/icons.dart';
import 'package:chat_app/view/images.dart';
import 'package:chat_app/view/screen/datacollction/sinup.dart';
import 'package:chat_app/view/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/sinup/sinup_button.dart';


class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin>
    with SingleTickerProviderStateMixin {
  Animations Anim = Get.put(Animations());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.backround_images,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<Animations>(
          builder: (GetxController controller) {
            return AnimatedBuilder(
              animation: Anim.animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(0, Anim.animation.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SinupButton(
                        icons: AppIcons.google_icons,
                        button_name: Google_Singin.button_name,
                      ),
                      SizedBox(height: Get.height / 50),
                      SinupButton(
                        onTap: () {
                          Get.to(
                            () => Sinup(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 800),
                          );
                        },
                        icons: AppIcons.profile_icons,
                        height_icons: 28,
                        width_icons: 28,
                        button_name: Google_Singin.button_name2,
                        color_icons: AppColor.text_color,
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
