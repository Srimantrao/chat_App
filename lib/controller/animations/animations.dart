// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class Animations extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    animation = Tween<double>(begin: Get.height / 3, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
