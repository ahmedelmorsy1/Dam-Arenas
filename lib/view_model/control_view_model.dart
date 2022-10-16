import 'package:dam_arenas/Screens/admin_page.dart';
import 'package:dam_arenas/Screens/home_modified.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;

  get navVal => _navigatorValue;
  Widget _currentScreen = AdminPage();
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedVal){
    _navigatorValue = selectedVal;
    switch(selectedVal){
            case 0:
            _currentScreen = AdminPage();
            break;
            case 1:
            _currentScreen = HomePageModified();
            break;
          }
    update();
  }
}