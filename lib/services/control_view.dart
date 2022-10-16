import 'package:dam_arenas/Screens/login_page.dart';
import 'package:dam_arenas/components/bottom_nav_bar.dart';
import 'package:dam_arenas/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/auth.dart';

class ControlView extends GetWidget<Auth> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<Auth>().user == null)
          ? LoginPage()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: BottomNavBar(),
                  ));
    });
  }
}