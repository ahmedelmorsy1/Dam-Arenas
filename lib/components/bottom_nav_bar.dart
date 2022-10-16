  import 'package:dam_arenas/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [          
          bottomNavBarItem('admin','assets/Icon_Explore.png'),
          bottomNavBarItem('user','assets/Icon_User.png'),
        ],
        currentIndex: controller.navVal,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(String text,String img) {
    return BottomNavigationBarItem(
          label: '',activeIcon: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(text),),
          icon: Padding(padding: const EdgeInsets.only(top: 25.0),
            child: Image.asset(img,fit: BoxFit.contain,width: 20,),
          ),
        );
  }
}
